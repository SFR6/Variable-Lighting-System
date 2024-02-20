----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2022 01:20:21 PM
-- Design Name: 
-- Module Name: DMUX_1_4 - Behavioral
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

entity DMUX_1_4 is
  port (SEL: in std_logic_vector(1 downto 0);
        O : out std_logic_vector(3 downto 0));
end DMUX_1_4;

architecture Behavioral of DMUX_1_4 is

begin
process (SEL)
    variable iO : std_logic_vector(3 downto 0);
    begin
    case SEL is
        when "00" => iO := "0001"; --idle
        when "01" => iO := "0010"; --manual
        when "10" => iO := "0100"; --auto
        when "11" => iO := "1000"; --test
        when others => iO := "0000";
    end case;
    O(3 downto 1) <= iO(3 downto 1);
    O(0) <= not(iO(0));
end process;

end Behavioral;
