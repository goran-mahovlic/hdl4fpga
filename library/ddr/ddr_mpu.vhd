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

entity ddr_mpu is
	generic (
		gear : natural;
		lrcd : natural;
		lrfc : natural;
		lwr  : natural;
		lrp  : natural;

		bl_cod : std_logic_vector;
		bl_tab : natural_vector;

		cl_cod : std_logic_vector;
		cl_tab : natural_vector;
		cwl_cod : std_logic_vector;
		cwl_tab : natural_vector);
	port (
		ddr_mpu_bl  : in std_logic_vector;
		ddr_mpu_cl  : in std_logic_vector;
		ddr_mpu_cwl : in std_logic_vector;

		ddr_mpu_rst : in std_logic;
		ddr_mpu_clk : in std_logic;
		ddr_mpu_cmd : in std_logic_vector(0 to 2) := (others => '1');
		ddr_mpu_trdy : out std_logic;
		ddr_mpu_act : out std_logic;
		ddr_mpu_ras : out std_logic;
		ddr_mpu_cas : out std_logic;
		ddr_mpu_pre : buffer std_logic;
		ddr_mpu_cyl : out std_logic;
		ddr_mpu_idl : out std_logic;
		ddr_mpu_we  : out std_logic;
		ddr_mpu_cen : out std_logic;

		ddr_mpu_rea  : out std_logic;
		ddr_mpu_rwin : out std_logic;
		ddr_mpu_wri  : out std_logic;
		ddr_mpu_wwin : out std_logic;
		ddr_mpu_rwwin : out std_logic);

end;

architecture arch of ddr_mpu is
	constant ras : natural := 0;
	constant cas : natural := 1;
	constant we  : natural := 2;

	function timer_size (
		constant lrcd : natural;
		constant lrfc : natural;
		constant lwr  : natural;
		constant lrp  : natural;
		constant bl_tab : natural_vector;
		constant cl_tab : natural_vector;
		constant cwl_tab : natural_vector)
		return natural is
		variable val : natural;
		variable aux : natural;
	begin
		aux := max(lrcd,lrfc);
		aux := max(aux, lrp);
		for i in bl_tab'range loop
			aux := max(aux, bl_tab(i));
		end loop;
		for i in cl_tab'range loop
			aux := max(aux, cl_tab(i));
		end loop;
		for i in cwl_tab'range loop
			aux := max(aux, cwl_tab(i)+lwr);
		end loop;
		val := 1;
		aux := aux-2;
		while (aux > 0) loop
			aux := aux / 2;
			val := val + 1;
		end loop;
		return val;
	end;

		
	constant lat_size : natural := timer_size(lrcd, lrfc, lwr, lrp, bl_tab, cl_tab, cwl_tab);
	signal lat_timer : signed(0 to lat_size-1) := (others => '1');

	constant ddr_nop       : std_logic_vector(0 to 2) := "111";
	constant ddr_act       : std_logic_vector(0 to 2) := "011";
	constant ddr_read      : std_logic_vector(0 to 2) := "101";
	constant ddr_write     : std_logic_vector(0 to 2) := "100";
	constant ddr_pre       : std_logic_vector(0 to 2) := "010";
	constant ddr_aut       : std_logic_vector(0 to 2) := "001";
	constant ddr_dcare     : std_logic_vector(0 to 2) := "000";
	type cmd_names is (c_nop, c_act, c_read, c_write, c_pre, c_aut, c_dcare);
	signal cmd_name : cmd_names;

	type ddrs_states is (ddrs_act, ddrs_read_bl, ddrs_read_cl, ddrs_write_bl, ddrs_write_cl, ddrs_pre);

--	constant ddrs_act      : std_logic_vector(0 to 2) := "011";
--	constant ddrs_read_bl  : std_logic_vector(0 to 2) := "101";
--	constant ddrs_read_cl  : std_logic_vector(0 to 2) := "001";
--	constant ddrs_write_bl : std_logic_vector(0 to 2) := "100";
--	constant ddrs_write_cl : std_logic_vector(0 to 2) := "000";
--	constant ddrs_pre      : std_logic_vector(0 to 2) := "010";
	type state_names is (s_act, s_readbl, s_readcl, s_writebl, s_writecl, s_pre, s_none);
	signal mpu_state : state_names;

	signal ddr_state : ddrs_states;

	type lat_id is (id_idle, id_rcd, id_rfc, id_rp, id_bl, id_cl, id_cwl);
	type ddr_state_word is record
		ddr_state   : ddrs_states;
		ddr_state_n : ddrs_states;
		ddr_cmi     : std_logic_vector(0 to 2);
		ddr_cmo     : std_logic_vector(0 to 2);
		ddr_lat     : lat_id;
		ddr_cen     : std_logic;
		ddr_rea     : std_logic;
		ddr_rph     : std_logic;
		ddr_wph     : std_logic;
		ddr_rdy     : std_logic;
	end record;

	signal ddr_rdy_ena : std_logic;

	type ddr_state_vector is array(natural range <>) of ddr_state_word;
	constant ddr_state_tab : ddr_state_vector(0 to 13-1) := (

		-------------
		-- ddr_pre --
		-------------

		(ddr_state => ddrs_pre, ddr_state_n => ddrs_pre,
		 ddr_cmi => ddr_nop, ddr_cmo => ddr_nop, ddr_lat => id_idle,
		 ddr_rea => '0', ddr_cen => '0',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '0'),

		(ddr_state => ddrs_pre, ddr_state_n => ddrs_pre,
		 ddr_cmi => ddr_pre, ddr_cmo => ddr_pre, ddr_lat => id_rp,
		 ddr_rea => '0', ddr_cen => '0',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '0'),
		(ddr_state => ddrs_pre, ddr_state_n => ddrs_act,
		 ddr_cmi => ddr_act, ddr_cmo => ddr_act, ddr_lat => id_rcd,
		 ddr_rea => '0', ddr_cen => '0',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '0'),
		(ddr_state => ddrs_pre, ddr_state_n => ddrs_pre,
		 ddr_cmi => ddr_aut, ddr_cmo => ddr_aut, ddr_lat => id_rfc,
		 ddr_rea => '0', ddr_cen => '0',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '0'),

		-------------
		-- ddr_act --
		-------------

		(ddr_state => ddrs_act, ddr_state_n => ddrs_read_bl,
		 ddr_cmi => ddr_read, ddr_cmo => ddr_read, ddr_lat => id_bl,
		 ddr_rea => '1', ddr_cen => '1',
		 ddr_rdy => '1', ddr_rph => '1', ddr_wph => '0'),
		(ddr_state => ddrs_act, ddr_state_n => ddrs_write_bl,
		 ddr_cmi => ddr_write, ddr_cmo => ddr_write, ddr_lat => id_bl,
		 ddr_rea => '0', ddr_cen => '1',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '1'),

		--------------
		-- ddr_read --
		--------------

		(ddr_state => ddrs_read_bl, ddr_state_n => ddrs_read_bl,
		 ddr_cmi => ddr_read, ddr_cmo => ddr_read, ddr_lat => id_bl,
		 ddr_rea => '1', ddr_cen => '1',
		 ddr_rdy => '1', ddr_rph => '1', ddr_wph => '0'),
		(ddr_state => ddrs_read_bl, ddr_state_n => ddrs_read_bl,
		 ddr_cmi => ddr_nop, ddr_cmo => ddr_nop, ddr_lat => id_idle,
		 ddr_rea => '1', ddr_cen => '0',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '0'),
		(ddr_state => ddrs_read_bl, ddr_state_n => ddrs_read_cl,
		 ddr_cmi => ddr_dcare, ddr_cmo => ddr_nop, ddr_lat => id_cl,
		 ddr_rea => '1', ddr_cen => '0',
		 ddr_rdy => '0', ddr_rph => '0', ddr_wph => '0'),
		(ddr_state => ddrs_read_cl, ddr_state_n => ddrs_pre,
		 ddr_cmi => ddr_dcare, ddr_cmo => ddr_pre, ddr_lat => id_rp,
		 ddr_rea => '1', ddr_cen => '0',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '0'),


		---------------
		-- ddr_write --
		---------------

		(ddr_state => ddrs_write_bl, ddr_state_n => ddrs_write_bl,
		 ddr_cmi => ddr_write, ddr_cmo => ddr_write, ddr_lat => id_bl,
		 ddr_rea => '0', ddr_cen => '1',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '1'),
		(ddr_state => ddrs_write_bl, ddr_state_n => ddrs_write_cl,
		 ddr_cmi => ddr_dcare, ddr_cmo => ddr_nop, ddr_lat => id_cwl,
		 ddr_rea => '0', ddr_cen => '0',
		 ddr_rdy => '0', ddr_rph => '0', ddr_wph => '0'),
		(ddr_state => ddrs_write_cl, ddr_state_n => ddrs_pre,
		 ddr_cmi => ddr_dcare, ddr_cmo => ddr_pre, ddr_lat => id_rp,
		 ddr_rea => '0', ddr_cen => '0',
		 ddr_rdy => '1', ddr_rph => '0', ddr_wph => '0'));

--		attribute fsm_encoding : string;
--		attribute fsm_encoding of ddr_state : signal is "compact";

	function "+" (
		constant tab : natural_vector;
		constant off : natural)
		return natural_vector is
		variable val : natural_vector(tab'range);
	begin
		for i in tab'range loop
			val(i) := tab(i) + off;
		end loop;
		return val;
	end;

	impure function select_lat (
		constant lat_val : std_logic_vector;
		constant lat_cod : std_logic_vector;
		constant lat_tab : natural_vector)
		return signed is
		subtype latword is std_logic_vector(0 to lat_cod'length/lat_tab'length-1);
		type latword_vector is array (natural range <>) of latword;

		function to_latwordvector(
			constant arg : std_logic_vector)
			return latword_vector is
			variable aux : unsigned(0 to arg'length-1);
			variable val : latword_vector(0 to arg'length/latword'length-1);
		begin
			aux := unsigned(arg);
			for i in val'range loop
				val(i) := std_logic_vector(aux(latword'range));
				aux := aux sll latword'length;
			end loop;
			return val;
		end;

		impure function select_latword (
			constant lat_val : std_logic_vector;
			constant lat_cod : latword_vector;
			constant lat_tab : natural_vector)
			return signed is
			variable val : signed(lat_timer'range);
		begin
			val := (others => '-');
			for i in lat_cod'range loop
				if lat_cod(i)=lat_val then
					val := to_signed((lat_tab(i)+gear-1)/gear-2, lat_timer'length);
					exit;
				end if;
			end loop;
			return val;
		end;
			
	begin
		return select_latword(lat_val, to_latwordvector(lat_cod), lat_tab);
	end;

begin

	ddr_mpu_p: process (ddr_mpu_clk)
		variable state_set : boolean;
	begin
		if rising_edge(ddr_mpu_clk) then
			if ddr_mpu_rst='0' then

				assert state_set
					report "error -------------------->>>>"
					severity failure;


				if lat_timer(0)='1' then
					state_set     := false;
					lat_timer     <= (others => '-');
					ddr_mpu_ras   <= '-';
					ddr_mpu_cas   <= '-';
					ddr_mpu_we    <= '-';
					ddr_mpu_rea   <= '-';
					ddr_mpu_rwin  <= '-';
					ddr_mpu_wwin  <= '-';
					ddr_mpu_rwwin <= '-';
					ddr_rdy_ena   <= '-';
					ddr_mpu_cen   <= '-';
					for i in ddr_state_tab'range loop
						if ddr_state=ddr_state_tab(i).ddr_state then 
							if ddr_state_tab(i).ddr_cmi=ddr_mpu_cmd or
							   ddr_state_tab(i).ddr_cmi="000" then
								state_set    := true;
								ddr_state    <= ddr_state_tab(i).ddr_state_n;
								ddr_mpu_cen  <= ddr_state_tab(i).ddr_cen;
								ddr_mpu_ras  <= ddr_state_tab(i).ddr_cmo(ras);
								ddr_mpu_cas  <= ddr_state_tab(i).ddr_cmo(cas);
								ddr_mpu_we   <= ddr_state_tab(i).ddr_cmo(we);
								ddr_mpu_rea  <= ddr_state_tab(i).ddr_rea;
								ddr_mpu_rwin <= ddr_state_tab(i).ddr_rph;
								ddr_mpu_wwin <= ddr_state_tab(i).ddr_wph;
								ddr_mpu_rwwin <= ddr_state_tab(i).ddr_wph or ddr_state_tab(i).ddr_rph;
								ddr_rdy_ena  <= ddr_state_tab(i).ddr_rdy;

								case ddr_state_tab(i).ddr_lat is
								when id_bl =>
									lat_timer <= select_lat(ddr_mpu_bl, bl_cod, bl_tab);
								when id_cl =>
									lat_timer <= select_lat(ddr_mpu_cl, cl_cod, cl_tab);
--									lat_timer <= select_lat(ddr_mpu_cl, cl_cod, cl_tab)+1;
								when id_cwl =>
									lat_timer <= select_lat(ddr_mpu_cwl, cwl_cod, cwl_tab+gear*lwr);
								when id_rcd =>
									lat_timer <= to_signed(lrcd-2, lat_timer'length);
								when id_rfc =>
									lat_timer <= to_signed(lrfc-2, lat_timer'length);
								when id_rp =>
									lat_timer <= to_signed(lrp-2, lat_timer'length);
								when id_idle =>
									lat_timer <= (others => '1');
								end case;
								exit;
							end if;
						end if;
					end loop;
					ddr_mpu_pre <= setif(ddr_state=ddrs_write_cl or ddr_state=ddrs_read_cl);
					ddr_mpu_idl <= ddr_mpu_pre;
				else
					ddr_mpu_cen <= '0';
					ddr_mpu_ras <= ddr_nop(ras);
					ddr_mpu_cas <= ddr_nop(cas);
					ddr_mpu_we  <= ddr_nop(we);
					lat_timer   <= lat_timer - 1;
				end if;
			else
				state_set     := true;
				ddr_state     <= ddr_state_tab(0).ddr_state_n;
				ddr_mpu_cen   <= '0';
				ddr_mpu_ras   <= ddr_state_tab(0).ddr_cmo(ras);
				ddr_mpu_cas   <= ddr_state_tab(0).ddr_cmo(cas);
				ddr_mpu_we    <= ddr_state_tab(0).ddr_cmo(we);
				ddr_mpu_rea   <= ddr_state_tab(0).ddr_rea;
				ddr_mpu_rwin  <= ddr_state_tab(0).ddr_rph;
				ddr_mpu_wwin  <= ddr_state_tab(0).ddr_wph;
				ddr_mpu_rwwin <= ddr_state_tab(0).ddr_wph or ddr_state_tab(0).ddr_rph;
				ddr_mpu_pre   <= '0';
				ddr_mpu_idl   <= '1';
				ddr_rdy_ena   <= '1';
				lat_timer     <= (others => '1');
			end if;

		end if;
	end process;

	ddr_mpu_act  <= setif(ddr_state=ddrs_act);
	ddr_mpu_wri  <= setif(ddr_state=ddrs_write_cl or ddr_state=ddrs_write_bl);
	ddr_mpu_trdy <= lat_timer(0) and ddr_rdy_ena;
	ddr_mpu_cyl  <= lat_timer(0) and ddr_mpu_pre;

	debug : with ddr_state select
	mpu_state <=
		s_act	  when ddrs_act,
		s_readbl  when ddrs_read_bl,
		s_readcl  when ddrs_read_cl,
		s_writebl when ddrs_write_bl,
		s_writecl when ddrs_write_cl,
		s_pre     when ddrs_pre,
		s_none    when others;

	cmd_debug : with ddr_mpu_cmd select
	cmd_name <=
		c_nop   when ddr_nop,
		c_act	when ddr_act,
		c_read  when ddr_read,
		c_write when ddr_write,
		c_pre   when ddr_pre,
		c_aut   when ddr_aut,
		c_dcare when others;

end;
