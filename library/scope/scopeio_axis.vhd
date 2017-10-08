library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hdl4fpga;
use hdl4fpga.std.all;

entity scopeio_axis is
	generic (
		fonts           : std_logic_vector;
		vt_scales       : scale_vector;
		vt_num_of_seg   : natural := 1;
		vt_div_per_seg  : natural := 1;
		vt_mark_per_seg : natural := 1;
		hz_scales       : scale_vector;
		hz_num_of_seg   : natural := 1;
		hz_div_per_seg  : natural := 1;
		hz_mark_per_seg : natural := 5);
	port (
		video_clk    : in  std_logic;
		win_x        : in  std_logic_vector;
		win_y        : in  std_logic_vector;

		axis_hztl    : in  std_logic;
		axis_sgmt    : in  std_logic_vector;
		axis_on      : in  std_logic;
		axis_scale   : in  std_logic_vector(4-1 downto 0);
		axis_dot     : out std_logic);
end;

architecture def of scopeio_axis is

	constant font_width   : natural := 8;
	constant font_height  : natural := 8;
	constant code_size    : natural := 4;
	constant num_of_digit : natural := 4;

	function marker (
		constant scales      : scale_vector;
		constant num_of_seg  : natural;
		constant div_per_seg : natural;
		constant sign        : boolean := false)
		return   std_logic_vector is
		constant num         : natural := num_of_seg*div_per_seg+1;
		variable retval      : unsigned(num*scales'length*num_of_digit*code_size-1 downto 0) := (others => '1');
		variable aux         : real_vector(0 to scales'length-1);
	begin
		for j in 0 to scales'length-1 loop
			aux(j) := scales(j).from;
		end loop;
		for i in 0 to num-1 loop
			for j in 0 to scales'length-1 loop
				retval := retval sll (num_of_digit*code_size);
				retval(num_of_digit*code_size-1 downto 0) := unsigned(to_bcd(aux(j), num_of_digit*code_size, sign));
			end loop;
			for j in 0 to scales'length-1 loop
				aux(j) := aux(j) + scales(j).step;
			end loop;
		end loop;
		return std_logic_vector(retval);
	end;

	signal mark      : std_logic_vector(0 to unsigned_num_bits(vt_num_of_seg*vt_div_per_seg+1+hz_num_of_seg*hz_div_per_seg+1-1)-1);
	signal sgmt      : std_logic_vector(axis_sgmt'range);
	signal win_x4    : std_logic;

	signal char_addr : std_logic_vector(0 to axis_scale'length+mark'length);
	signal char_code : std_logic_vector(2*code_size-1 downto 0);
	signal char_line : std_logic_vector(0 to font_width-1);
	signal char_dot  : std_logic_vector(0 to 1-1);
	signal mark_on   : std_logic;
	signal dot_on    : std_logic;

	signal sel_code  : std_logic_vector(0 to 0);
	signal sel_line  : std_logic_vector(0 to char_code'length/2+unsigned_num_bits(font_width-1)-1);
	signal sel_dot   : std_logic_vector(unsigned_num_bits(font_width-1)-1 downto 0);
	signal sel_winy  : std_logic_vector(3-1 downto 0);

	signal mark_y    : std_logic;
	signal aon_y     : std_logic;

begin
	mark_y <= setif(win_y(5-1 downto 3)=(5-1 downto 3 => '0'));
	alignrow_e : entity hdl4fpga.align
	generic map (
		n => 1,
		d => (0 => 4))
	port map (
		clk => video_clk,
		di(0) => mark_y,
		do(0) => aon_y);

	process (video_clk)
		variable sgmt_x : unsigned(unsigned_num_bits(hz_mark_per_seg-1)-1 downto 0);
		variable next_x : std_logic;
		variable aon    : std_logic;

		function init_start
			return natural_vector is
			variable retval : natural_vector(0 to hz_num_of_seg-1);
		begin
			for i in retval'range loop
				retval(i) := i*hz_div_per_seg;
			end loop;
			return retval;
		end;

		constant start : natural_vector(0 to hz_num_of_seg-1) := init_start;

	begin
		if rising_edge(video_clk) then
			mark_on <= setif(sgmt_x=(sgmt_x'range => '0')) and aon;
			if axis_on='0' then
				sgmt_x := (others => '0');
				mark   <= std_logic_vector(to_unsigned(start(to_integer(unsigned(axis_sgmt))), mark'length));
			elsif axis_hztl='1' then 
				if next_x='1' then
					if to_integer(sgmt_x)=hz_mark_per_seg-1 then
						sgmt_x := (others => '0');
						mark   <= std_logic_vector(unsigned(mark) + 1);
					else
						sgmt_x := sgmt_x + 1;
					end if;
				end if;
			else
				mark <= std_logic_vector(
					resize(unsigned(win_y(win_y'left downto 5)),mark'length)+
					hz_num_of_seg*hz_div_per_seg+1);
			end if;
			aon  := axis_on and aon_y;
			next_x := setif(win_x(5-1 downto 0)=(1 to 5 => '1'));
		end if;
	end process;

	char_addr <= mark & axis_scale & win_x4;
	charrom : entity hdl4fpga.rom
	generic map (
		synchronous => 2,
		bitrom => 
			marker (
				scales      => hz_scales,
				num_of_seg  => hz_num_of_seg,
				div_per_seg => hz_div_per_seg) &
			marker (
				scales      => vt_scales,
				num_of_seg  => vt_num_of_seg,
				div_per_seg => vt_div_per_seg))
	port map (
		clk  => video_clk,
		addr => char_addr,
		data => char_code);

	sgmt_e : entity hdl4fpga.align
	generic map (
		n => axis_sgmt'length,
		d => (1 to axis_sgmt'length => 3))
	port map (
		clk => video_clk,
		di  => axis_sgmt,
		do  => sgmt);

	winx_e : entity hdl4fpga.align
	generic map (
		n => 6,
		d => (0 to 2 => 6,  3 => 4, 4 => 2, 5 => 4))
	port map (
		clk => video_clk,
		di(0)  => win_x(0),
		di(1)  => win_x(1),
		di(2)  => win_x(2),
		di(3)  => win_x(3),
		di(4)  => win_x(4),
		di(5)  => mark_on,
		do(0)  => sel_dot(0),
		do(1)  => sel_dot(1),
		do(2)  => sel_dot(2),
		do(3)  => sel_code(0),
		do(4)  => win_x4,
		do(5)  => dot_on);

	winy_e : entity hdl4fpga.align
	generic map (
		n => 3,
		d => (0 to 2 => 6))
	port map (
		clk => video_clk,
		di  => win_y(3-1 downto 0),
		do  => sel_winy);

	sel_line <= word2byte(char_code, not sel_code) & sel_winy;
	cgarom : entity hdl4fpga.rom
	generic map (
		synchronous => 2,
		bitrom => fonts)
	port map (
		clk  => video_clk,
		addr => sel_line,
		data => char_line);

	char_dot <= word2byte(char_line, not sel_dot);
	axis_dot <= dot_on and char_dot(0);

end;
