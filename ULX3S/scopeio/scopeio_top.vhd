-- AUTHOR = EMARD
-- LICENSE = BSD

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library ecp5u;
use ecp5u.components.all;

library hdl4fpga;
use hdl4fpga.std.all;
use hdl4fpga.scopeiopkg.all;
use hdl4fpga.usbh_setup_pack.all; -- for HID report length

architecture beh of ulx3s is
	-- vlayout_id
	-- 0: 1920x1080 @ 60Hz 148MHz 16-pix grid 8-pix font 2 segments
	-- 1:  800x600  @ 60Hz  40MHz
	-- 2: 1920x1080 @ 30Hz  75MHz NOTE: HARD OVERCLOCK
	-- 3: 1280x768  @ 60Hz  75MHz NOTE: HARD OVERCLOCK
	-- 4: 1280x1024 @ 60Hz 108MHz  8-pix grid 4-pix font 1 segment
	-- 5:  800x600  @ 60Hz  40MHz 16-pix grid 8-pix font 4 segments FULL SCREEN
	-- 6:  640x480  @ 60Hz  25MHz
	-- 7:   96x64   @ 60Hz  40MHz  8-pix grid 8-pix font 1 segment
	-- 8:  800x480  @ 60Hz  30MHz 16-pix grid 8-pix font 3 segments
	-- 9: 1024x600  @ 60Hz  50MHz 16-pix grid 8-pix font 4 segments
	--10:  800x480  @ 60Hz  40MHz 16-pix grid 8-pix font 3 segments
        constant vlayout_id: integer := 6;
        -- GUI pointing device type (enable max 1)
        constant C_mouse_ps2    : boolean := false;  -- PS/2 or USB+PS/2 mouse
        constant C_mouse_usb    : boolean := false; -- USB  or USB+PS/2 mouse
        constant C_mouse_usb_speed: std_logic := '0'; -- '0':Low Speed, '1':Full Speed
        constant C_mouse_host   : boolean := false; -- serial port for host mouse instead of standard RGTR control
        -- serial port type (enable max 1)
	constant C_origserial   : boolean := false; -- use Miguel's uart receiver (RXD line)
        constant C_extserial    : boolean := true;  -- use Emard's uart receiver (RXD line)
        constant C_usbserial    : boolean := false; -- USB-CDC Serial (D+/D- lines)
        constant C_usbethernet  : boolean := false; -- USB-CDC Ethernet (D+/D- lines)
        constant C_rmiiethernet : boolean := false; -- RMII (LAN8720) Ethernet GPN9-13
        constant C_istream_bits : natural := 8;     -- default 8, for RMII 2
        -- USB ethernet network ping test
        constant C_usbping_test : boolean := false; -- USB-CDC core ping in ethernet mode (D+/D- lines)
        -- internally connected "probes" (enable max 1)
        constant C_view_adc     : boolean := true;  -- ADC onboard analog view
        constant C_view_spi     : boolean := false; -- SPI digital view
        constant C_view_usb     : boolean := false; -- USB or PS/2 digital view
        constant C_view_usb_decoder: boolean := false;
        constant C_decoder_usb_speed: std_logic := '0'; -- '0':Low Speed, '1':Full Speed
        constant C_view_utmi1   : boolean := false; -- USB UTMI PHY debugging view
        constant C_view_usbphy  : boolean := false; -- USB PHY debug
        constant C_view_binary_gain: integer := 1;  -- 2**n -- for SPI/USB digital view
        constant C_view_utmi    : boolean := false; -- USB3300 PHY linestate digital view
        constant C_view_istream : boolean := false; -- NET output
        constant C_view_clk     : boolean := false; -- PLL clock output
        -- ADC SPI core
        constant C_adc: boolean := true; -- true: onboard ADC (MAX11123-11125)
        constant C_buttons_test: boolean := true; -- false: normal use and for external AD/DA, true: pressing buttons will test ADC channels
        constant C_adc_view_low_bits: boolean := true; -- false: 3.3V, true: 200mV (to see ADC noise)
        constant C_adc_slowdown: boolean := false; -- true: ADC 2x slower, use for more detailed detailed SPI digital view
	constant C_adc_timing_exact: integer range 0 to 1 := 1; -- 0 for adc_slowdown = true, 1 for adc_slowdown = false
	constant C_adc_bits: integer := 8; -- don't touch 12 for onboard ADC
	constant C_adc_channels: integer := 4; -- don't touch 4 for onboard ADC
        -- External ADC AN108 with PCB https://oshpark.com/profiles/gojimmypi
        constant C_adc_an108: boolean := false; -- true: external AD/DA AN108 32MHz AD, 125MHz DA
	alias an108_gp: std_logic_vector is gn; -- for different cabling, swap pin rows gp/gn
	alias an108_gn: std_logic_vector is gp;
	-- ADC software simulation
	constant C_adc_simulator: boolean := false;
        -- External USB3300 PHY ULPI
        constant C_usb3300_phy: boolean := false; -- true: external USB PHY (currently useable only as linestate sniffer)
        -- scopeio
	constant inputs: natural := 4; -- number of input channels (traces)
	-- OLED HEX - what to display (enable max 1)
	constant C_oled_hex_view_adc : boolean := false;
	constant C_oled_hex_view_uart: boolean := false;
	constant C_oled_hex_view_usb : boolean := false;

	constant C_oled_hex_view_net : boolean := false;
	constant C_oled_hex_view_istream: boolean := false;
	-- OLED HEX or VGA (enable max 1)
        constant C_oled_hex: boolean := false;  -- true: use OLED HEX, false: no oled - can save some LUTs
        constant C_oled_vga: boolean := false; -- false:DVI video, true:OLED video, enable either HEX or VGA, not both OLEDs

	alias ps2_clock        : std_logic is usb_fpga_bd_dp;
	alias ps2_data         : std_logic is usb_fpga_bd_dn;
	alias ps2_clock_pullup : std_logic is usb_fpga_pu_dp;
	alias ps2_data_pullup  : std_logic is usb_fpga_pu_dn;
	

--	alias ad_clk : std_logic is gn(15);
--	alias ad     : std_logic_vector(7 downto 0) is std_logic_vector((7=>gp(16),6=>gn(16),5=>gp(17),4=>gn(17),3=>gp(18),2=>gn(18),1=>gp(19),0=>gn(19)));
--	alias da_clk : std_logic is gn(25);
--	alias da     : std_logic_vector(7 downto 0) is std_logic_vector((7=>gp(25),6=>gn(24),5=>gp(24),4=>gn(23),3=>gp(23),2=>gn(22),1=>gp(22),0=>gn(21)));

	signal rst        : std_logic := '0';
	signal clk_pll    : std_logic_vector(3 downto 0); -- output from pll
	signal clk        : std_logic;
	signal clk_pixel_shift : std_logic; -- 5x vga clk, in phase

	signal vga_clk    : std_logic;
	signal vga_hsync  : std_logic;
	signal vga_vsync  : std_logic;
	signal vga_blank, vga_display_enable  : std_logic;
	signal vga_rgb    : std_logic_vector(0 to 6-1);

	signal vga_hsync_test : std_logic;
	signal vga_vsync_test : std_logic;
	signal vga_blank_test : std_logic;
	signal vga_rgb_test   : std_logic_vector(0 to 6-1);
        signal dvid_crgb      : std_logic_vector(7 downto 0);
        signal ddr_d          : std_logic_vector(3 downto 0);
	constant sample_size  : natural := 8;

	signal clk_oled : std_logic := '0';
	signal clk_ena_oled : std_logic := '1';
	signal R_oled_data: std_logic_vector(63 downto 0);

	signal clk_adc : std_logic := '0';

	function sinctab (
		constant x0 : integer;
		constant x1 : integer;
		constant n  : natural)
		return std_logic_vector is
		variable y   : real;
		variable aux : std_logic_vector(n*(x1+1)-1 downto n*x0);
		constant freq : real := 4*8.0;
	begin
		for i in x0 to x1 loop
			y := real(2**(n-2)-1)*64.0*(8.0/freq);
			if i/=0 then
				y := y*sin((2.0*MATH_PI*real(i)*freq)/real(x1-x0+1))/real(i);
			else
				y := freq*y*(2.0*MATH_PI)/real(x1-x0+1);
			end if;
			-- y := y - (64.0+24.0);
			aux((i+1)*n-1 downto i*n) := std_logic_vector(to_signed(integer(trunc(y)),n));
		end loop;
		return aux;
	end;
	signal input_addr : std_logic_vector(11-1 downto 0); -- for BRAM as internal signal generator

	-- color palette, not easy to have so many distinct colors
	constant C_color_palette: std_logic_vector(0 to 11*(vga_rgb'length+1)-1) :=
          b"1_111100_1_001111_1_001100_1_110111_1_111111_1_110100_1_111010_1_111000_1_001011_1_000111_1_011011";
        --  RRGGBB RRGGBB RRGGBB RRGGBB RRGGBB RRGGBB RRGGBB RRGGBB RRGGBB RRGGBB RRGGBB
        --  trace0 trace1 trace2 trace3 trace4 trace5 trace6 trace7 trace8 trace9 trace10
        --  yellow cyan   green  violet white  orange red    brown  turqui blue   lila
        -- subset of colors for enabled inputs
	constant C_tracesfg: std_logic_vector(0 to inputs*(vga_rgb'length+1)-1) := C_color_palette(0 to inputs*(vga_rgb'length+1)-1);

	signal trace_yellow, trace_cyan, trace_green, trace_violet, trace_orange, trace_white, trace_blue, trace_lila, trace_sine: std_logic_vector(sample_size-1 downto 0);
	signal S_input_ena : std_logic := '1';
	signal samples     : std_logic_vector(0 to inputs*sample_size-1);

	constant baudrate    : natural := 115200;
	constant uart_clk_hz : natural := 40000000; -- Hz

	signal clk_uart : std_logic := '0';
	signal uart_ena : std_logic := '0';
	signal clk_istream : std_logic;
	signal clk_input : std_logic;
	signal clk_daisy : std_logic := '0';


	--signal uart_rxc   : std_logic;
	signal uart_sin   : std_logic;
	signal uart_rxdv  : std_logic;
	signal uart_rxd   : std_logic_vector(7 downto 0);

	signal so_null    : std_logic_vector(C_istream_bits-1 downto 0); -- (1 downto 0) for LAN8720 RMII ETH

	signal fromistreamdaisy_frm  : std_logic;
	signal fromistreamdaisy_irdy : std_logic;
	signal fromistreamdaisy_data : std_logic_vector(so_null'range);

	signal istream_frm  : std_logic;
	signal istream_irdy : std_logic;
	signal istream_data : std_logic_vector(so_null'range);

	signal usbmouse_frommousedaisy_frm  : std_logic;
	signal usbmouse_frommousedaisy_irdy : std_logic;
	signal usbmouse_frommousedaisy_data : std_logic_vector(8-1 downto 0);

	signal net_fromistreamdaisy_frm  : std_logic;
	signal net_fromistreamdaisy_irdy : std_logic;
	signal net_fromistreamdaisy_data : std_logic_vector(1 downto 0);

	-- PS/2 mouse
	signal clk_mouse       : std_logic := '0';
	signal clk_ena_mouse   : std_logic := '1';

	-- UTMI sniffer
        signal R_utmi_linestate: std_logic_vector(1 downto 0);

	-- USB mouse
	signal clk_usb         : std_logic; -- 6 MHz
	constant C_hid_report_length_ltd: integer := min(7,C_report_length);
	signal S_hid_report    : std_logic_vector(C_report_length*8-1 downto 0);
	signal S_hid_valid     : std_logic;
	signal S_usb_rx_count  : std_logic_vector(15 downto 0);
	signal S_usb_rx_done   : std_logic;

	-- USB serial
	signal dbg_sync_err, dbg_bit_stuff_err, dbg_byte_err: std_logic;

	signal mii_rxvalid, mii_txvalid: std_logic;
	signal mii_rxdata,  mii_txdata: std_logic_vector(7 downto 0);
	signal monitor: std_logic_vector(2 downto 0);

	-- HOST mouse (uses "rgtr" from scopeio)
	--signal S_rgtr_id       : std_logic_vector(8-1 downto 0);
        --signal S_rgtr_dv       : std_logic;
        --signal S_rgtr_data     : std_logic_vector(32-1 downto 0);

	signal R_adc_slowdown: unsigned(1 downto 0) := (others => '1');
	signal S_adc_dv: std_logic;
	signal S_adc_data: std_logic_vector(C_adc_channels*C_adc_bits-1 downto 0);

	signal fpga_gsrn : std_logic;
	signal reset_counter : unsigned(19 downto 0);
        constant C_btn_idle: std_logic_vector(btn'range) := "0000001";
        signal R_btn_debounced: std_logic_vector(btn'range) := C_btn_idle;

	constant vt_step : real := (3.3e3*milli) / (2.0**12*femto); -- Volts
begin
    B_btn_debounce: block
      signal R_btn_debounce: unsigned(20 downto 0);
    begin
	process(clk)
	begin
	  if rising_edge(clk) then
	    if btn /= C_btn_idle and R_btn_debounce(R_btn_debounce'high) = '0' then
	      R_btn_debounce <= R_btn_debounce + 1;
            else
              if btn = C_btn_idle then
                R_btn_debounce <= (others => '0');
              end if;
            end if;
            if R_btn_debounce(R_btn_debounce'high) = '1' then
              R_btn_debounced <= btn;
            else
              R_btn_debounced <= C_btn_idle;
            end if;
	  end if;
	end process;
    end block;

    -- EXIT from this bitstream:
    -- Pressing BTN0 (debounced) will pull down PROGRAMN and
    -- initiate jump to the next multiboot image.
    -- multiboot image can be made with lattice deployment tool "ddt_cmd"
    -- or opensource prjtrellis "ecpmulti".
    --user_programn <= R_btn_debounced(0);

	-- fpga_gsrn <= btn(0);
	fpga_gsrn <= '1';

--        G_verilog_clk: if false generate
--        clk_verilog_25_200: entity work.clk_verilog
--        port map
--        (
--          clkin        =>  clk_25MHz,
--          phasesel     =>  '1' & R_btn_debounced(2), -- "10" -> clkout2
--          phasedir     =>  R_btn_debounced(5),
--          phasestep    =>  R_btn_debounced(3),
--          phaseloadreg =>  R_btn_debounced(4),
--          clkout0      =>  clk_pll(0), -- 200 MHz
--          clkout1      =>  clk_pll(1), --  40 MHz
--          clkout2      =>  clk_pll(2), --   6 MHz
--          clkout3      =>  clk_pll(3)  --   6 MHz
--        );
--        end generate;

	G_vhdl_clk: if true generate
        clk_vhdl_25_200: entity work.clk_25_175_40_66_6
        port map
        (
          clki        =>  clk_25MHz,
          clkop       =>  clk_pll(0), -- 200 MHz
          clkos       =>  clk_pll(1), --  40 MHz
          clkos2      =>  clk_pll(2), --  66.667 MHz
          clkos3      =>  clk_pll(3)  --   6 MHz
        );
        end generate;

        -- 800x600
        clk_pixel_shift <= clk_pll(0); -- 200/375 MHz
        vga_clk <= clk_pll(1); -- 40 MHz
        clk_oled <= clk_pll(1); -- 40/75 MHz
        clk <= clk_pll(1); -- 25 MHz pulse sinewave function
        --clk_adc <= clk_pll(2); -- 62.5 MHz (ADC clock 15.625MHz)
        clk_adc <= clk_pll(1); -- 40/75 MHz (same as vga_clk, ADC overclock 18.75MHz > 16MHz)
        --clk_adc <= clk_usb; -- 7.5/48 MHz
        clk_uart <= clk_pll(1); -- 40/75 MHz same as vga_clk
        clk_mouse <= clk_pll(1); -- 40/75 MHz same as vga_clk
        -- 1920x1080
        --clk_pixel_shift <= clk_pll(0); -- 375 MHz
        --vga_clk <= clk_pll(1); -- 75 MHz

        process(clk_mouse)
        begin
          if rising_edge(clk_mouse) then
            clk_ena_mouse <= not clk_ena_mouse; -- reduce clk 2x
          end if;
        end process;

        process(clk_oled)
        begin
          if rising_edge(clk_oled) then
            clk_ena_oled <= not clk_ena_oled; -- reduce clk 2x
          end if;
        end process;

	process(vga_clk)
	begin
          if rising_edge(vga_clk) then
            if btn(0) = '0' then -- BTN0 = 0 when pressed
              if(reset_counter(reset_counter'high) = '0') then
                reset_counter <= reset_counter + 1;
              end if;
            else -- BTN0 = 1 when not pressed
              reset_counter <= (others => '0');
	    end if;
          end if;
	end process;
	rst <= reset_counter(reset_counter'high);

        G_yes_usb3300_phy: if C_usb3300_phy generate
          -- Ignore fake glitches displayed occasionally.
          -- glitches maybe because of using non clock-capable pin?
          -- Otherwise it's useable to see what's happening at D+/D- online.
          B_usb3300_phy: block
            -- aliases exactly what is written on ULPI board
            alias  phy_stp    : std_logic is gp(21);
            alias  phy_nxt    : std_logic is gp(22);
            alias  phy_dir    : std_logic is gp(23);
            alias  phy_clkout : std_logic is gp(24);
            --   GP24 is not clock capable but can be used with acceptable phase shift
            --   documented clock  capable: GP17
            -- undocumented clock  capable: GN17 GN16 GP16
            alias  phy_reset  : std_logic is gp(25);
            alias  phy_d7     : std_logic is gn(21);
            alias  phy_d6     : std_logic is gn(22);
            alias  phy_d5     : std_logic is gn(23);
            alias  phy_d4     : std_logic is gn(24);
            alias  phy_d3     : std_logic is gn(25);
            alias  phy_d2     : std_logic is gn(26);
            alias  phy_d1     : std_logic is gn(27);
            alias  phy_d0     : std_logic is gp(27);

            signal phy_di, phy_do    : std_logic_vector(7 downto 0);

            signal ulpi_clk60_i      : std_logic;
            signal ulpi_rst_i        : std_logic;
            signal ulpi_data_out_i   : std_logic_vector(7 downto 0);
            signal ulpi_data_in_o    : std_logic_vector(7 downto 0);
            signal ulpi_dir_i        : std_logic;
            signal ulpi_nxt_i        : std_logic;
            signal ulpi_stp_o        : std_logic;

            signal utmi_txvalid      : std_logic := '0';
            signal utmi_txready      : std_logic;
            signal utmi_rxvalid      : std_logic;
            signal utmi_rxactive     : std_logic;
            signal utmi_rxerror      : std_logic;
            signal utmi_data_miso    : std_logic_vector(7 downto 0);
            signal utmi_data_mosi    : std_logic_vector(7 downto 0) := x"00";
            signal utmi_xcvrselect   : std_logic_vector(1 downto 0) := "00";
            signal utmi_termselect   : std_logic := '0';
            signal utmi_op_mode      : std_logic_vector(1 downto 0) := "01"; -- non-driving
            signal utmi_dppulldown   : std_logic := '0';
            signal utmi_dmpulldown   : std_logic := '0';
            signal utmi_linestate    : std_logic_vector(1 downto 0);
            
            signal R_utmi_linestate_o: std_logic_vector(1 downto 0);
          begin
            phy_di(0)  <= phy_d0;
            phy_di(1)  <= phy_d1;
            phy_di(2)  <= phy_d2;
            phy_di(3)  <= phy_d3;
            phy_di(4)  <= phy_d4;
            phy_di(5)  <= phy_d5;
            phy_di(6)  <= phy_d6;
            phy_di(7)  <= phy_d7;

            phy_d0     <= phy_do(0) when phy_dir = '0' else 'Z';
            phy_d1     <= phy_do(1) when phy_dir = '0' else 'Z';
            phy_d2     <= phy_do(2) when phy_dir = '0' else 'Z';
            phy_d3     <= phy_do(3) when phy_dir = '0' else 'Z';
            phy_d4     <= phy_do(4) when phy_dir = '0' else 'Z';
            phy_d5     <= phy_do(5) when phy_dir = '0' else 'Z';
            phy_d6     <= phy_do(6) when phy_dir = '0' else 'Z';
            phy_d7     <= phy_do(7) when phy_dir = '0' else 'Z';

            ulpi_clk60_i    <= not phy_clkout and btn(0);
            ulpi_rst_i      <= phy_reset;
            ulpi_dir_i      <= phy_dir;
            ulpi_nxt_i      <= phy_nxt;
            ulpi_data_out_i <= phy_di;
            phy_do          <= ulpi_data_in_o;
            phy_stp         <= ulpi_stp_o;

            ulpi_wrapper_inst: entity work.ulpi_wrapper_vhdl
            port map
            (
              ulpi_clk60_i       => ulpi_clk60_i,
              ulpi_rst_i         => ulpi_rst_i,
              ulpi_dir_i         => ulpi_dir_i,
              ulpi_nxt_i         => ulpi_nxt_i,
              ulpi_data_out_i    => ulpi_data_out_i,
              ulpi_data_in_o     => ulpi_data_in_o,
              ulpi_stp_o         => ulpi_stp_o,

              utmi_txvalid_i     => utmi_txvalid,
              utmi_txready_o     => utmi_txready,
              utmi_rxvalid_o     => utmi_rxvalid,
              utmi_rxactive_o    => utmi_rxactive,
              utmi_rxerror_o     => utmi_rxerror,
              utmi_data_in_o     => utmi_data_miso,
              utmi_data_out_i    => utmi_data_mosi,
              utmi_xcvrselect_i  => utmi_xcvrselect,
              utmi_termselect_i  => utmi_termselect,
              utmi_op_mode_i     => utmi_op_mode,
              utmi_dppulldown_i  => utmi_dppulldown,
              utmi_dmpulldown_i  => utmi_dmpulldown,
              utmi_linestate_o   => utmi_linestate
            );
            process(ulpi_clk60_i)
            begin
              if rising_edge(ulpi_clk60_i) then
                R_utmi_linestate_o <= utmi_linestate;
              end if;
            end process;
            process(clk_adc)
            begin
              if rising_edge(clk_adc) then
                R_utmi_linestate <= R_utmi_linestate_o;
              end if;
            end process;
          end block;
        end generate;


        -- replacement for ADC that manifests the problem
	G_adc_simulator: if C_adc_simulator generate
	  B_slow_pulse_generator: block
	    signal R_pulse_counter: unsigned(10 downto 0);
	    signal R_pulse_ena: std_logic;
	  begin
	    process(clk_adc)
	    begin
	      if rising_edge(clk_adc) then
	        if R_pulse_counter <= 2040 then
		  R_pulse_counter <= R_pulse_counter + 1;
		else
		  R_pulse_counter <= (others => '0');
		end if;
	        if R_pulse_counter(5 downto 0) = "00000" then -- every 64
	          R_pulse_ena <= '1';
	        else
	          R_pulse_ena <= '0';
	        end if;
	      end if;
	    end process;
	    -- ch0
	    S_adc_data(10+C_adc_bits*0) <= R_pulse_counter(R_pulse_counter'high); -- wave
	    S_adc_data( 6+C_adc_bits*0 downto 5+C_adc_bits*0) <= "10"; -- small y offset
	    -- ch1
	    S_adc_data( 9+C_adc_bits*1) <= not R_pulse_counter(R_pulse_counter'high); -- wave
	    S_adc_data( 6+C_adc_bits*1 downto 5+C_adc_bits*1) <= "01"; -- small y offset
	    -- ch2
	    S_adc_data( 8+C_adc_bits*2) <= R_pulse_counter(R_pulse_counter'high-1); -- wave
	    S_adc_data( 6+C_adc_bits*2 downto 5+C_adc_bits*2) <= "11"; -- small y offset
	    -- ch3
	    S_adc_data( 7+C_adc_bits*3) <= not R_pulse_counter(R_pulse_counter'high-1); -- wave
	    S_adc_data( 6+C_adc_bits*3 downto 5+C_adc_bits*3) <= "00"; -- small y offset
	    --S_adc_dv <= R_pulse_ena;
	    S_adc_dv <= '1';
	  end block;
	end generate;

	G_yes_adc_an108: if C_adc_an108 generate
	  B_adc_an108: block
	    signal R_sawtooth: unsigned(7 downto 0);
	    signal R_ad, R_da: std_logic_vector(7 downto 0);
	    signal ad_clk : std_logic;
            signal ad     : std_logic_vector(7 downto 0);
            signal da_clk : std_logic;
            signal da     : std_logic_vector(7 downto 0);
	  begin
--	    ad_clk <= not clk_adc; -- 40 MHz is too fast
            an108_gn(15) <= ad_clk; -- clk_adc/2 -- 20 MHz OK
	    da_clk <= not clk_adc;
            an108_gn(25) <= da_clk; -- clk_adc
            da <= R_sawtooth; -- (R_sawtooth'high) & not std_logic_vector(R_sawtooth(R_sawtooth'high-1 downto 0));
--            da <= trace_sine(trace_sine'high) & not std_logic_vector(trace_sine(trace_sine'high-1 downto 0));
	    process(clk_adc)
	    begin
	      if rising_edge(clk_adc) then
	        ad_clk <= not ad_clk; -- half clock rate 40MHz -> 20MHz
	        if ad_clk = '0' then -- falling edge
	        -- ADC pinout wiring (board labels GP/GN swapped, corrected here)
--                  ad <= (7=>not gp(16),6=>gn(16),5=>gp(17),4=>gn(17),3=>gp(18),2=>gn(18),1=>gp(19),0=>gn(19));
                  ad(7) <= not an108_gp(16);
                  ad(6) <=     an108_gn(16);
                  ad(5) <=     an108_gp(17);
                  ad(4) <=     an108_gn(17);
                  ad(3) <=     an108_gp(18);
                  ad(2) <=     an108_gn(18);
                  ad(1) <=     an108_gp(19);
                  ad(0) <=     an108_gn(19);
                end if;
                -- DAC pinout wiring (board labels GP/GN swapped, corrected here)
                an108_gp(25) <=     da(7);
                an108_gn(24) <= not da(6);
                an108_gp(24) <= not da(5);
                an108_gn(23) <= not da(4);
                an108_gp(23) <= not da(3);
                an108_gn(22) <= not da(2);
                an108_gp(22) <= not da(1);
                an108_gn(21) <= not da(0);
                -- Sawtooth signal generator
	        R_sawtooth <= R_sawtooth + 1;
	      end if;
	    end process;
            -- to scope display
            S_adc_data(7+C_adc_bits*0 downto 0+C_adc_bits*0) <= ad; -- ch0 yellow shows ADC
            S_adc_data(7+C_adc_bits*1 downto 0+C_adc_bits*1) <= da; -- ch1 cyan shows DAC
            S_adc_dv <= '1';
          end block;
	end generate;

	G_yes_adc: if C_adc generate
	G_yes_adc_slowdown: if C_adc_slowdown generate
	process (clk_adc)
	begin
		if rising_edge(clk_adc) then
			if R_adc_slowdown(R_adc_slowdown'high) = '0' then
				R_adc_slowdown <= R_adc_slowdown + 1;
			else
				R_adc_slowdown <= 0;
			end if;
		end if;
	end process;
	end generate;


	adc_e: entity work.max1112x_reader
	generic map
	(
	  C_timing_exact => C_adc_timing_exact,
	  C_channels => C_adc_channels,
	  C_bits => C_adc_bits
	)
	port map
	(
	  clk => clk_adc,
	  clken => R_adc_slowdown(R_adc_slowdown'high),
	  reset => rst,
	  spi_csn => adc_csn,
	  spi_clk => adc_sclk,
	  spi_mosi => adc_mosi,
	  spi_miso => adc_miso,
	  dv => S_adc_dv,
	  data => S_adc_data
	);
	end generate;
	
	-- press buttons to test ADC
	-- for normal use disable this
	G_btn_test: if C_buttons_test generate
	  B_signal_gen: block
            signal R_phase_accu: unsigned(31 downto 0); -- phase accumulator
            signal R_freq: unsigned(31 downto 0) := x"00000043"; -- initial frequency (phase increment)
            signal R_keyrepeat: unsigned(9 downto 0);
	    signal S_generator_p, S_generator_n: std_logic; -- differential pair output
	  begin
	    process(clk_adc)
	    begin
	      if rising_edge(clk_adc) then
	        R_phase_accu <= R_phase_accu + R_freq;
	        if R_keyrepeat(R_keyrepeat'high) = '0' then
	          R_keyrepeat <= R_keyrepeat + 1;
	        else
	          R_keyrepeat <= (others => '0');
	          if btn(1) = '1' and to_integer(R_freq) /= 0  then -- frequency down
	            R_freq <= R_freq - 1;
	            else
                    if btn(2) = '1' then -- frequency up
	              R_freq <= R_freq + 1;
	            end if;
	          end if;
	        end if;
	      end if;
	    end process;
	    S_generator_p <= R_phase_accu(R_phase_accu'high);
	    S_generator_n <= R_phase_accu(R_phase_accu'high) xor R_phase_accu(R_phase_accu'high-1);
	    -- each pressed button will apply a logic level '1'
	    -- to FPGA pin shared with ADC channel which should
	    -- read something from 12'h000 to 12'hFFF with some
	    -- conversion noise
            gn(14) <= S_generator_n when btn(3) = '1' else 'Z';
            gp(14) <= S_generator_p when btn(3) = '1' else 'Z';
            gn(15) <= S_generator_n when btn(4) = '1' else 'Z';
            gp(15) <= S_generator_p when btn(4) = '1' else 'Z';
            gn(16) <= S_generator_p when btn(5) = '1' else 'Z';
            gp(16) <= S_generator_n when btn(5) = '1' else 'Z';
            gn(17) <= S_generator_p when btn(6) = '1' else 'Z';
            gp(17) <= S_generator_n when btn(6) = '1' else 'Z';
          end block;
	end generate;

	process (clk)
	begin
		if rising_edge(clk) then
			input_addr <= std_logic_vector(unsigned(input_addr) + 1);
		end if;
	end process;

	-- internal sine waveform generator
	samples_e : entity hdl4fpga.rom
	generic map (
		bitrom => sinctab(-1024+256, 1023+256, sample_size))
	port map (
		clk  => clk,
		addr => input_addr,
		data => trace_sine);

	G_view_usb: if C_view_usb generate
	S_input_ena <= '1';

	trace_yellow(C_view_binary_gain+3) <= usb_fpga_bd_dp;
	--trace_yellow(C_view_binary_gain+1 downto C_view_binary_gain) <= "00";  -- y offset

	trace_cyan(C_view_binary_gain+3) <= usb_fpga_bd_dn;
	--trace_cyan(C_view_binary_gain+1 downto C_view_binary_gain) <= "01"; -- y offset

	--trace_green(C_view_binary_gain+3) <= usb_fpga_dp;
	trace_green <= S_usb_rx_count(trace_green'range);
	--trace_green(C_view_binary_gain+2) <= monitor(1);
	--trace_green(C_view_binary_gain+1 downto C_view_binary_gain) <= "11"; -- y offset

	trace_violet(C_view_binary_gain+2) <= S_usb_rx_done;
	--trace_violet(C_view_binary_gain+2) <= monitor(0);
	--trace_violet(C_view_binary_gain+4) <= dbg_sync_err;
	--trace_violet(C_view_binary_gain+3) <= dbg_bit_stuff_err;
	--trace_violet(C_view_binary_gain+2) <= dbg_byte_err;
	--trace_violet(C_view_binary_gain+1 downto C_view_binary_gain) <= "10"; -- y offset
	clk_input <= vga_clk;
	end generate;

	G_view_usb_decoder: if C_view_usb_decoder generate
	B_view_usb_decoder: block
	  signal S_decoder_data: std_logic_vector(7 downto 0);
	  signal S_decoder_rxactive, S_decoder_rxvalid: std_logic;
	  signal S_usb_dif, S_usb_dp, S_usb_dn: std_logic;
	begin

	usb_fpga_pu_dp <= 'Z';
	usb_fpga_pu_dn <= 'Z';

	G_decoder_usb_low_speed: if C_decoder_usb_speed = '0' generate
	  clk_usb <= clk_pll(3); -- 6 MHz
	  S_usb_dif <= not usb_fpga_dp;
	  S_usb_dp <= usb_fpga_bd_dn;
	  S_usb_dn <= usb_fpga_bd_dp;
        end generate;

	G_decoder_usb_full_speed: if C_decoder_usb_speed = '1' generate
        E_clk_decoder_fs: entity work.clk_200_48_24_12_6
        port map
        (
          CLKI        =>  clk_pixel_shift, -- clk_200MHz,
          CLKOP       =>  clk_usb, -- clk_48MHz,
          CLKOS       =>  open,    -- clk_24MHz,
          CLKOS2      =>  open,    -- clk_12MHz,
          CLKOS3      =>  open     -- clk_6MHz
        );
	  S_usb_dif <= usb_fpga_dp;
	  S_usb_dp <= usb_fpga_bd_dp;
	  S_usb_dn <= usb_fpga_bd_dn;
        end generate;

        G_core_phy: if true generate
	  E_soft_core_phy_emard: entity hdl4fpga.usb_rx_phy_emard
--	  generic map
--	  (
--	    C_usb_speed      => C_mouse_usb_speed
--	  )
	  port map
	  (
	    clk              => clk_usb,
	    reset            => '0', -- 1:reset active
	    usb_dif          => S_usb_dif,
	    usb_dp           => S_usb_dp, -- swap P/N for USB low speed
            usb_dn           => S_usb_dn, -- core is written by default for USB full speed
--            linestate        => S_up_linestate_emard,
--            rawdata          => S_rawdata_emard,
--            clk_recovered_edge => S_ce_emard,
            rx_en            => '1',
            rx_active        => S_decoder_rxactive,
            valid            => S_decoder_rxvalid,
            data             => S_decoder_data
          );
        end generate;

	trace_yellow(C_view_binary_gain+3) <= usb_fpga_bd_dp;
	trace_cyan(C_view_binary_gain+3) <= usb_fpga_bd_dn;
	trace_green(C_view_binary_gain+3) <= S_decoder_rxactive;
	trace_violet(C_view_binary_gain+2) <= S_decoder_rxvalid;
	trace_white(S_decoder_data'range) <= S_decoder_data;
	clk_input <= clk_usb;
	S_input_ena <= '1';
	end block; -- view usb decoder
	end generate; -- view usb decoder

	G_view_usbphy: if C_view_usbphy generate
	S_input_ena <= '1';
	B_view_usbphy: block
	  signal S_up_linestate, S_up_linestate_emard: std_logic_vector(1 downto 0);
	  signal S_data_orig, S_data_emard: std_logic_vector(7 downto 0);
	  signal S_rxen, S_rxactive, S_rxvalid: std_logic;
	  signal S_rxactive_emard, S_rxvalid_emard: std_logic;
	  signal S_rxerror_emard, S_rxerror: std_logic;
	  signal S_rawdata_emard: std_logic;
	  signal S_se0, S_ce: std_logic;
	  signal S_ce_emard: std_logic;
	begin
	  S_se0 <= (not usb_fpga_bd_dp) and (not usb_fpga_bd_dn);
	  E_soft_core_phy: entity hdl4fpga.usb_rx_phy
--	  generic map
--	  (
--	    C_usb_speed      => C_mouse_usb_speed
--	  )
	  port map
	  (
	    clk              => clk_usb,
	    rst              => not S_se0, -- 0:reset active
	    fs_ce_o          => S_ce,
            rxdp             => usb_fpga_bd_dn, -- swap P/N for USB low speed
            rxdn             => usb_fpga_bd_dp, -- core is written by default for USB full speed
            rxd              => not usb_fpga_dp,
            RxEn_i           => S_rxen,
            RxActive_o       => S_rxactive,
            RxValid_o        => S_rxvalid,
            RxError_o        => S_rxerror,
            DataIn_o         => S_data_orig,
            LineState        => S_up_linestate
          );
          S_rxen <= '1';

	  E_soft_core_phy_emard: entity hdl4fpga.usb_rx_phy_emard
--	  generic map
--	  (
--	    C_usb_speed      => C_mouse_usb_speed
--	  )
	  port map
	  (
	    clk              => clk_usb,
	    reset            => S_se0, -- 1:reset active
	    usb_dif          => not usb_fpga_dp,
	    usb_dp           => usb_fpga_bd_dn, -- swap P/N for USB low speed
            usb_dn           => usb_fpga_bd_dp, -- core is written by default for USB full speed
            linestate        => S_up_linestate_emard,
            rawdata          => S_rawdata_emard,
            clk_recovered_edge => S_ce_emard,
            rx_en            => '1',
            rx_active        => S_rxactive_emard,
            valid            => S_rxvalid_emard,
            data             => S_data_emard
          );

--	  trace_green(C_view_binary_gain+3) <= S_up_linestate(0);
--	  trace_violet(C_view_binary_gain+3) <= S_up_linestate(1);

--	  trace_white(C_view_binary_gain+3) <= S_up_linestate_emard(0);
--	  trace_orange(C_view_binary_gain+3) <= S_up_linestate_emard(1);

--	  trace_green(S_data_orig'range) <= S_data_orig;
--	  trace_violet(C_view_binary_gain+3) <= S_rxvalid;
--	  trace_white(C_view_binary_gain+3) <= S_rxactive;
--	  trace_orange(C_view_binary_gain+3) <= S_ce;  

--	  trace_green(C_view_binary_gain+3) <= S_rxactive;
--	  trace_violet(C_view_binary_gain+3) <= S_rxvalid;
--	  trace_white(C_view_binary_gain+3) <= S_rxactive_emard;
--	  trace_orange(C_view_binary_gain+3) <= S_rxvalid_emard;  

	  trace_green(S_data_orig'range) <= S_data_orig;
	  trace_violet(S_data_emard'range) <= S_data_emard;
--	  trace_white(C_view_binary_gain+3) <= S_rxvalid;
--	  trace_orange(C_view_binary_gain+3) <= S_rxvalid_emard;
	  trace_white(C_view_binary_gain+3) <= S_rxactive;
	  trace_orange(C_view_binary_gain+3) <= S_rxactive_emard;
--	  trace_white(C_view_binary_gain+3) <= S_rxerror;
--	  trace_orange(C_view_binary_gain+3) <= S_rxerror_emard;
--        trace_white(C_view_binary_gain+3) <= S_rxvalid;
--        trace_orange(C_view_binary_gain+3) <= S_rxactive;
--          trace_white(C_view_binary_gain+3) <= S_rxvalid_emard;
--          trace_orange(C_view_binary_gain+3) <= S_rxactive_emard;

	end block;

	trace_yellow(C_view_binary_gain+3) <= usb_fpga_bd_dp;
	trace_cyan(C_view_binary_gain+3) <= usb_fpga_bd_dn;

	clk_input <= vga_clk;
	end generate;

	G_view_utmi: if C_view_utmi generate
	S_input_ena <= '1';
	trace_yellow(C_view_binary_gain+3) <= R_utmi_linestate(0); -- D+
	trace_cyan(C_view_binary_gain+3) <= R_utmi_linestate(1); -- D-
	clk_input <= vga_clk;
	end generate;

	G_view_istream: if C_view_istream generate
	S_input_ena <= '1';
	trace_yellow(C_view_binary_gain+3) <= net_fromistreamdaisy_irdy;
	trace_cyan(C_view_binary_gain+net_fromistreamdaisy_data'high downto C_view_binary_gain) <= net_fromistreamdaisy_data;
	clk_input <= clk_istream;
	end generate;

	G_view_spi: if C_view_spi generate
	S_input_ena <= '1';
	trace_yellow(C_view_binary_gain+4) <= adc_mosi;
	trace_cyan(C_view_binary_gain+4) <= adc_miso;
	trace_green(C_view_binary_gain+3) <= adc_csn;
	trace_violet(C_view_binary_gain+3) <= adc_sclk;
	end generate;

	G_view_adc: if C_view_adc generate
	  S_input_ena  <= S_adc_dv;
	  -- without sign bit
	  G_not_view_low_bits: if not C_adc_view_low_bits generate
	  trace_yellow(trace_yellow'high downto 0) <= S_adc_data(1*C_adc_bits-1) & S_adc_data(1*C_adc_bits-1 downto 1*C_adc_bits-sample_size+1);
	  trace_cyan  (trace_cyan'high   downto 0) <= S_adc_data(2*C_adc_bits-1) & S_adc_data(2*C_adc_bits-1 downto 2*C_adc_bits-sample_size+1);
	  trace_green (trace_green'high  downto 0) <= S_adc_data(3*C_adc_bits-1) & S_adc_data(3*C_adc_bits-1 downto 3*C_adc_bits-sample_size+1);
	  trace_violet(trace_violet'high downto 0) <= S_adc_data(4*C_adc_bits-1) & S_adc_data(4*C_adc_bits-1 downto 4*C_adc_bits-sample_size+1);
	  end generate;
	  G_yes_view_low_bits: if C_adc_view_low_bits generate
	  trace_yellow(trace_yellow'high downto 0) <= S_adc_data(0*C_adc_bits-1+sample_size downto 1*C_adc_bits-C_adc_bits);
	  trace_cyan  (trace_cyan'high   downto 0) <= S_adc_data(1*C_adc_bits-1+sample_size downto 2*C_adc_bits-C_adc_bits);
	  trace_green (trace_green'high  downto 0) <= S_adc_data(2*C_adc_bits-1+sample_size downto 3*C_adc_bits-C_adc_bits);
	  trace_violet(trace_violet'high downto 0) <= S_adc_data(3*C_adc_bits-1+sample_size downto 4*C_adc_bits-C_adc_bits);
	  end generate;
	  clk_input <= clk_adc;
	end generate;

	G_view_clk: if C_view_clk generate
	S_input_ena <= '1';
	trace_yellow(C_view_binary_gain+3) <= clk_pll(2);
	trace_cyan(C_view_binary_gain+3) <= clk_pll(3);
	clk_input <= clk_pixel_shift;
	end generate;

	G_inputs1: if inputs >= 1 generate
	samples(0*sample_size to (0+1)*sample_size-1) <= trace_yellow; -- by default triggered
	end generate;
	G_inputs2: if inputs >= 2 generate
	samples(1*sample_size to (1+1)*sample_size-1) <= trace_cyan;
	end generate;
	G_inputs3: if inputs >= 3 generate
	samples(2*sample_size to (2+1)*sample_size-1) <= trace_green;
	end generate;
	G_inputs4: if inputs >= 4 generate
	samples(3*sample_size to (3+1)*sample_size-1) <= trace_violet;
	end generate;
	G_inputs5: if inputs >= 5 generate
	samples(4*sample_size to (4+1)*sample_size-1) <= trace_white;
	end generate;
	G_inputs6: if inputs >= 6 generate
	samples(5*sample_size to (5+1)*sample_size-1) <= trace_orange;
	--samples(5*sample_size to (5+1)*sample_size-1) <= trace_sine; -- internally generated demo waveform
	end generate;

	G_uart_miguel: if C_origserial generate
	process (clk_uart)
		constant max_count : natural := (uart_clk_hz+16*baudrate/2)/(16*baudrate);
		variable cntr      : unsigned(0 to unsigned_num_bits(max_count-1)-1) := (others => '0');
	begin
		if rising_edge(clk_uart) then
			if cntr = max_count-1 then
				uart_ena <= '1';
				cntr := (others => '0');
			else
				uart_ena <= '0';
				cntr := cntr + 1;
			end if;
		end if;
	end process;

	uartrx_e : entity hdl4fpga.uart_rx
	generic map (
		baudrate => baudrate,
		clk_rate => 16*baudrate)
	port map (
		uart_rxc  => clk_uart,
		uart_sin  => ftdi_txd,
		uart_ena  => uart_ena,
		uart_rxdv => uart_rxdv,
		uart_rxd  => uart_rxd);
	end generate;

	G_uart_emard: if C_extserial generate
	uartrx_e : entity hdl4fpga.uart_rx_f32c
	generic map
	(
		C_baudrate => baudrate,
		C_clk_freq_hz => uart_clk_hz
	)
	port map
	(
		clk  => clk_uart,
		rxd  => ftdi_txd,
		dv   => uart_rxdv,
		byte => uart_rxd
	);
	end generate;

	G_uart_usbserial: if C_usbserial generate
	B_uart_usbserial: block
	  signal phy_rxen, phy_rxvalid: std_logic;
	begin
	-- pulldown 15k for USB HOST mode
	usb_fpga_pu_dp <= '1'; -- D+ pullup for USB1.1 device mode
	usb_fpga_pu_dn <= 'Z'; -- D- no pullup for USB1.1 device mode

        E_clk_usb: entity work.clk_200_48_24_12_6
        port map
        (
          CLKI        =>  clk_pixel_shift, -- clk_200MHz,
          CLKOP       =>  clk_usb, -- clk_48MHz,
          CLKOS       =>  open,    -- clk_24MHz,
          CLKOS2      =>  open,    -- clk_12MHz,
          CLKOS3      =>  open     -- clk_6MHz
        );

	usbserial_e : entity work.usbserial_rxd
	port map
	(
		clk_usb => clk_usb, -- 48 MHz USB core clock
		-- USB interface
		usb_fpga_dp    => usb_fpga_dp,
		--usb_fpga_dn    => usb_fpga_dn,
		usb_fpga_bd_dp => usb_fpga_bd_dp,
		usb_fpga_bd_dn => usb_fpga_bd_dn,
		-- debug
                sync_err       => dbg_sync_err,
                bit_stuff_err  => dbg_bit_stuff_err,
                byte_err       => dbg_byte_err,
                phy_rxen       => phy_rxen,
                phy_rxvalid    => phy_rxvalid,
		-- output data
		clk  => clk_uart,  -- UART application clock
		dv   => uart_rxdv,
		byte => uart_rxd
	);

	G_view_utmi1: if C_view_utmi1 generate
	S_input_ena <= '1';
	trace_yellow(C_view_binary_gain+3) <= usb_fpga_bd_dp;
	trace_cyan(C_view_binary_gain+3) <= usb_fpga_bd_dn;
	trace_green(C_view_binary_gain+3) <= phy_rxvalid;
	--trace_violet(utmi_data_mosi'range) <= utmi_data_mosi;
	trace_violet(C_view_binary_gain+3) <= phy_rxen;
--	trace_white(C_view_binary_gain+3) <= utmi_rxvalid;
--	trace_orange(C_view_binary_gain+3) <= utmi_txvalid;
--	trace_orange(C_view_binary_gain+3) <= phy_txoe; -- same as rx_en
--	trace_orange(C_view_binary_gain+3) <= phy_ce; -- differential dp
	clk_input <= clk_pixel_shift;
	end generate; -- view utmi

	end block;
	end generate;

	G_usbping_test: if C_usbping_test generate
	-- USB-CDC core in ethernet mode, ping debug
        -- usb_serial in network mode will reply to raw nping
        -- ifconfig enx00aabbccddee 192.168.18.254
        -- nping -c 100 --privileged -delay 10ms -q1 --send-eth -e enx00aabbccddee --dest-mac 00:11:22:33:44:AA --data 0011223344556677  192.168.18.1
        -- tcpdump -i enx00aabbccddee -e -XX -n icmp

	-- pulldown 15k for USB HOST mode
	usb_fpga_pu_dp <= '1'; -- D+ pullup for USB1.1 device mode
	usb_fpga_pu_dn <= 'Z'; -- D- no pullup for USB1.1 device mode

        E_clk_usb: entity work.clk_200_48_24_12_6
        port map
        (
          CLKI        =>  clk_pixel_shift, -- clk_200MHz,
          CLKOP       =>  clk_usb, -- clk_48MHz,
          CLKOS       =>  open,    -- clk_24MHz,
          CLKOS2      =>  open,    -- clk_12MHz,
          CLKOS3      =>  open     -- clk_6MHz
        );

	usbserial_e : entity work.usbserial_rxd
	generic map
	(
	  ethernet => true,
	  ping => true
	)
	port map
	(
		clk_usb => clk_usb, -- 48 MHz USB core clock
		-- USB interface
		usb_fpga_dp    => usb_fpga_dp,
		--usb_fpga_dn    => usb_fpga_dn,
		usb_fpga_bd_dp => usb_fpga_bd_dp,
		usb_fpga_bd_dn => usb_fpga_bd_dn,
		-- debug
                sync_err       => dbg_sync_err,
                bit_stuff_err  => dbg_bit_stuff_err,
                byte_err       => dbg_byte_err,
		-- output data
		clk  => clk_uart,  -- UART application clock
		dv   => mii_rxvalid,
		byte => mii_rxdata
	);
	end generate;

	led <= uart_rxd;
--	led <= mii_rxdata;

	G_not_usb_ethernet_mii: if C_extserial or C_usbserial generate
	istreamdaisy_e : entity hdl4fpga.scopeio_istreamdaisy
	port map (
		stream_clk  => clk_uart,
		stream_dv   => uart_rxdv,
		stream_data => uart_rxd,

		chaini_data => (uart_rxd'range => '-'),

		--chaino_clk  => fromistreamdaisy_clk, 
		-- daisy output
		chaino_frm  => fromistreamdaisy_frm, 
		chaino_irdy => fromistreamdaisy_irdy,
		chaino_data => fromistreamdaisy_data
	);
	clk_daisy <= clk_uart;
	end generate;

	G_usb_ethernet_mii: if C_usbethernet generate
	-- /sbin/ifconfig enx00aabbccddee 192.168.18.254
	-- cat /etc/dnsmasq.d/interface.conf
	-- listen-address=192.168.18.254
	-- /usr/sbin/service dnsmasq restart
	-- /usr/sbin/tcpdump -i enx00aabbccddee -e -XX -n
	B_usb_ethernet_mii: block
	signal mii_clk    : std_logic;
	signal mii_txdata_reverse, mii_rxdata_reverse : std_logic_vector(0 to 7);
	signal dummy_udpdaisy_data : std_logic_vector(8-1 downto 0);
	begin
	-- USB-CDC core in ethernet mode
	-- pulldown 15k for USB HOST mode
	usb_fpga_pu_dp <= '1'; -- D+ pullup for USB1.1 device mode
	usb_fpga_pu_dn <= 'Z'; -- D- no pullup for USB1.1 device mode

        E_clk_usb: entity work.clk_200_48_24_12_6
        port map
        (
          CLKI        =>  clk_pixel_shift, -- clk_200MHz,
          CLKOP       =>  clk_usb, -- clk_48MHz,
          CLKOS       =>  open,    -- clk_24MHz,
          CLKOS2      =>  open,    -- clk_12MHz,
          CLKOS3      =>  open     -- clk_6MHz
        );

        mii_clk <= clk_uart;

	usbethernet_e : entity hdl4fpga.usb_mii
	port map
	(
		clk_usb => clk_usb, -- 48 MHz USB core clock
		-- USB interface
		usb_fpga_dp    => usb_fpga_dp,
		--usb_fpga_dn    => usb_fpga_dn,
		usb_fpga_bd_dp => usb_fpga_bd_dp,
		usb_fpga_bd_dn => usb_fpga_bd_dn,
		-- debug
                sync_err       => dbg_sync_err,
                bit_stuff_err  => dbg_bit_stuff_err,
                byte_err       => dbg_byte_err,
		-- I/O data
		mii_clk        => mii_clk,    -- <- MII application clock
		mii_rxvalid    => mii_rxvalid, -- ->
		mii_rxdata     => mii_rxdata,  -- ->
		mii_txvalid    => mii_txvalid, -- <-
		mii_txdata     => mii_txdata   -- <-
	);

	mii_txdata <= reverse(mii_txdata_reverse);
	mii_rxdata_reverse <= reverse(mii_rxdata);

	udpipdaisy_e : entity hdl4fpga.scopeio_udpipdaisy
	generic map(
	        preamble_disable => true,
	        crc_disable => true
	)
	port map (
		ipcfg_req   => R_btn_debounced(1),

		phy_rxc     => mii_clk,
		phy_rx_dv   => mii_rxvalid,
		phy_rx_d    => mii_rxdata_reverse,

		phy_txc     => mii_clk, 
		phy_tx_en   => mii_txvalid,
		phy_tx_d    => mii_txdata_reverse,
--		monitor     => monitor, btn => R_btn_debounced(2),
		chaini_sel  => '0',

		chaini_frm  => '0',
		chaini_irdy => open,
		chaini_data => dummy_udpdaisy_data,

		chaino_frm  => fromistreamdaisy_frm,
		chaino_irdy => fromistreamdaisy_irdy,
		chaino_data => fromistreamdaisy_data
        );
        clk_daisy <= mii_clk;
        end block;
	end generate; -- end USB ethernet


	G_oled_hex_view_uart: if C_oled_hex_view_uart generate
	  process(clk_uart)
	  begin
	    if rising_edge(clk_uart) then
	      if uart_rxdv = '1' then
                R_oled_data <= R_oled_data(R_oled_data'high-uart_rxd'length downto 0) & uart_rxd;
              end if;
            end if;
          end process;
	end generate;

	G_oled_hex_view_istream: if C_oled_hex_view_istream generate
	  process(clk_istream)
	  begin
	    if rising_edge(clk_istream) then
	      if istream_irdy = '1' then
                R_oled_data <= R_oled_data(R_oled_data'high-istream_data'length downto 0) & istream_data;
              end if;
            end if;
          end process;
	end generate;

	G_oled_hex_view_net: if C_oled_hex_view_net generate
	  process(clk_uart)
	  begin
	    if rising_edge(clk_uart) then
	      if mii_rxvalid = '1' then
                R_oled_data <= R_oled_data(R_oled_data'high-mii_rxdata'length downto 0) & mii_rxdata;
              end if;
            end if;
          end process;
	end generate;

	G_oled_hex_view_adc_report: if C_oled_hex_view_adc generate
	  process(clk_adc)
	  begin
	    if rising_edge(clk_adc) then
	      if S_adc_dv = '1' then
                R_oled_data(S_adc_data'range) <= S_adc_data;
	      end if;
	    end if;
	  end process;
	end generate;

	C_oled_hex_view_hid_report: if C_oled_hex_view_usb generate
	  process(clk_usb)
	  begin
	    if rising_edge(clk_usb) then
              R_oled_data(C_hid_report_length_ltd*8-1 downto 0) <= S_hid_report(C_hid_report_length_ltd*8-1 downto 0);
              if S_usb_rx_done = '1' and S_usb_rx_count(7 downto 0) /= x"00" then
                R_oled_data(63 downto 56) <= S_usb_rx_count(7 downto 0);
              end if;
	    end if;
	  end process;
	end generate;

	G_oled: if C_oled_hex generate
	-- OLED display for debugging
	oled_e: entity work.oled_hex_decoder
	generic map
	(
	  C_data_len => R_oled_data'length -- number of input bits
	)
	port map
	(
	  clk => clk_oled, -- 40/75 MHz
	  clk_ena => clk_ena_oled, -- reduce to 1-25 MHz
	  data => R_oled_data,
	  spi_clk => oled_clk,
	  spi_mosi => oled_mosi,
	  spi_dc => oled_dc,
	  spi_resn => oled_resn,
	  spi_csn => oled_csn
	);
	end generate;

	G_mouse_ps2: if C_mouse_ps2 generate
	-- pullups 1.5k for the PS/2 mouse connected to US2 port
	ps2_clock_pullup <= '1';
	ps2_data_pullup  <= '1';
	E_ps2mouse2daisy: entity hdl4fpga.scopeio_ps2mouse2daisy
	generic map(
		C_inputs    => inputs,
		C_tracesfg  => C_tracesfg,
		vlayout_id  => vlayout_id
	)
	port map (
		clk         => clk_mouse,
		clk_ena     => clk_ena_mouse,
		ps2m_reset  => rst,
		ps2m_clk    => ps2_clock,
		ps2m_dat    => ps2_data,
		-- daisy input
		chaini_frm  => fromistreamdaisy_frm,
		chaini_irdy => fromistreamdaisy_irdy,
		chaini_data => fromistreamdaisy_data,
		-- daisy output
		chaino_frm  => istream_frm,
		chaino_irdy => istream_irdy,
		chaino_data => istream_data
	);
	clk_istream <= clk_mouse;
	end generate; -- PS/2 mouse

	G_mouse_usb: if C_mouse_usb generate
	B_mouse_usb: block
          signal utmi_txready   : std_logic;
          signal utmi_data_mosi : std_logic_vector(7 downto 0);
          signal utmi_rxvalid   : std_logic;
          signal utmi_rxactive  : std_logic;
          signal utmi_linectrl  : std_logic;
          signal utmi_linestate : std_logic_vector(1 downto 0);
          signal utmi_data_miso : std_logic_vector(7 downto 0);
          signal utmi_txvalid   : std_logic;
          signal phy_txoe       : std_logic;
          signal phy_ce         : std_logic;
	begin
	-- pulldown 15k for USB HOST mode
	usb_fpga_pu_dp <= '0';
	usb_fpga_pu_dn <= '0';

	G_mouse_usb_low_speed: if C_mouse_usb_speed = '0' generate
	  clk_usb <= clk_pll(3); -- 6 MHz
        end generate;

	G_mouse_usb_full_speed: if C_mouse_usb_speed = '1' generate
        E_clk_usb: entity work.clk_200_48_24_12_6
        port map
        (
          CLKI        =>  clk_pixel_shift, -- clk_200MHz,
          CLKOP       =>  clk_usb, -- clk_48MHz,
          CLKOS       =>  open,    -- clk_24MHz,
          CLKOS2      =>  open,    -- clk_12MHz,
          CLKOS3      =>  open     -- clk_6MHz
        );
        end generate;

        G_soft_core_phy: if true generate
	E_soft_core_phy: entity hdl4fpga.usb11_phy_transciever
	generic map
	(
	  C_usb_speed      => C_mouse_usb_speed
	)
	port map
	(
	  clk              => clk_usb,
	  resetn           => '1', -- R_btn_debounced(0), -- press BTN0 to test USB reconnect
          usb_dp           => usb_fpga_bd_dp,
          usb_dn           => usb_fpga_bd_dn,
          usb_dif          => usb_fpga_dp,
          txoe_o           => phy_txoe,
          ce_o             => phy_ce,
          utmi_txready_o   => utmi_txready,
          utmi_data_o      => utmi_data_miso,
          utmi_rxvalid_o   => utmi_rxvalid,
          utmi_rxactive_o  => utmi_rxactive,
          utmi_linestate_o => utmi_linestate,
          utmi_linectrl_i  => utmi_linectrl,
          utmi_data_i      => utmi_data_mosi,
          utmi_txvalid_i   => utmi_txvalid
	);
	R_utmi_linestate <= utmi_linestate;
--	R_utmi_linestate <= "10";
	end generate;

	G_view_utmi1: if C_view_utmi1 generate
	S_input_ena <= '1';
	trace_yellow(C_view_binary_gain+3) <= usb_fpga_bd_dp;
	trace_cyan(C_view_binary_gain+3) <= usb_fpga_bd_dn;
	trace_green(utmi_data_miso'range) <= utmi_data_miso;
	--trace_violet(utmi_data_mosi'range) <= utmi_data_mosi;
	trace_violet(C_view_binary_gain+3) <= utmi_rxactive;
	trace_white(C_view_binary_gain+3) <= utmi_rxvalid;
--	trace_orange(C_view_binary_gain+3) <= utmi_txvalid;
--	trace_orange(C_view_binary_gain+3) <= phy_txoe; -- same as rx_en
	trace_orange(C_view_binary_gain+3) <= phy_ce; -- differential dp
	G_low_utmi1: if C_mouse_usb_speed = '0' generate
	clk_input <= vga_clk;
	end generate;
	G_high_utmi1: if C_mouse_usb_speed = '1' generate
	clk_input <= clk_pixel_shift;
	end generate;
	end generate; -- view utmi

	E_usbmouse2daisy: entity hdl4fpga.scopeio_usbmouse2daisy
	generic map
	(
          C_usb_speed      => C_mouse_usb_speed,
          C_inputs         => inputs,
          C_tracesfg       => C_tracesfg,
          vlayout_id       => vlayout_id
	)
	port map
	(
          clk              => clk_mouse,
          clk_usb          => clk_usb,
          usb_reset        => '0', -- R_btn_debounced(6), -- '1' will force USB bus reset
          -- USB UTMI interface
          utmi_txready_i   => utmi_txready,
          utmi_data_i      => utmi_data_miso,
          utmi_rxvalid_i   => utmi_rxvalid,
          utmi_rxactive_i  => utmi_rxactive,
          utmi_linestate_i => utmi_linestate,
          utmi_linectrl_o  => utmi_linectrl,
          utmi_data_o      => utmi_data_mosi,
          utmi_txvalid_o   => utmi_txvalid,
          -- debug
          report_data      => S_hid_report,
          report_valid     => S_hid_valid,
          rx_count         => S_usb_rx_count,
          rx_done          => S_usb_rx_done,
          -- daisy input
          chaini_frm       => '0', -- fromistreamdaisy_frm,
          chaini_irdy      => '0', -- fromistreamdaisy_irdy,
          chaini_data      => x"00", -- fromistreamdaisy_data,
          -- daisy output
          chaino_frm       => usbmouse_frommousedaisy_frm,
          chaino_irdy      => usbmouse_frommousedaisy_irdy,
          chaino_data      => usbmouse_frommousedaisy_data
	);
	-- C_mouse_host, if enabled, will control GUI instead of C_mouse_usb
        G_not_mouse_host: if not C_mouse_host generate
          clk_istream  <= clk_mouse;
          istream_frm  <= usbmouse_frommousedaisy_frm;
          istream_irdy <= usbmouse_frommousedaisy_irdy;
          istream_data <= usbmouse_frommousedaisy_data;
        end generate; -- attach USB mouse if not host mouse
        G_yes_mouse_host: if C_mouse_host generate
--          clk_istream  <= clk_uart;
        end generate; -- attach USB mouse if not host mouse
        end block; -- USB mouse
	end generate; -- USB mouse

	G_wired_ethernet_rmii: if C_rmiiethernet generate
	-- /sbin/ifconfig enx00aabbccddee 192.168.18.254
	-- cat /etc/dnsmasq.d/interface.conf
	-- listen-address=192.168.18.254
	-- /usr/sbin/service dnsmasq restart
	-- /usr/sbin/tcpdump -i enx00aabbccddee -e -XX -n
	B_wired_ethernet_rmii: block
	signal mii_clk: std_logic;
	signal mii_txdata_reverse, mii_rxdata_reverse : std_logic_vector(0 to 7);
	-- RMII pins as labeled on the board and connected to ULX3S with flat cable
	alias rmii_tx1   : std_logic is gp(9);
	alias rmii_tx_en : std_logic is gp(10);
	alias rmii_rx0   : std_logic is gp(11);
	alias rmii_nint  : std_logic is gp(12);
	alias rmii_mdio  : std_logic is gp(13);
	alias rmii_tx0   : std_logic is gn(10);
	alias rmii_rx1   : std_logic is gn(11);
	alias rmii_crs   : std_logic is gn(12);
	alias rmii_mdc   : std_logic is gn(13);
	signal mii_rxdata,  mii_txdata  : std_logic_vector(0 to 1);
	signal mii_rxvalid, mii_txvalid : std_logic;
	begin

        mii_clk       <= rmii_nint; -- nINT pin is CLOCK
        mii_rxdata(0) <= rmii_rx0;
        mii_rxdata(1) <= rmii_rx1;
        mii_rxvalid   <= rmii_crs;
        rmii_tx0      <= mii_txdata(0);
        rmii_tx1      <= mii_txdata(1);
        rmii_tx_en    <= mii_txvalid;
        rmii_mdc      <= 'Z';
        rmii_mdio     <= 'Z';

	udpipdaisy_e : entity hdl4fpga.scopeio_miiudp
	generic map(
	        preamble_disable => false,
	        crc_disable => false
	)
	port map (
		mii_req   => R_btn_debounced(1),

		mii_rxc     => mii_clk,
		mii_rxdv    => mii_rxvalid,
		mii_rxd     => mii_rxdata,

		mii_txc     => mii_clk, 
		mii_txdv    => mii_txvalid,
		mii_txd     => mii_txdata,

		so_clk      => open,
		so_dv       => net_fromistreamdaisy_irdy,
		so_data     => net_fromistreamdaisy_data
        );
        net_fromistreamdaisy_frm <= net_fromistreamdaisy_irdy;
        clk_daisy                <= mii_clk;
        fromistreamdaisy_frm     <=         net_fromistreamdaisy_frm;
        fromistreamdaisy_irdy    <=         net_fromistreamdaisy_irdy;
        fromistreamdaisy_data    <= reverse(net_fromistreamdaisy_data);
        end block;
	end generate;

        G_no_mouse:
        if not (C_mouse_ps2 or C_mouse_usb or C_mouse_host) generate
          clk_istream  <= clk_daisy;
          istream_frm  <= fromistreamdaisy_frm;
          istream_irdy <= fromistreamdaisy_irdy;
          istream_data <= fromistreamdaisy_data;
        end generate; -- attach USB mouse if not host mouse

	G_mouse_host: if C_mouse_host generate
	-- linux HOST mouse
	-- input daisy is interpreted as mouse reports
	-- passed to GUI module "mouse2rgtr"
	-- which outputs modified rgtr commands for scopeio control
	E_hostmouse2daisy: entity hdl4fpga.scopeio_hostmouse2daisy
	generic map
	(
		C_inputs    => inputs,
		C_tracesfg  => C_tracesfg,
		vlayout_id  => vlayout_id
	)
	port map
	(
		clk         => clk_daisy,
		-- daisy input
		chaini_frm  => fromistreamdaisy_frm,
		chaini_irdy => fromistreamdaisy_irdy,
		chaini_data => fromistreamdaisy_data,
		-- daisy output
		chaino_frm  => istream_frm,
		chaino_irdy => istream_irdy,
		chaino_data => istream_data
	);
	clk_istream <= clk_daisy;
	end generate; -- host mouse

	scopeio_e : entity hdl4fpga.scopeio
	generic map (
	        inputs           => inputs, -- number of input channels
		vlayout_id       => vlayout_id,
		min_storage      => 4096, -- samples
		vt_steps         => (0 to inputs-1 => vt_step),
		hz_unit          => 32.0*micro, -- 1 us per pixel
		vt_unit          => 50.0*milli,
                default_tracesfg => C_tracesfg,
                default_gridfg   => b"1_110000",
                default_gridbg   => b"1_000000",
                default_hzfg     => b"1_111111",
                default_hzbg     => b"1_000000",
                default_vtfg     => C_tracesfg(0 to vga_rgb'length) and b"0_111111",
                default_vtbg     => b"1_000000",
                default_textbg   => b"1_000000",
                default_textfg   => b"1_111111",
                default_sgmntbg  => b"1_110000",
                default_bg       => b"1_000000"
	)
	port map (

		si_clk      => clk_istream,
		si_frm      => istream_frm,
		si_irdy     => istream_irdy,
		si_data     => istream_data,
		so_data     => so_null,
	        --o_rgtr_id   => S_rgtr_id,
	        --o_rgtr_dv   => S_rgtr_dv,
	        --o_rgtr_data => S_rgtr_data,
		input_clk   => clk_input,
		input_ena   => '1', --S_input_ena,
		input_data  => samples,
		video_clk   => vga_clk,
		video_pixel => vga_rgb,
		video_hsync => vga_hsync,
		video_vsync => vga_vsync,
		video_blank => vga_blank
	);

    -- test picture video generrator for debug purposes
    vga: entity work.vga
    generic map
    (
      -- 800x600 40 MHz pixel clock, works
--      C_resolution_x => 800,
--      C_hsync_front_porch => 40,
--      C_hsync_pulse => 128,
--      C_hsync_back_porch => 88,
--      C_resolution_y => 600,
--      C_vsync_front_porch => 1,
--      C_vsync_pulse => 4,
--      C_vsync_back_porch => 23,
--      C_bits_x => 12,
--      C_bits_y => 11    

--      -- 1024x768 65 MHz pixel clock, works
--      C_resolution_x => 1024,
--      C_hsync_front_porch => 16,
--      C_hsync_pulse => 96,
--      C_hsync_back_porch => 44,
--      C_resolution_y => 768,
--      C_vsync_front_porch => 10,
--      C_vsync_pulse => 2,
--      C_vsync_back_porch => 31,
--      C_bits_x => 11,
--      C_bits_y => 11    

--      -- 1920x1080 75 MHz pixel clock, doesn't work on lenovo, works on Samsung TV
      --C_resolution_x => 1920,
      --C_hsync_front_porch => 88,
      --C_hsync_pulse => 44,
      --C_hsync_back_porch => 133,
      --C_resolution_y => 1080,
      --C_vsync_front_porch => 4,
      --C_vsync_pulse => 5,
      --C_vsync_back_porch => 46,
      --C_bits_x => 12,
      --C_bits_y => 11,

      -- OLED 96x64
      C_resolution_x => 96,
      C_hsync_front_porch => 1,
      C_hsync_pulse => 1,
      C_hsync_back_porch => 1,
      C_resolution_y => 64,
      C_vsync_front_porch => 1,
      C_vsync_pulse => 1,
      C_vsync_back_porch => 1,
      C_bits_x => 12,
      C_bits_y => 11    
    )
    port map
    (
      clk_pixel => vga_clk,
      test_picture => '1',
      red_byte => (others => '0'),
      green_byte => (others => '0'),
      blue_byte => (others => '0'),
      vga_r(7 downto 6) => vga_rgb_test(0 to 1),
      vga_g(7 downto 6) => vga_rgb_test(2 to 3),
      vga_b(7 downto 6) => vga_rgb_test(4 to 5),
      vga_hsync => vga_hsync_test,
      vga_vsync => vga_vsync_test,
      vga_blank => vga_blank_test
    );    

    vga_display_enable <= not vga_blank;

    G_dvi_vga: if not C_oled_vga generate
--    vga2dvid: entity hdl4fpga.vga2dvid
--    generic map
--    (
--        C_shift_clock_synchronizer => '0',
--        C_ddr => '1',
--        C_depth => 2
--    )
--    port map
--   (
--        clk_pixel => vga_clk,
--        clk_shift => clk_pixel_shift,
--        in_red => vga_rgb(0 to 1),
--        in_green => vga_rgb(2 to 3),
--        in_blue => vga_rgb(4 to 5),
--        in_hsync => vga_hsync,
--        in_vsync => vga_vsync,
--        in_blank => vga_blank,
--        out_clock => dvid_crgb(7 downto 6),
--        out_red => dvid_crgb(5 downto 4),
--        out_green => dvid_crgb(3 downto 2),
--        out_blue => dvid_crgb(1 downto 0)
--    );

      G_LVDS_wrapper: entity hdl4fpga.LVDS_wrapper
        port map (
      clk_in => clk_pixel_shift,

      red(7 downto 6)   => vga_rgb(0 to 1),
      green(7 downto 6) => vga_rgb(2 to 3),
      blue(7 downto 6)  => vga_rgb(4 to 5),

      dataenable => vga_display_enable,
      hsync => vga_hsync,
      vsync => vga_vsync,

      -- single-ended output ready for differential buffers
      CK1in_p(1 downto 0) => dvid_crgb(7 downto 6),
      Rxin2_p(1 downto 0) => dvid_crgb(5 downto 4),
      Rxin1_p(1 downto 0) => dvid_crgb(3 downto 2),
      Rxin0_p(1 downto 0) => dvid_crgb(1 downto 0)
    );

    G_ddr_diff: for i in 0 to 3 generate
       --gpdi_ddr: ODDRX1F port map(D0=>dvid_crgb(2*i), D1=>dvid_crgb(2*i+1), Q=>ddr_d(i), SCLK=>clk_pixel_shift, RST=>'0');
       --gpdi_diff: OLVDS port map(A => ddr_d(i), Z => gp(i+3), ZN => gn(i+3));
      gp(i+3) <= dvid_crgb(2*i);
      gn(i+3) <= not dvid_crgb(2*i);
    end generate;
    end generate; -- dvi vga (not oled vga)

    G_oled_vga: if C_oled_vga generate
    B_oled_vga: block
      signal S_vga_oled_pixel: std_logic_vector(7 downto 0);
    begin
      S_vga_oled_pixel(7 downto 6) <= vga_rgb(0 to 1);
      S_vga_oled_pixel(4 downto 3) <= vga_rgb(2 to 3);
      S_vga_oled_pixel(1 downto 0) <= vga_rgb(4 to 5);

      oled_vga_inst: entity oled_vga
      generic map
      (
        C_bits => S_vga_oled_pixel'length
      )
      port map
      (
        clk => clk_oled,
        clken => clk_ena_oled,
        clk_pixel_ena => '1',
        hsync => vga_hsync,
        vsync => vga_vsync,
        blank => vga_blank,
        pixel => S_vga_oled_pixel,
        spi_resn => oled_resn,
        spi_clk => oled_clk,
        spi_csn => oled_csn,
        spi_dc => oled_dc,
        spi_mosi => oled_mosi
      );
    end block;

    -- only needed for compile to pass with the same constraints
    -- otherwise this module has no function with oled_vga
    G_x_ddr_diff: for i in 0 to 3 generate
      --x_gpdi_ddr: ODDRX1F port map(D0=>dvid_crgb(2*i), D1=>dvid_crgb(2*i+1), Q=>ddr_d(i), SCLK=>clk_pixel_shift, RST=>'0');
      --x_gpdi_diff: OLVDS port map(A => ddr_d(i), Z => gp(i+3), ZN => gn(i+3));
      gp(i+3) <= dvid_crgb(2*i);
      gn(i+3) <= not dvid_crgb(2*i);
    end generate;
    end generate; -- yes oled_vga

end;
