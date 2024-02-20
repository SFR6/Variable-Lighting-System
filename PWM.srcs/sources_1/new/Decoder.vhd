----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2022 03:33:19 PM
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Time_Converter is
  port (time : in std_logic_vector(3 downto 0);
        Integer_time : out integer);
end Time_Converter;

architecture Behavioral of Time_Converter is

begin
process (time)
variable iInteger_time : integer;
begin
    case time is
        when "0001" => iInteger_time := 196_078;
        when "0010" => iInteger_time := 392_156;
        when "0011" => iInteger_time := 588_235;
        when "0100" => iInteger_time := 784_313;
        when "0101" => iInteger_time := 980_392;
        when "0110" => iInteger_time := 1_176_470;
        when "0111" => iInteger_time := 1_372_549;
        when "1000" => iInteger_time := 1_568_627;
        when "1001" => iInteger_time := 1_764_705;
        when "1010" => iInteger_time := 1_960_784;
        when "1011" => iInteger_time := 2_156_862;
        when "1100" => iInteger_time := 2_352_941;
        when "1101" => iInteger_time := 2_549_019;
        when "1110" => iInteger_time := 2_745_098;
        when "1111" => iInteger_time := 2_941_176;
        when others => iInteger_time := integer'high; --includes the case "0000"
    end case;
    Integer_time <= iInteger_time;
end process;

end Behavioral;
