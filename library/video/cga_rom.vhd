library ieee;
use ieee.std_logic_1164.all;

library hdl4fpga;
use hdl4fpga.std.all;
use hdl4fpga.cgafont.all;

entity cga_rom is
	generic (
		font_bitrom : std_logic_vector;
		font_height : natural;
		font_width  : natural);
	port (
		clk       : in  std_logic;
		char_col  : in  std_logic_vector;
		char_row  : in  std_logic_vector;
		char_code : in  std_logic_vector;
		char_dot  : out std_logic);
end;

architecture beh of cga_rom is

	signal font_code : std_logic_vector(ascii'range);
	signal font_row  : std_logic_vector(unsigned_num_bits(font_height-1)-1 downto 0);
	signal font_col  : std_logic_vector(unsigned_num_bits(font_width-1)-1  downto 0);

	signal font_addr : std_logic_vector(font_code'length+font_row'length-1 downto 0);
	signal font_line : std_logic_vector(0 to font_width-1);
	signal font_dot  : std_logic_vector(0 to 0);

begin

	font_addr <= char_code & char_row;

	cgarom_e : entity hdl4fpga.rom
	generic map (
		bitrom      => font_bitrom,
		synchronous => 2)
	port map (
		clk  => clk,
		addr => font_addr,
		data => font_line);

	align_x : entity hdl4fpga.align
	generic map (
		n => font_col'length,
		d => (font_col'range => 2))
	port map (
		clk => clk,
		di  => char_col,
		do  => font_col);

	font_dot <= word2byte(font_line, font_col);
	char_dot <= font_dot(0);
end;