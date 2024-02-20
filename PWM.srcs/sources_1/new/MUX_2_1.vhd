----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2022 01:15:30 PM
-- Design Name: 
-- Module Name: MUX_4_1 - Behavioral
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

entity MUX_2_1 is
    port (I0,I1 : in integer;
          SEL : in std_logic;
          O : out integer);
end MUX_2_1;

architecture Behavioral of MUX_2_1 is

begin
process (I0,I1,SEL)
variable iO: integer;
    begin
    case SEL is
        when '1' => iO := I1;
        when others => iO := I0; --includes the case '0'
    end case;
O <= iO;
end process;

end Behavioral;
