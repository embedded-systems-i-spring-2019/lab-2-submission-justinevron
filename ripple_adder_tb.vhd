----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 04:47:50 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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

entity ripple_adder_tb is
--  Port ( );
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is
component ripple_adder is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       C_IN : in STD_LOGIC;
       C_OUT : out STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal A_TB, B_TB, S: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
signal C_IN, C_OUT : STD_LOGIC := '0';
begin
ADDER:RIPPLE_ADDER
PORT MAP(A => A_TB,
         B => B_TB,
         C_IN => C_IN,
         C_OUT => C_OUT,
         S => S);
    process
    begin
    wait for 5 ns;
    A_TB <= STD_LOGIC_VECTOR(UNSIGNED(A_TB) + 1);
    wait for 5 ns;
    B_TB <= STD_LOGIC_VECTOR(UNSIGNED(B_TB) + 1);
    wait for 5 ns;
    C_in <= not(C_IN);
    end process;
end Behavioral;
