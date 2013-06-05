library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ddr_mpu is
	generic (
		tCk  : natural := 6;
		tRCD : natural := (15+6-1)/6;
		tRFC : natural := (72+6-1)/6;
		tWR  : natural := (15+6-1)/6;
		tRP  : natural := (15+6-1)/6;
		ddr_mpu_bl : std_logic_vector(0 to 2) := "011";
		ddr_mpu_cl : std_logic_vector(0 to 2) := "010");
	port (
		ddr_mpu_rst   : in  std_logic;
		ddr_mpu_clk   : in  std_logic;
		ddr_mpu_clk90 : in  std_logic;
		ddr_mpu_cmd   : in  std_logic_vector(0 to 2) := (others => '1');
		ddr_mpu_rdy   : out std_logic;
		ddr_mpu_act   : out std_logic;
		ddr_mpu_cas   : out std_logic := '1';
		ddr_mpu_ras   : out std_logic := '1';
		ddr_mpu_we    : out std_logic := '1';


		ddr_mpu_rea   : out std_logic := '0';
		ddr_mpu_wri   : out std_logic := '0';
		ddr_mpu_wbl   : out std_logic := '0';

		ddr_mpu_rwin  : out std_logic := '0';
		ddr_mpu_drr   : out std_logic := '0';
		ddr_mpu_drf   : out std_logic := '0';

		ddr_mpu_dwf   : out std_logic_vector(0 to 1) := (others => '0');
		ddr_mpu_dwr   : out std_logic_vector(0 to 1) := (others => '0');
		ddr_mpu_dqs   : out std_logic_vector(0 to 1) := (others => '0');
		ddr_mpu_dqsz  : out std_logic_vector(0 to 1) := (others => '1');
		ddr_mpu_dqz   : out std_logic_vector(0 to 1) := (others => '1'));
end;

architecture arch of ddr_mpu is
	constant ras : natural := 0;
	constant cas : natural := 1;
	constant we  : natural := 2;
	constant n   : natural := 2;
	constant nr  : natural := 3;

	signal ddr_mpu_rph : std_logic := '1';
	signal ddr_mpu_wph : std_logic := '1';
	signal ph_rea : std_logic_vector(0 to 4*nr+9);

	signal lat_timer : unsigned(0 to 4) := (others => '1');
	impure function to_timer (
		constant t : integer) 
		return unsigned is
	begin
		return to_unsigned(
			(2**lat_timer'length-2+t) mod 2**lat_timer'length,
			lat_timer'length);
	end;

	signal sel_cl : std_logic;
	signal ddr_rea : std_logic;
	signal ddr_wri : std_logic;

	type lattimer_vector is array (natural range <>) of std_logic_vector(0 to lat_timer'length-1);
	constant bl_data : lattimer_vector(0 to 4-1) := (
		(lat_timer'range => '-'),
		std_logic_vector(to_timer(1)),
		std_logic_vector(to_timer(2)),
		std_logic_vector(to_timer(4)));

	constant cl_data : lattimer_vector(0 to 2-1) := (
		std_logic_vector(to_timer(2)),
		std_logic_vector(to_timer(3)));

	constant ddr_phr_din : std_logic_vector(1 to nr+2) := (others => '-');
	constant ddr_ph_din : std_logic_vector(1 to n+2) := (others => '-');
	function ddr_ph_cas (
		constant arg1 : std_logic_vector(0 to 2))
		return natural is
	begin
		case arg1 is
		when "010" => -- cas 2
			return 0;
		when "011" => -- cas 3
			return 4;
		when "110" =>
			return 2;
		when others =>
			return 0;
		end case;
	end;

	constant ddr_nop   : std_logic_vector(0 to 2) := "111";
	constant ddr_act   : std_logic_vector(0 to 2) := "011";
	constant ddr_read  : std_logic_vector(0 to 2) := "101";
	constant ddr_write : std_logic_vector(0 to 2) := "100";
	constant ddr_pre   : std_logic_vector(0 to 2) := "010";
	constant ddr_aut   : std_logic_vector(0 to 2) := "001";
	constant ddr_dcare : std_logic_vector(0 to 2) := "000";

	constant ddrs_act      : std_logic_vector(0 to 2) := "011";
	constant ddrs_read_bl  : std_logic_vector(0 to 2) := "101";
	constant ddrs_read_cl  : std_logic_vector(0 to 2) := "001";
	constant ddrs_write_bl : std_logic_vector(0 to 2) := "100";
	constant ddrs_write_cl : std_logic_vector(0 to 2) := "000";
	constant ddrs_pre      : std_logic_vector(0 to 2) := "010";
	signal ddr_state : std_logic_vector(0 to 2);

	type ddr_state_word is record
		ddr_state : std_logic_vector(0 to 2);
		ddr_state_n : std_logic_vector(0 to 2);
		ddr_cmi : std_logic_vector(0 to 2);
		ddr_cmo : std_logic_vector(0 to 2);
		ddr_lat : unsigned(lat_timer'range);
		ddr_rea : std_logic;
		ddr_wri : std_logic;
		ddr_act : std_logic;
		ddr_rph : std_logic;
		ddr_wph : std_logic;
		ddr_rdy : std_logic;
	end record;

	function setif (
		arg : boolean)
		return natural is
		variable val : std_logic;
	begin
		case arg is
		when true =>
			return 1;
		when false =>
			return 0;
		end case;
	end function;

	signal ddr_rdy_ena : std_logic;

	constant bl_time : std_logic_vector(lat_timer'range) := bl_data(to_integer(unsigned(ddr_mpu_bl)));
	constant cl_time : std_logic_vector(lat_timer'range) := cl_data(natural'(setif(ddr_mpu_cl(0)='1' and ddr_mpu_cl(2)='1')));
	type ddr_state_vector is array(natural range <>) of ddr_state_word;
	constant ddr_state_tab : ddr_state_vector(0 to 11-1) := (

		-------------
		-- DDR_PRE --
		-------------

		(ddr_state => DDRS_PRE, ddr_state_n => DDRS_PRE,
		 ddr_cmi => ddr_nop, ddr_cmo => ddr_nop, ddr_lat => to_timer(1),
		 ddr_rea => '0', ddr_wri => '0',
		 ddr_act => '1', ddr_rdy => '1', ddr_rph => '1', ddr_wph => '1'),
		(ddr_state => DDRS_PRE, ddr_state_n => DDRS_ACT,
		 ddr_cmi => ddr_act, ddr_cmo => ddr_act, ddr_lat => to_timer(tRCD),
		 ddr_rea => '0', ddr_wri => '0',
		 ddr_act => '0', ddr_rdy => '1', ddr_rph => '1', ddr_wph => '1'),
		(ddr_state => DDRS_PRE, ddr_state_n => DDRS_PRE,
		 ddr_cmi => ddr_aut, ddr_cmo => ddr_aut, ddr_lat => to_timer(tRFC),
		 ddr_rea => '0', ddr_wri => '0',
		 ddr_act => '1', ddr_rdy => '1', ddr_rph => '1', ddr_wph => '1'),

		-------------
		-- DDR_ACT --
		-------------

		(ddr_state => DDRS_ACT, ddr_state_n => DDRS_READ_BL,
		 ddr_cmi => ddr_read, ddr_cmo => ddr_read, ddr_lat => unsigned(bl_time),
		 ddr_rea => '1', ddr_wri => '0',
		 ddr_act => '0', ddr_rdy => '1', ddr_rph => '0', ddr_wph => '1'),
		(ddr_state => DDRS_ACT, ddr_state_n => DDRS_WRITE_BL,
		 ddr_cmi => ddr_write, ddr_cmo => ddr_write, ddr_lat => unsigned(bl_time),
		 ddr_rea => '0', ddr_wri => '1',
		 ddr_act => '0', ddr_rdy => '1', ddr_rph => '1', ddr_wph => '0'),

		--------------
		-- DDR_READ --
		--------------

		(ddr_state => DDRS_READ_BL, ddr_state_n => DDRS_READ_BL,
		 ddr_cmi => ddr_read, ddr_cmo => ddr_read, ddr_lat => unsigned(bl_time),
		 ddr_rea => '1', ddr_wri => '0',
		 ddr_act => '0', ddr_rdy => '1', ddr_rph => '0', ddr_wph => '1'),
		(ddr_state => DDRS_READ_BL, ddr_state_n => DDRS_READ_CL,
		 ddr_cmi => ddr_dcare, ddr_cmo => ddr_nop, ddr_lat => unsigned(cl_time),
		 ddr_rea => '1', ddr_wri => '0',
		 ddr_act => '0', ddr_rdy => '0', ddr_rph => '1', ddr_wph => '1'),
		(ddr_state => DDRS_READ_CL, ddr_state_n => DDRS_PRE,
		 ddr_cmi => ddr_dcare, ddr_cmo => ddr_pre, ddr_lat => to_timer(tRP),
		 ddr_rea => '1', ddr_wri => '0',
		 ddr_act => '1', ddr_rdy => '1', ddr_rph => '1', ddr_wph => '1'),

		---------------
		-- DDR_WRITE --
		---------------

		(ddr_state => DDRS_WRITE_BL, ddr_state_n => DDRS_WRITE_BL,
		 ddr_cmi => ddr_write, ddr_cmo => ddr_write, ddr_lat => unsigned(bl_time),
		 ddr_rea => '0', ddr_wri => '1',
		 ddr_act => '0', ddr_rdy => '1', ddr_rph => '1', ddr_wph => '0'),
		(ddr_state => DDRS_WRITE_BL, ddr_state_n => DDRS_WRITE_CL,
		 ddr_cmi => ddr_dcare, ddr_cmo => ddr_nop, ddr_lat => to_timer(tWR+1),
		 ddr_rea => '0', ddr_wri => '1',
		 ddr_act => '0', ddr_rdy => '0', ddr_rph => '1', ddr_wph => '1'),
		(ddr_state => DDRS_WRITE_CL, ddr_state_n => DDRS_PRE,
		 ddr_cmi => ddr_dcare, ddr_cmo => ddr_pre, ddr_lat => to_timer(tRP),
		 ddr_rea => '0', ddr_wri => '0',
		 ddr_act => '1', ddr_rdy => '1', ddr_rph => '1', ddr_wph => '1'));

begin

	ddr_mpu_p: process (ddr_mpu_clk)
		variable ddr_act : std_logic;
	begin
		if rising_edge(ddr_mpu_clk) then
			if ddr_mpu_rst='0' then
				assert ddr_state/=(ddr_state'range => '-')
					report "ERROR -------------------->>>>"
					severity failure;
				ddr_mpu_act <= ddr_act;
				if lat_timer(0)='1' then
					ddr_state   <= (others => '-');
					lat_timer   <= (others => '-');
					ddr_mpu_ras <= '-';
					ddr_mpu_cas <= '-';
					ddr_mpu_we  <= '-';
					ddr_rea     <= '-';
					ddr_wri     <= '-';
					ddr_act     := '-';
					ddr_mpu_rph <= '-';
					ddr_mpu_wph <= '-';
					ddr_rdy_ena <= '-';
					for i in ddr_state_tab'range loop
						if ddr_state=ddr_state_tab(i).ddr_state then 
							if ddr_state_tab(i).ddr_cmi=ddr_mpu_cmd or
							   ddr_state_tab(i).ddr_cmi="000" then
								ddr_state   <= ddr_state_tab(i).ddr_state_n;
								lat_timer   <= ddr_state_tab(i).ddr_lat;
								ddr_mpu_ras <= ddr_state_tab(i).ddr_cmo(ras);
								ddr_mpu_cas <= ddr_state_tab(i).ddr_cmo(cas);
								ddr_mpu_we  <= ddr_state_tab(i).ddr_cmo(we);
								ddr_rea     <= ddr_state_tab(i).ddr_rea;
								ddr_wri     <= ddr_state_tab(i).ddr_wri;
								ddr_act     := ddr_state_tab(i).ddr_act;
								ddr_mpu_rph <= ddr_state_tab(i).ddr_rph;
								ddr_mpu_wph <= ddr_state_tab(i).ddr_wph;
								ddr_rdy_ena <= ddr_state_tab(i).ddr_rdy;
								exit;
							end if;
						end if;
					end loop;
				else
					ddr_mpu_ras <= ddr_nop(ras);
					ddr_mpu_cas <= ddr_nop(cas);
					ddr_mpu_we  <= ddr_nop(we);
					lat_timer   <= lat_timer - 1;
				end if;
			else
				ddr_state   <= ddr_state_tab(0).ddr_state_n;
				lat_timer   <= ddr_state_tab(0).ddr_lat;
				ddr_mpu_ras <= ddr_state_tab(0).ddr_cmo(ras);
				ddr_mpu_cas <= ddr_state_tab(0).ddr_cmo(cas);
				ddr_mpu_we  <= ddr_state_tab(0).ddr_cmo(we);
				ddr_rea     <= ddr_state_tab(0).ddr_rea;
				ddr_wri     <= ddr_state_tab(0).ddr_wri;
				ddr_mpu_act <= ddr_state_tab(0).ddr_act;
				ddr_mpu_rph <= ddr_state_tab(0).ddr_rph;
				ddr_mpu_wph <= ddr_state_tab(0).ddr_wph;
				ddr_rdy_ena <= '1';
				ddr_act     := '1';
			end if;
		end if;
	end process;

	ddr_mpu_rdy <= lat_timer(0) and ddr_rdy_ena;
	ddr_mpu_rea <= ddr_rea;
	ddr_mpu_wri <= ddr_wri;
	ddr_mpu_wbl <= not ddr_mpu_wph;

	-------------------
	-- Write Enables --
	-------------------
	write_ena_b : block 
	begin
		bytes_g: for i in ddr_mpu_dqs'range generate
			signal ph_wri : std_logic_vector(0 to 4*n+9);
		begin
			ddr_ph_write : entity hdl4fpga.ddr_ph
			generic map (
				n => n)
			port map (
				ddr_ph_clk   => ddr_mpu_clk,
				ddr_ph_clk90 => ddr_mpu_clk90,
				ddr_ph_din(0) => ddr_mpu_wph,
				ddr_ph_din(1 to n+2) => ddr_ph_din,
				ddr_ph_qout => ph_wri);

--			ddr_mpu_dqsz(i) <= not ddr_wri or (ph_wri(4*0+4) and ph_wri(4*1+4));
			ddr_mpu_dqsz(i) <= ph_wri(4*0+4) and ph_wri(4*1+4);
			ddr_mpu_dqs(i)  <= not ph_wri(4+2);
--			ddr_mpu_dqz(i)  <= not ddr_wri or ph_wri(4+1);
			ddr_mpu_dqz(i)  <= ph_wri(4+1);
			ddr_mpu_dwr(i)  <= not ph_wri(1+4);
			ddr_mpu_dwf(i)  <= not ph_wri(3+4);

		end generate;
	end block;
	
	------------------
	-- Read Enables --
	------------------
	
	ddr_ph_read : entity hdl4fpga.ddr_ph
	generic map (
		n => nr)
	port map (
		ddr_ph_clk   => ddr_mpu_clk,
		ddr_ph_clk90 => ddr_mpu_clk90,
		ddr_ph_din(0) => ddr_mpu_rph,
		ddr_ph_din(1 to nr+2) => ddr_phr_din,
		ddr_ph_qout => ph_rea);

--	ddr_mpu_rwin <= not (not ddr_rea or (ph_rea(4*4+4*((ddr_ph_cas(ddr_mpu_cl)+3)/4))));
--	ddr_mpu_drr <= not (not ddr_rea or (ph_rea(2*4+ddr_ph_cas(ddr_mpu_cl)) and ph_rea(3*4+ddr_ph_cas(ddr_mpu_cl))));
--	ddr_mpu_drf <= not (not ddr_rea or ph_rea(2*4+2+ddr_ph_cas(ddr_mpu_cl)));

	ddr_mpu_rwin <= not ph_rea(4*4+4*((ddr_ph_cas(ddr_mpu_cl)+3)/4));
	ddr_mpu_drr  <= not (ph_rea(2*4+ddr_ph_cas(ddr_mpu_cl)) and ph_rea(3*4+ddr_ph_cas(ddr_mpu_cl)));
	ddr_mpu_drf  <= not ph_rea(2*4+2+ddr_ph_cas(ddr_mpu_cl));
end;
