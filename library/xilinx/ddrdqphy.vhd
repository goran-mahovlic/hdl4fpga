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

entity ddrdqphy is
	generic (
		line_size : natural;
		byte_size : natural);
	port (
		sys_clk0 : in  std_logic;
		sys_clk90 : in  std_logic;
		sys_dmt  : in  std_logic_vector(0 to line_size/byte_size-1) := (others => '-');
		sys_dmi  : in  std_logic_vector(line_size/byte_size-1 downto 0) := (others => '-');
		sys_dmo  : out std_logic_vector(line_size/byte_size-1 downto 0);
		sys_dqo  : in  std_logic_vector(line_size-1 downto 0);
		sys_dqt  : in  std_logic_vector(line_size/byte_size-1 downto 0);
		sys_dqi  : out std_logic_vector(line_size-1 downto 0);
		sys_dqso : in  std_logic_vector(0 to line_size/byte_size-1);
		sys_dqst : in  std_logic_vector(0 to line_size/byte_size-1);

		ddr_dmt  : out std_logic;
		ddr_dmi  : in  std_logic := '-';
		ddr_dmo  : out std_logic;
		ddr_dqi  : in  std_logic_vector(byte_size-1 downto 0);
		ddr_dqt  : out std_logic_vector(byte_size-1 downto 0);
		ddr_dqo  : out std_logic_vector(byte_size-1 downto 0);

		ddr_dqsi : in  std_logic;
		ddr_dqst : out std_logic;
		ddr_dqso : out std_logic);

	constant data_phases : natural := 2;
end;

library ecp3;
use ecp3.components.all;

library hdl4fpga;

architecture ecp3 of ddrdqphy is

	signal dqi : std_logic_vector(sys_dqi'range);

	signal dqt : std_logic_vector(sys_dqt'range);
	signal dqst : std_logic_vector(sys_dqst'range);
	signal dqso : std_logic_vector(sys_dqso'range);
	signal wle : std_logic;
	signal wlrdy : std_logic;
	signal dqsbufd_rsto : std_logic;

begin

	iddr_g : for i in 0 to byte_size-1 generate
		phase_g : for j in  data_phases-1 downto 0 generate
			sys_dqi(j*byte_size+i) <= ddr_dqi(i);
		end generate;
	end generate;

	dmi_g : for i in 0 to data_phases-1 generate
		sys_dmo(i) <= ddr_dmi;
	end generate;

	oddr_g : for i in 0 to byte_size-1 generate
	begin
		ddrto_i : entity hdl4fpga.ddrto
		port map (
			clk => sys_clk0,
			d => sys_dqt(i),
			q => ddr_dqt(i));

		ddro_i : entity hdl4fpga.ddro
		port map (
			clk => sys_clk0,
			dr  => sys_dqo(0*byte_size+i),
			df  => sys_dqo(1*byte_size+i),
			q   => ddr_dqo(i));
	end generate;

	dmo_g : block
	begin
		ddrto_i : entity hdl4fpga.ddrto
		port map (
			clk => sys_clk0,
			d => sys_dmt(0),
			q => ddr_dmt);

		ddro_i : entity hdl4fpga.ddro
		port map (
			clk => sys_clk0,
			dr  => sys_dmi(0),
			df  => sys_dmi(1),
			q   => ddr_dmo);
	end block;

	dqso_b : block 
	begin

		ddrto_i : entity hdl4fpga.ddrto
		port map (
			clk => sys_clk0,
			d => sys_dqst(0),
			q => ddr_dqst);

		ddro_i : entity hdl4fpga.ddro
		port map (
			clk => sys_clk0,
			dr  => sys_dqso(0),
			df  => sys_dqso(1),
			q   => ddr_dmo);

	end block;
end;
