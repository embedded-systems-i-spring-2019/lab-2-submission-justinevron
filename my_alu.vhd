----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 05:11:11 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
    Port ( OP : in STD_LOGIC_VECTOR (3 downto 0);
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0));
end my_alu;

architecture Behavioral of my_alu is
begin
process
begin
case OP is
    when X"0" => S <= STD_LOGIC_VECTOR(UNSIGNED(A) + UNSIGNED(B));
    when X"1" => S <= STD_LOGIC_VECTOR(UNSIGNED(A) - UNSIGNED(B));
    when X"2" => S <= STD_LOGIC_VECTOR(UNSIGNED(A) + 1);
    when X"3" => S <= STD_LOGIC_VECTOR(UNSIGNED(A) - 1);
    when X"4" => S <= STD_LOGIC_VECTOR(0 - UNSIGNED(A));
    when X"5" => S <= x"1" when (UNSIGNED(A) > UNSIGNED(B)) else x"0";
    when X"6" => S <= STD_LOGIC_VECTOR(UNSIGNED(A) sll 1);
    when X"7" => S <= STD_LOGIC_VECTOR(UNSIGNED(A) srl 1);
    when X"8" => S <= STD_LOGIC_VECTOR(SHIFT_LEFT(UNSIGNED(A),1));
    when X"9" => s <= NOT(A);
    when X"A" => S <= A AND B;
    when X"B" => S <= A OR B;
    when X"C" => S <= A XOR B;
    when X"D" => S <= A XNOR B;
    when X"E" => S <= A NAND B;
    when X"F" => S <= A NOR B;
end case;
end process;

end Behavioral;
