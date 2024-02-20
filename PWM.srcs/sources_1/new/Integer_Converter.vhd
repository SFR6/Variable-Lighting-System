----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2022 03:33:19 PM
-- Design Name: 
-- Module Name: Integer_Converter - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Integer_Converter is
 port (LED_SW : in std_logic_vector(7 downto 0);
       Width_Value : out integer);
end Integer_Converter;

architecture Behavioral of Integer_Converter is

begin

process (LED_SW)
begin
    Width_Value <= to_integer(unsigned(LED_SW));
end process;

end Behavioral;
