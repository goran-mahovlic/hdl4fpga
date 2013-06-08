architecture ddr_test of testbench is
	constant ddr_period : time := 6 ns;
	constant bank_bits  : natural := 2;
	constant addr_bits  : natural := 13;
	constant cols_bits  : natural := 9;
	constant data_bytes : natural := 2;
	constant byte_bits  : natural := 8;
	constant timer_dll  : natural := 9;
	constant timer_200u : natural := 9;
	constant data_bits  : natural := byte_bits*data_bytes;

	signal rst   : std_logic;
	signal clk   : std_logic := '0';
	signal led7  : std_logic;

	signal dq    : std_logic_vector (data_bits - 1 downto 0) := (others => 'Z');
	signal dqs   : std_logic_vector (1 downto 0) := "00";
	signal addr  : std_logic_vector (addr_bits - 1 downto 0);
	signal ba    : std_logic_vector (1 downto 0);
	signal clk_p : std_logic := '0';
	signal clk_n : std_logic := '0';
	signal cke   : std_logic := '1';
	signal cs_n  : std_logic := '1';
	signal ras_n : std_logic;
	signal cas_n : std_logic;
	signal we_n  : std_logic;
	signal dm    : std_logic_vector(1 downto 0);


	signal ddr_lp_dqs : std_logic;

	component nuhs3dsp is
		port (
			xtal : in std_logic;
			sw1 : in std_logic;

			hd_t_data  : inout std_logic := '1';
			hd_t_clock : in std_logic := '0';

			dip : in std_logic_vector(0 to 7) := (others => 'Z');
			led18 : out std_logic := 'Z';
			led16 : out std_logic := 'Z';
			led15 : out std_logic := 'Z';
			led13 : out std_logic := 'Z';
			led11 : out std_logic := 'Z';
			led9  : out std_logic := 'Z';
			led8  : out std_logic := 'Z';
			led7  : out std_logic := 'Z';

			---------------
			-- Video DAC --
			
			hsync : out std_logic := '0';
			vsync : out std_logic := '0';
			clk_videodac : out std_logic := 'Z';
			blank : out std_logic := 'Z';
			sync  : out std_logic := 'Z';
			psave : out std_logic := 'Z';
			red   : out std_logic_vector(8-1 downto 0) := (others => 'Z');
			green : out std_logic_vector(8-1 downto 0) := (others => 'Z');
			blue  : out std_logic_vector(8-1 downto 0) := (others => 'Z');

			---------
			-- ADC --

			adc_clkab : out std_logic := 'Z';
			adc_clkout : in std_logic := 'Z';
			adc_da : in std_logic_vector(14-1 downto 0) := (others => 'Z');
			adc_db : in std_logic_vector(14-1 downto 0) := (others => 'Z');

			-----------------------
			-- RS232 Transceiver --

			rs232_dcd : in std_logic := 'Z';
			rs232_dsr : in std_logic := 'Z';
			rs232_rd  : in std_logic := 'Z';
			rs232_rts : out std_logic := 'Z';
			rs232_td  : out std_logic := 'Z';
			rs232_cts : in std_logic := 'Z';
			rs232_dtr : out std_logic := 'Z';
			rs232_ri  : in std_logic := 'Z';

			------------------------------
			-- MII ethernet Transceiver --

			mii_rst  : out std_logic := 'Z';
			mii_refclk : out std_logic := 'Z';
			mii_intrp  : in std_logic := 'Z';

			mii_mdc  : out std_logic := 'Z';
			mii_mdio : inout std_logic := 'Z';

			mii_txc  : in  std_logic := 'Z';
			mii_txen : out std_logic := 'Z';
			mii_txd  : out std_logic_vector(4-1 downto 0) := (others => 'Z');

			mii_rxc  : in std_logic := 'Z';
			mii_rxdv : in std_logic := 'Z';
			mii_rxer : in std_logic := 'Z';
			mii_rxd  : in std_logic_vector(4-1 downto 0) := (others => 'Z');

			mii_crs  : in std_logic := 'Z';
			mii_col  : in std_logic := 'Z';

			-------------
			-- DDR RAM --

			ddr_ckp : out std_logic := 'Z';
			ddr_ckn : out std_logic := 'Z';
			ddr_lp_ckp : in std_logic := 'Z';
			ddr_lp_ckn : in std_logic := 'Z';
			ddr_st_lp_dqs : in std_logic := 'Z';
			ddr_lp_dqs : out std_logic := 'Z';
			ddr_cke : out std_logic := 'Z';
			ddr_cs  : out std_logic := 'Z';
			ddr_ras : out std_logic := 'Z';
			ddr_cas : out std_logic := 'Z';
			ddr_we  : out std_logic := 'Z';
			ddr_ba  : out std_logic_vector(2-1  downto 0) := (2-1  downto 0 => 'Z');
			ddr_a   : out std_logic_vector(13-1 downto 0) := (13-1 downto 0 => 'Z');
			ddr_dm  : inout std_logic_vector(0 to 2-1) := (0 to 2-1 => 'Z');
			ddr_dqs : inout std_logic_vector(0 to 2-1) := (0 to 2-1 => 'Z');
			ddr_dq  : inout std_logic_vector(16-1 downto 0) := (16-1 downto 0 => 'Z'));
	end component;

	component ddr_model is
--		generic (
--			tCK   : time := 6.0 ns;
--			tDQSQ : time :=  0.4 ns; 
--			tMRD  : time := 12.0 ns; 
--			tRAP  : time := 15.0 ns; 
--			tRAS  : time := 42.0 ns; 
--			tRC   : time := 60.0 ns; 
--			tRFC  : time := 72.0 ns; 
--			tRCD  : time := 15.0 ns; 
--			tRP   : time := 15.0 ns; 
--			tRRD  : time := 12.0 ns; 
--			tWR   : time := 15.0 ns);
		port (
			clk   : in std_logic;
			clk_n : in std_logic;
			cke   : in std_logic;
			cs_n  : in std_logic;
			ras_n : in std_logic;
			cas_n : in std_logic;
			we_n  : in std_logic;
			ba    : in std_logic_vector(1 downto 0);
			addr  : in std_logic_vector(addr_bits - 1 downto 0);
			dm    : in std_logic_vector(data_bytes - 1 downto 0);
			dq    : inout std_logic_vector(data_bits - 1 downto 0);
			dqs   : inout std_logic_vector(data_bytes - 1 downto 0));
	end component;

	constant delay : time := 1 ns;
begin

	rst <= '0', '1' after 201 ns;
	clk <= not clk after 10 ns;

	nuhs3dsp_e : nuhs3dsp
	port map (
		xtal => clk,
		sw1  => rst,
		led7 => led7,
		dip => b"0000_0001",

		---------
		-- ADC --

		adc_da => (others => '0'),
		adc_db => (others => '0'),

		-------------
		-- DDR RAM --

		ddr_ckp => clk_p,
		ddr_ckn => clk_n,
		ddr_lp_ckp => clk_p,
		ddr_lp_ckn => clk_n,
		ddr_st_lp_dqs => ddr_lp_dqs,
		ddr_lp_dqs => ddr_lp_dqs,
		ddr_cke => cke,
		ddr_cs  => cs_n,
		ddr_ras => ras_n,
		ddr_cas => cas_n,
		ddr_we  => we_n,
		ddr_ba  => ba,
		ddr_a   => addr,
		ddr_dm  => dm,
		ddr_dqs => dqs,
		ddr_dq  => dq);

	mt_u : ddr_model
--	generic map (               
--        tCK  =>  ddr_period, -- Timing for -6T CL2
--        tCH  =>  0.45*ddr_period, -- 0.45*tCK
--        tCL  =>  0.45*ddr_period, -- 0.45*tCK
--        tDH  =>  0.450 ns,
--        tDS  =>  0.450 ns,
--        tIH  =>  0.750 ns,
--        tIS  =>  0.750 ns,
--        tMRD => 12.000 ns,
--        tRAS => 42.000 ns,
--        tRAP => 15.000 ns,
--        tRC  => 60.000 ns,
--        tRFC => 72.000 ns,
--        tRCD => 15.000 ns,
--        tRP  => 15.000 ns,
--        tRRD => 12.000 ns,
--        tWR  => 15.000 ns,
--        addr_bits => addr_bits,
--        data_bits => data_bits,
--        cols_bits => cols_bits)
	port map (
        Dq    => dq,
        Dqs   => dqs,
        Addr  => addr,
        Ba    => ba,
        Clk   => clk_p,
        Clk_n => clk_n,
        Cke   => cke,
        Cs_n  => cs_n,
        Ras_n => ras_n,
        Cas_n => cas_n,
        We_n  => we_n,
        Dm    => dm);
end;

configuration nuhs3dsp_structure of testbench is
	for ddr_test 
		for all : nuhs3dsp 
			use entity hdl4fpga.nuhs3dsp(structure);
		end for;
		for all : ddr_model 
			use entity hdl4fpga.mt46v16m16
			generic map (               
				tCK  =>  ddr_period, -- Timing for -6T CL2
				tCH  =>  0.45*ddr_period, -- 0.45*tCK
				tCL  =>  0.45*ddr_period, -- 0.45*tCK
				tDH  =>  0.450 ns,
				tDS  =>  0.450 ns,
				tIH  =>  0.750 ns,
				tIS  =>  0.750 ns,
				tMRD => 12.000 ns,
				tRAS => 42.000 ns,
				tRAP => 15.000 ns,
				tRC  => 60.000 ns,
				tRFC => 72.000 ns,
				tRCD => 15.000 ns,
				tRP  => 15.000 ns,
				tRRD => 12.000 ns,
				tWR  => 15.000 ns,
				addr_bits => addr_bits,
				data_bits => data_bits,
				cols_bits => cols_bits)
			port map (
				Dq    => dq,
				Dqs   => dqs,
				Addr  => addr,
				Ba    => ba,
				Clk   => clk_p,
				Clk_n => clk_n,
				Cke   => cke,
				Cs_n  => cs_n,
				Ras_n => ras_n,
				Cas_n => cas_n,
				We_n  => we_n,
				Dm    => dm);
		end for;
	end for;
end;

configuration nuhs3dsp_ddr_test of testbench is
	for ddr_test 
		for all : nuhs3dsp 
			use entity hdl4fpga.nuhs3dsp(ddr_test);
		end for;
		for all : ddr_model 
			use entity hdl4fpga.mt46v16m16
			generic map (               
				tCK  =>  ddr_period, -- Timing for -6T CL2
				tCH  =>  0.45*ddr_period, -- 0.45*tCK
				tCL  =>  0.45*ddr_period, -- 0.45*tCK
				tDH  =>  0.450 ns,
				tDS  =>  0.450 ns,
				tIH  =>  0.750 ns,
				tIS  =>  0.750 ns,
				tMRD => 12.000 ns,
				tRAS => 42.000 ns,
				tRAP => 15.000 ns,
				tRC  => 60.000 ns,
				tRFC => 72.000 ns,
				tRCD => 15.000 ns,
				tRP  => 15.000 ns,
				tRRD => 12.000 ns,
				tWR  => 15.000 ns,
				addr_bits => addr_bits,
				data_bits => data_bits,
				cols_bits => cols_bits)
			port map (
				Dq    => dq,
				Dqs   => dqs,
				Addr  => addr,
				Ba    => ba,
				Clk   => clk_p,
				Clk_n => clk_n,
				Cke   => cke,
				Cs_n  => cs_n,
				Ras_n => ras_n,
				Cas_n => cas_n,
				We_n  => we_n,
				Dm    => dm);
		end for;
	end for;
end;

configuration nuhs3dsp_structure_md of testbench is
	for ddr_test 
		for all : nuhs3dsp 
			use entity hdl4fpga.nuhs3dsp(structure);
		end for;
		for all : ddr_model 
			use entity hdl4fpga.ddr_model
			port map (
				Dq    => dq,
				Dqs   => dqs,
				Addr  => addr,
				Ba    => ba,
				Clk   => clk_p,
				Clk_n => clk_n,
				Cke   => cke,
				Cs_n  => cs_n,
				Ras_n => ras_n,
				Cas_n => cas_n,
				We_n  => we_n,
				Dm    => dm);
		end for;
	end for;
end;

configuration nuhs3dsp_ddr_test_md of testbench is
	for ddr_test 
		for all : nuhs3dsp 
			use entity hdl4fpga.nuhs3dsp(ddr_test);
		end for;
		for all : ddr_model 
			use entity hdl4fpga.ddr_model
			port map (
				Dq    => dq,
				Dqs   => dqs,
				Addr  => addr,
				Ba    => ba,
				Clk   => clk_p,
				Clk_n => clk_n,
				Cke   => cke,
				Cs_n  => cs_n,
				Ras_n => ras_n,
				Cas_n => cas_n,
				We_n  => we_n,
				Dm    => dm);
		end for;
	end for;
end;
