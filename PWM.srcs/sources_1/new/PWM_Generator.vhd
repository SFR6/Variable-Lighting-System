----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2022 01:08:32 PM
-- Design Name: 
-- Module Name: PWM_Generator - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_Generator is
  generic (max_val: in integer := 255);
  port (Enable,Test_mode,PWM_CLK : in std_logic;
        Duty_cycle: in integer;
        LED : out std_logic_vector (15 downto 0));
end PWM_Generator;

architecture Behavioral of PWM_Generator is

component Test_Counter is
  Port (CLK: in std_logic;
        max_value: in integer;
        test_duty_cycle: out integer := 0);
end component;

component LED_MUX is
  Port (test_duty_cycle,count: in integer;
        LED_on: out std_logic);
end component;

signal count: integer := 0;

signal test_duty_cycle1: integer;
signal test_duty_cycle2: integer;
signal test_duty_cycle3: integer;
signal test_duty_cycle4: integer;
signal test_duty_cycle5: integer;
signal test_duty_cycle6: integer;
signal test_duty_cycle7: integer;
signal test_duty_cycle8: integer;
signal test_duty_cycle9: integer;
signal test_duty_cycle10: integer;
signal test_duty_cycle11: integer;
signal test_duty_cycle12: integer;
signal test_duty_cycle13: integer;
signal test_duty_cycle14: integer;
signal test_duty_cycle15: integer;
signal test_duty_cycle16: integer;

signal LED_On1: std_logic;
signal LED_On2: std_logic;
signal LED_On3: std_logic;
signal LED_On4: std_logic;
signal LED_On5: std_logic;
signal LED_On6: std_logic;
signal LED_On7: std_logic;
signal LED_On8: std_logic;
signal LED_On9: std_logic;
signal LED_On10: std_logic;
signal LED_On11: std_logic;
signal LED_On12: std_logic;
signal LED_On13: std_logic;
signal LED_On14: std_logic;
signal LED_On15: std_logic;
signal LED_On16: std_logic;

begin

label1_1: Test_Counter port map(PWM_CLK,392_156,test_duty_cycle1);
label1_2: Test_Counter port map(PWM_CLK,784_313,test_duty_cycle2);
label1_3: Test_Counter port map(PWM_CLK,1_176_470,test_duty_cycle3);
label1_4: Test_Counter port map(PWM_CLK,1_568_627,test_duty_cycle4);
label1_5: Test_Counter port map(PWM_CLK,1_960_784,test_duty_cycle5);
label1_6: Test_Counter port map(PWM_CLK,2_352_941,test_duty_cycle6);
label1_7: Test_Counter port map(PWM_CLK,2_745_098,test_duty_cycle7);
label1_8: Test_Counter port map(PWM_CLK,3_137_254,test_duty_cycle8);
label1_9: Test_Counter port map(PWM_CLK,3_529_411,test_duty_cycle9);
label1_10: Test_Counter port map(PWM_CLK,3_921_568,test_duty_cycle10);
label1_11: Test_Counter port map(PWM_CLK,4_313_725,test_duty_cycle11);
label1_12: Test_Counter port map(PWM_CLK,4_705_882,test_duty_cycle12);
label1_13: Test_Counter port map(PWM_CLK,5_098_039,test_duty_cycle13);
label1_14: Test_Counter port map(PWM_CLK,5_490_196,test_duty_cycle14);
label1_15: Test_Counter port map(PWM_CLK,5_882_352,test_duty_cycle15);
label1_16: Test_Counter port map(PWM_CLK,6_274_509,test_duty_cycle16);

MAIN_Counter: process (PWM_CLK)
begin
    if (PWM_CLK = '1' and PWM_CLK'EVENT) then
        count <= count + 1;
        if (count = max_val) then
            count <= 0;
        end if;
    end if;
end process;

label2_1: LED_MUX port map(test_duty_cycle1,count,LED_On1);
label2_2: LED_MUX port map(test_duty_cycle2,count,LED_On2);
label2_3: LED_MUX port map(test_duty_cycle3,count,LED_On3);
label2_4: LED_MUX port map(test_duty_cycle4,count,LED_On4);
label2_5: LED_MUX port map(test_duty_cycle5,count,LED_On5);
label2_6: LED_MUX port map(test_duty_cycle6,count,LED_On6);
label2_7: LED_MUX port map(test_duty_cycle7,count,LED_On7);
label2_8: LED_MUX port map(test_duty_cycle8,count,LED_On8);
label2_9: LED_MUX port map(test_duty_cycle9,count,LED_On9);
label2_10: LED_MUX port map(test_duty_cycle10,count,LED_On10);
label2_11: LED_MUX port map(test_duty_cycle11,count,LED_On11);
label2_12: LED_MUX port map(test_duty_cycle12,count,LED_On12);
label2_13: LED_MUX port map(test_duty_cycle13,count,LED_On13);
label2_14: LED_MUX port map(test_duty_cycle14,count,LED_On14);
label2_15: LED_MUX port map(test_duty_cycle15,count,LED_On15);
label2_16: LED_MUX port map(test_duty_cycle16,count,LED_On16);

LED_Controller: process (Enable,Test_mode,Duty_cycle)
begin
    if (Enable = '1') then
        if (Test_mode = '1') then
            LED <= (LED_On1, LED_On2, LED_On3, LED_On4, LED_On5, LED_On6, LED_On7, LED_On8, LED_On9, LED_On10, LED_On11, LED_On12, LED_On13, LED_On14, LED_On15, LED_On16);
        else
            if (Duty_cycle = 0) then
                LED <= (others => '0');
            elsif (count < Duty_cycle) then
                LED <= (others => '1');
            else
                LED <= (others => '0');
            end if;
        end if;
    else
        LED <= (others => '0');
    end if;
end process;

end Behavioral;
