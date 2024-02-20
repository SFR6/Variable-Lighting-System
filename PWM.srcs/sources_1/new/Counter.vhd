----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2022 03:33:19 PM
-- Design Name: 
-- Module Name: Down_Counter - Behavioral
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

entity Counter is
  port (max_time: in integer;
        CLK : in std_logic;
        Value: out integer);
end Counter;

architecture Behavioral of Counter is

signal int_value: integer := 0;
signal curr_time: integer := 0;
signal direction: std_logic := '0'; -- this signal gives the direction of the duty_cycle:
                                     -- '0' = up 
                                     -- '1' = down
begin

process (CLK)
begin
    if (CLK = '1' and CLK'EVENT) then
        curr_time <= curr_time + 1;
        if (curr_time >= max_time) then
            curr_time <= 0;
            if (direction = '0') then
                int_value <= int_value + 1;
                if (int_value >= 255) then
                    direction <= '1';
                end if;
            else 
                int_value <= int_value - 1;
                if (int_value <= 0) then
                    direction <= '0';
                end if;
            end if; 
        end if;
        if (max_time = integer'high) then
            Value <= 255;
        else
            Value <= int_value;
        end if;
    end if;
end process;

end Behavioral;
