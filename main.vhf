--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : main.vhf
-- /___/   /\     Timestamp : 03/24/2016 12:55:16
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl E:/labs/lab2_ispr/main.vhf -w E:/labs/lab2_ispr/main.sch
--Design Name: main
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity main is
   port ( A            : in    std_logic_vector (3 downto 0); 
          B            : in    std_logic_vector (3 downto 0); 
          CLK          : in    std_logic; 
          digit        : out   std_logic_vector (3 downto 0); 
          digit_clk    : out   std_logic; 
          digit_led    : out   std_logic_vector (5 downto 0); 
          led_en       : out   std_logic_vector (3 downto 0); 
          number_clk   : out   std_logic; 
          select_clk   : out   std_logic; 
          to_led       : out   std_logic_vector (7 downto 0); 
          trans_number : out   std_logic_vector (15 downto 0));
end main;

architecture BEHAVIORAL of main is
   signal XLXN_8           : std_logic;
   signal XLXN_15          : std_logic_vector (3 downto 0);
   signal XLXN_16          : std_logic_vector (3 downto 0);
   signal XLXN_17          : std_logic_vector (3 downto 0);
   signal digit_clk_DUMMY  : std_logic;
   signal select_clk_DUMMY : std_logic;
   signal number_clk_DUMMY : std_logic;
   component freq_div
      port ( CLK    : in    std_logic; 
             freq_1 : out   std_logic; 
             freq_2 : out   std_logic; 
             freq_3 : out   std_logic);
   end component;
   
   component output_unit
      port ( number_clk   : in    std_logic; 
             digit_clk    : in    std_logic; 
             error        : in    std_logic; 
             A            : in    std_logic_vector (3 downto 0); 
             B            : in    std_logic_vector (3 downto 0); 
             C            : in    std_logic_vector (3 downto 0); 
             digit        : out   std_logic_vector (3 downto 0); 
             led_en       : out   std_logic_vector (3 downto 0); 
             to_led       : out   std_logic_vector (7 downto 0); 
             digit_led    : out   std_logic_vector (5 downto 0); 
             trans_number : out   std_logic_vector (15 downto 0));
   end component;
   
   component div
      port ( CLK   : in    std_logic; 
             A     : in    std_logic_vector (3 downto 0); 
             B     : in    std_logic_vector (3 downto 0); 
             error : out   std_logic; 
             A_out : out   std_logic_vector (3 downto 0); 
             B_out : out   std_logic_vector (3 downto 0); 
             C     : out   std_logic_vector (3 downto 0));
   end component;
   
begin
   digit_clk <= digit_clk_DUMMY;
   number_clk <= number_clk_DUMMY;
   select_clk <= select_clk_DUMMY;
   XLXI_1 : freq_div
      port map (CLK=>CLK,
                freq_1=>number_clk_DUMMY,
                freq_2=>digit_clk_DUMMY,
                freq_3=>select_clk_DUMMY);
   
   XLXI_3 : output_unit
      port map (A(3 downto 0)=>XLXN_15(3 downto 0),
                B(3 downto 0)=>XLXN_16(3 downto 0),
                C(3 downto 0)=>XLXN_17(3 downto 0),
                digit_clk=>digit_clk_DUMMY,
                error=>XLXN_8,
                number_clk=>number_clk_DUMMY,
                digit(3 downto 0)=>digit(3 downto 0),
                digit_led(5 downto 0)=>digit_led(5 downto 0),
                led_en(3 downto 0)=>led_en(3 downto 0),
                to_led(7 downto 0)=>to_led(7 downto 0),
                trans_number(15 downto 0)=>trans_number(15 downto 0));
   
   XLXI_4 : div
      port map (A(3 downto 0)=>A(3 downto 0),
                B(3 downto 0)=>B(3 downto 0),
                CLK=>select_clk_DUMMY,
                A_out(3 downto 0)=>XLXN_15(3 downto 0),
                B_out(3 downto 0)=>XLXN_16(3 downto 0),
                C(3 downto 0)=>XLXN_17(3 downto 0),
                error=>XLXN_8);
   
end BEHAVIORAL;


