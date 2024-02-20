----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2022 04:01:36 PM
-- Design Name: 
-- Module Name: Test_Counter - Behavioral
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

entity Test_Counter is
  Port (CLK: in std_logic;
        max_value: in integer;
        test_duty_cycle: out integer := 0);
end Test_Counter;

architecture Behavioral of Test_Counter is

signal test_count: integer := 0;
signal duty_cycle: integer :=0;

begin

Test_Mode_Counter: process (CLK)
begin
    if (CLK = '1' and CLK'EVENT) then
        test_count <= test_count + 1;
        if (test_count = max_value) then
            test_count <= 0;
            duty_cycle <= duty_cycle + 1;
            if (duty_cycle = 255) then
                duty_cycle <= 0;
            end if;
        end if;
    end if;
    test_duty_cycle <= duty_cycle;
end process;

end Behavioral;
