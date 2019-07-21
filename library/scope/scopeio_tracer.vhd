library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hdl4fpga;
use hdl4fpga.std.all;

entity scopeio_tracer is
	generic (
		latency   : natural;
		vt_height : natural);
	port (
		clk       : in  std_logic;
		ena       : in  std_logic;
		y         : in  std_logic_vector;
		offsets   : in  std_logic_vector;
		samples1  : in  std_logic_vector;
		samples2  : in  std_logic_vector;
		dots      : out std_logic_vector);
end;

architecture def of scopeio_tracer is
	signal dots1 : std_logic_vector(0 to dots'length-1);
begin

	trace_g : for i in dots'range generate

		signal y1   : signed(0 to samples1'length/dots'length-1);
		signal y2   : signed(0 to samples2'length/dots'length-1);
		signal bias : signed(0 to offsets'length/dots'length-1);
		signal row  : signed(y'range);

	begin

		y1   <= signed(word2byte(samples1, i, y1'length));
		y2   <= signed(word2byte(samples2, i, y2'length));
		bias <= signed(word2byte(offsets,  i, bias'length));
		row  <= signed(y)-vt_height/2;

		draw_vline_e : entity hdl4fpga.draw_vline
		port map (
			ena  => ena,
			row  => std_logic_vector(row),
			y1   => std_logic_vector(y1),
			y2   => std_logic_vector(y2),
			dot  => dots(i));

	end generate;

end;
