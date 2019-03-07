----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 04:10:09 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

entity ripple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_IN : in STD_LOGIC;
           C_OUT : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end ripple_adder;

architecture Behavioral of ripple_adder is
    component adder is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C_IN : in STD_LOGIC;
               C_OUT : out STD_LOGIC;
               S : out STD_LOGIC);
    end component;
    signal C0, C1, C2 : STD_LOGIC;
begin
adder0: adder
port map(A => A(0),
         B => B(0),
         C_IN => C_IN,
         S => S(0),
         C_OUT => C0);
adder1: adder
port map(A => A(1),
         B => B(1),
         c_IN => C0,
         S => S(1),         
         C_OUT => C1);
adder2: adder
port map(A => A(2),
         B => B(2),
         C_IN => C1,
         S => S(2),
         C_OUT => C2);
adder3: adder
port map(A => A(3),
         B => B(3),
         C_IN => C2,
         S => S(3),
         C_OUT => C_OUT);
         

end Behavioral;
