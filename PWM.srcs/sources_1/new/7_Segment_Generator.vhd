----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2022 03:47:54 PM
-- Design Name: 
-- Module Name: 7_Segment_Generator - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Seven_Segment_Generator is
  port (Enable,Clock,Clear: in std_logic;
        Mode: in integer;
        Duty_Cycle: in std_logic_vector(7 downto 0);
        time: in std_logic_vector(3 downto 0);
        Seven_Segment_LED: out std_logic_vector(6 downto 0);
        Anode: out std_logic_vector(3 downto 0));
end Seven_Segment_Generator;

architecture Behavioral of Seven_Segment_Generator is

component Seven_Segment_Counter is
  Port (CLK: in std_logic;
        TC: out std_logic);
end component;

function to_bcd (bin: std_logic_vector(7 downto 0)) return std_logic_vector is
-- Double Dabble Algorithm (Shift Add Three Algorithm)

variable i: integer := 0;
variable bcd: std_logic_vector(11 downto 0) := (others => '0');
variable bint: std_logic_vector(7 downto 0) := bin;

begin
    for i in 0 to 7 loop  -- repeating 8 times.
        bcd(11 downto 1) := bcd(10 downto 0);  -- shifting the bits.
        bcd(0) := bint(7);
        bint(7 downto 1) := bint(6 downto 0);
        bint(0) := '0';
        if(i < 7 and bcd(3 downto 0) > "0100") then -- add 3 if BCD digit is greater than 4.
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if(i < 7 and bcd(7 downto 4) > "0100") then -- add 3 if BCD digit is greater than 4.
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if(i < 7 and bcd(11 downto 8) > "0100") then  -- add 3 if BCD digit is greater than 4.
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
    end loop;
return bcd;
end to_bcd;

signal extended_time: std_logic_vector(7 downto 0) := (7 => '0', 6 => '0', 5 => '0', 4 => '0', 3 => time(3), 2 => time(2), 1 => time(1), 0 => time(0));
signal Curr_time: std_logic_vector(18 downto 0) := (others => '0');
signal word: std_logic_vector(27 downto 0);
signal DC: std_logic_vector(27 downto 0);
signal anode_sel: std_logic_vector(1 downto 0);
signal number: std_logic_vector(11 downto 0);
signal word_number: std_logic_vector(27 downto 0) := (others => '1');
signal Info_Select: std_logic;

begin

Two_Second_Counter: Seven_Segment_Counter port map(Clock,Info_Select); 

anode_sel <= Curr_time (18 downto 17);

BCD_Converter_Double_Dabble: process (Mode,Duty_Cycle,extended_time)
begin
    case Mode is
        when 2 => number <= to_bcd(extended_time); -- automatic mode
        when others => number <= to_bcd(Duty_Cycle); -- includes case 1 (manual mode)
    end case;
end process;

Digit_To_Seven_Segment_Character: process (number)
begin
    case number(11 downto 8) is
        when "0001" => word_number(20 downto 14) <= "1001111"; -- 1
        when "0010" => word_number(20 downto 14) <= "0010010"; -- 2
        when "0011" => word_number(20 downto 14) <= "0000110"; -- 3
        when "0100" => word_number(20 downto 14) <= "1001100"; -- 4
        when "0101" => word_number(20 downto 14) <= "0100100"; -- 5
        when "0110" => word_number(20 downto 14) <= "0100000"; -- 6
        when "0111" => word_number(20 downto 14) <= "0001111"; -- 7
        when "1000" => word_number(20 downto 14) <= "0000000"; -- 8
        when "1001" => word_number(20 downto 14) <= "0000100"; -- 9
        when others => word_number(20 downto 14) <= "1111111";
    end case;
    case number(7 downto 4) is
        when "0001" => word_number(13 downto 7) <= "1001111"; -- 1
        when "0010" => word_number(13 downto 7) <= "0010010"; -- 2
        when "0011" => word_number(13 downto 7) <= "0000110"; -- 3
        when "0100" => word_number(13 downto 7) <= "1001100"; -- 4
        when "0101" => word_number(13 downto 7) <= "0100100"; -- 5
        when "0110" => word_number(13 downto 7) <= "0100000"; -- 6
        when "0111" => word_number(13 downto 7) <= "0001111"; -- 7
        when "1000" => word_number(13 downto 7) <= "0000000"; -- 8
        when "1001" => word_number(13 downto 7) <= "0000100"; -- 9
        when others => word_number(13 downto 7) <= "0000001"; -- contains 0
    end case;
    case number(3 downto 0) is
        when "0001" => word_number(6 downto 0) <= "1001111"; -- 1
        when "0010" => word_number(6 downto 0) <= "0010010"; -- 2
        when "0011" => word_number(6 downto 0) <= "0000110"; -- 3
        when "0100" => word_number(6 downto 0) <= "1001100"; -- 4
        when "0101" => word_number(6 downto 0) <= "0100100"; -- 5
        when "0110" => word_number(6 downto 0) <= "0100000"; -- 6
        when "0111" => word_number(6 downto 0) <= "0001111"; -- 7
        when "1000" => word_number(6 downto 0) <= "0000000"; -- 8
        when "1001" => word_number(6 downto 0) <= "0000100"; -- 9
        when others => word_number(6 downto 0) <= "0000001"; -- contains 0
    end case;
end process;

Internal_Clock: process (Clear,Clock)
begin
    if (Clear = '1') then
            Curr_time <= (others => '0');
    end if; 
    if (Clock = '1' and Clock'EVENT) then
        if (Curr_time = "1111111111111111111") then
            Curr_time <= (others => '0');
        else
            Curr_time <= Curr_time + 1;
        end if;
    end if;    
end process;

Word_Selection: process (Info_Select,Mode)
begin
    if (Info_Select = '0') then
        case Mode is 
            when 1 => word <= "0101010000100011010101000001"; -- mAnU
            when 2 => word <= "0001000100000111100001100010"; -- AUto
            when 3 => word <= "1110000011000001001001110000"; -- tESt
            when others => word <= (others => '1');
        end case;
    elsif (Info_Select = '1') then
        case Mode is
            when 1 => word <= word_number; -- duty cycle (for manual mode)
            when 2 => word <= word_number; -- period length (for automatic mode)
            when 3 => word <= "1110000011000001001001110000"; -- tESt
            when others => word <= (others => '1');
        end case;
    end if;
end process;

Character_Display: process (Enable,anode_sel,word)
begin
    if (Enable = '1') then
        case anode_sel is
            when "00" => Seven_Segment_LED <= word(6 downto 0);
            when "01" => Seven_Segment_LED <= word(13 downto 7);
            when "10" => Seven_Segment_LED <= word(20 downto 14);
            when "11" => Seven_Segment_LED <= word(27 downto 21);
            when others => Seven_Segment_LED <= (others => '1');
        end case;
    end if;
end process;

Anode_Selection: process (Enable,anode_sel,Clear)
begin
    if (Clear = '1' or Enable = '0') then
        Anode <= (others => '1');
    else
        case anode_sel is
            when "00" => Anode <= "1110";
            when "01" => Anode <= "1101";
            when "10" => Anode <= "1011";
            when "11" => Anode <= "0111";
            when others => Anode <= (others => '1');
        end case;
    end if;
end process;

end Behavioral;
