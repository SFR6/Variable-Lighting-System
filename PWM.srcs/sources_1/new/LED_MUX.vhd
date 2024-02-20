----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2022 04:18:57 PM
-- Design Name: 
-- Module Name: LED_MUX - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_MUX is
  Port (test_duty_cycle,count: in integer;
        LED_on: out std_logic);
end LED_MUX;

architecture Behavioral of LED_MUX is

begin

PWM_Test_Mode_Generator: process (test_duty_cycle,count)
begin
    if (test_duty_cycle = 0) then
        LED_On <= '0';
    elsif (count < test_duty_cycle) then
        LED_On <= '1';
    else
        LED_on <= '0';
    end if;
end process;

end Behavioral;
