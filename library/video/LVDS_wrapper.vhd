--
-- AUTHOR=Goran
-- LICENSE=BSD
--

-- VHDL Wrapper for Verilog

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity LVDS_wrapper is 
   port(
      clk_in : in std_logic;
      red,green,blue : in std_logic_vector(7 downto 0);
      hsync, vsync, dataenable : in std_logic;
     -- vcurrent,hcurrent : out  std_logic_vector(10 downto 0); -- Max 1024 x 1024
      CK1in_p,Rxin0_p,Rxin1_p,Rxin2_p : out std_logic_vector(1 downto 0)
   );
end LVDS_wrapper;

architecture Behavioral of LVDS_wrapper is 

component LVDS_Output is 
   port(
      clk_in : in std_logic;
      red,green,blue : in std_logic_vector(7 downto 0);
      hsync, vsync, dataenable : in std_logic;
     -- vcurrent,hcurrent : out  std_logic_vector(10 downto 0); -- Max 1024 x 1024
      CK1in_p,Rxin0_p,Rxin1_p,Rxin2_p : out std_logic_vector(1 downto 0)
   );
end component;

begin  

  LVDS_Output_inst: LVDS_Output
  port map
  (
    clk_in => clk_in,
  --  hcurrent => hcurrent,
  --  vcurrent => vcurrent,
    hsync => hsync, 
    vsync => vsync, 
    dataenable => dataenable,
    red (7 downto 0) => red (7 downto 0),
    green(7 downto 0) => green (7 downto 0),
    blue(7 downto 0) => blue (7 downto 0),
    CK1in_p => CK1in_p,
    Rxin0_p => Rxin0_p,
    Rxin1_p => Rxin1_p, 
    Rxin2_p => Rxin2_p
  );

end Behavioral;