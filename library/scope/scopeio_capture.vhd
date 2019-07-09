--                                                                            --
-- Author(s):                                                                 --
--   Miguel Angel Sagreras                                                    --
--                                                                            --
-- Copyright (C) 2015                                                         --
--    Miguel Angel Sagreras                                                   --
--                                                                            --
-- This source file may be used and distributed without restriction provided  --
-- that this copyright statement is not removed from the file and that any    --
-- derivative work contains  the original copyright notice and the associated --
-- disclaimer.                                                                --
--                                                                            --
-- This source file is free software; you can redistribute it and/or modify   --
-- it under the terms of the GNU General Public License as published by the   --
-- Free Software Foundation, either version 3 of the License, or (at your     --
-- option) any later version.                                                 --
--                                                                            --
-- This source is distributed in the hope that it will be useful, but WITHOUT --
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or      --
-- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for   --
-- more details at http://www.gnu.org/licenses/.                              --
--                                                                            --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hdl4fpga;
use hdl4fpga.std.all;
use hdl4fpga.scopeiopkg.all;

entity scopeio_capture is
	port (
		input_clk      : in  std_logic;
		capture_start  : in  std_logic;
		capture_finish : out std_logic;
		input_ena      : in  std_logic := '1';
		input_data     : in  std_logic_vector;
		input_delay    : in  std_logic_vector;

		capture_clk    : in  std_logic;
		capture_addr   : in  std_logic_vector;
		capture_data   : out std_logic_vector;
		capture_valid  : inout std_logic);
end;

architecture beh of scopeio_capture is

	constant bram_latency : natural := 2;

	constant capture_size : natural := 2**capture_addr'length;
	constant delay_size   : natural := 2**input_delay'length;

	signal index   : signed(input_delay'range);
	signal bound   : signed(input_delay'range);
	signal base    : signed(capture_addr'range);
	signal rd_addr : signed(capture_addr'range);
	signal wr_addr : signed(capture_addr'range);
	signal wr_ena  : std_logic;
	signal no_data : std_logic_vector(input_data'range);

	signal cntr    : unsigned(0 to input_delay'length);
	alias  finish  : std_logic is cntr(0);
	signal delay   : signed(input_delay'range);
	signal valid   : std_logic;


begin
 
	capture_addr_p : process (input_clk)
	begin
		if rising_edge(input_clk) then
			if capture_start='0' then
				base  <= signed(wr_addr);
				delay <= signed(input_delay);
				cntr  <= resize((delay_size-capture_size+1)-unsigned(input_delay), cntr'length);
			elsif cntr(0)='0' then
				if input_ena='1' then
					cntr <= cntr + 1;
				end if;
			end if;
		end if;
	end process;

	index <= signed(input_delay)+signed(resize(unsigned(capture_addr), input_delay'length));
	bound <= signed(resize(cntr, input_delay'length));

	capture_valid_p : valid <=
		setif(delay <= index and index < delay+capture_size) when finish='1' else '0';
--		setif(index > -capture_size and delay <= index and index < delay+capture_size+bound);

	valid_e : entity hdl4fpga.align
	generic map (
		n => 1,
		d => (0 to 0 => bram_latency))
	port map (
		clk   => capture_clk,
		di(0) => valid,
		do(0) => capture_valid);

	capture_data <= (0 to 3-1 => '1') & (3 to capture_data'length-1 => not capture_valid);
	capture_finish <= finish;

	wr_addr_p : process (input_clk)
	begin
		if rising_edge(input_clk) then
			if input_ena='1' then
				wr_addr <= wr_addr + 1;
			end if;
		end if;
	end process;
	wr_ena  <= (not finish or not capture_start) and input_ena;
	rd_addr <= base + resize(index, rd_addr'length);

--	mem_e : entity hdl4fpga.bram(inference)
--	port map (
--		clka  => input_clk,
--		addra => std_logic_vector(wr_addr),
--		wea   => wr_ena,
--		dia   => input_data,
--		doa   => no_data,
--
--		clkb  => capture_clk,
--		addrb => std_logic_vector(rd_addr),
--		dib   => no_data,
--		dob   => capture_data);

end;
