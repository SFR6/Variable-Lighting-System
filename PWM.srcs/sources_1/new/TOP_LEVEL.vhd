----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2022 06:58:55 PM
-- Design Name: 
-- Module Name: TOP_LEVEL - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_LEVEL is
  port (SEL : in std_logic_vector(1 downto 0);
        CLK,CLR : in std_logic;
        LED_SW : in std_logic_vector(7 downto 0);
        time : in std_logic_vector(3 downto 0);
        LED : out std_logic_vector(15 downto 0);
        Seven_Segment_LED: out std_logic_vector(6 downto 0);
        Anode: out std_logic_vector(3 downto 0));
end TOP_LEVEL;

architecture Behavioral of TOP_LEVEL is

component DMUX_1_4 is
  port (SEL: in std_logic_vector(1 downto 0);
        O : out std_logic_vector(3 downto 0));
end component;

component Integer_Converter is
 port (LED_SW : in std_logic_vector(7 downto 0);
       Width_Value : out integer);
end component;

component Counter is
  port (max_time: in integer;
        CLK : in std_logic;
        Value: out integer);
end component;

component Time_Converter is
  port (time : in std_logic_vector(3 downto 0);
        Integer_time : out integer);
end component;

component MUX_2_1 is
    port (I0,I1 : in integer;
          SEL : in std_logic;
          O : out integer);
end component;

component PWM_Generator is
  generic (max_val: in integer := 255);
  port (Enable,Test_mode,PWM_CLK : in std_logic;
        Duty_cycle: in integer;
        LED : out std_logic_vector (15 downto 0));
end component;

component Seven_Segment_Generator is
  port (Enable,Clock,Clear: in std_logic;
        Mode: in integer;
        Duty_Cycle: in std_logic_vector(7 downto 0);
        time: in std_logic_vector(3 downto 0);
        Seven_Segment_LED: out std_logic_vector(6 downto 0);
        Anode: out std_logic_vector(3 downto 0));
end component;

signal O: std_logic_vector(3 downto 0);
signal Width_Value: integer;
signal Integer_time: integer;
signal Value: integer;
signal Duty_Cycle: integer;

begin

label1: DMUX_1_4 port map (SEL,O);
label2: Integer_Converter port map (LED_SW,Width_Value);
label3: Time_Converter port map (time,Integer_time);
label4: Counter port map (Integer_time,CLK,Value);
label5: MUX_2_1 port map (Value,Width_Value,O(1),Duty_Cycle);
label6: PWM_Generator port map (O(0),O(3),CLK,Duty_Cycle,LED);
label7: Seven_Segment_Generator port map (O(0),CLK,CLR,to_integer(unsigned(SEL)),LED_SW,time,Seven_Segment_LED,Anode);

end Behavioral;
