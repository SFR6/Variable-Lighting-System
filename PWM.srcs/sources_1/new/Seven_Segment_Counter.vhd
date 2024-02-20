----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2022 11:19:07 AM
-- Design Name: 
-- Module Name: Seven_Segment_Counter - Behavioral
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

entity Seven_Segment_Counter is
  Port (CLK: in std_logic;
        TC: out std_logic);
end Seven_Segment_Counter;

architecture Behavioral of Seven_Segment_Counter is

signal curr_time: integer := 0;
signal direction: std_logic := '0';

begin

Two_Second_Counter: process (CLK)
begin
    if (CLK = '1' and CLK'EVENT) then
        if (direction = '0') then
            curr_time <= curr_time + 1;
            if (curr_time = 199_999_815) then
                direction <= '1';
            end if;
        else
            curr_time <= curr_time - 1;
            if (curr_time = 0) then
                direction <= '0';
            end if;
        end if;
        TC <= direction;
    end if;
end process;

end Behavioral;
