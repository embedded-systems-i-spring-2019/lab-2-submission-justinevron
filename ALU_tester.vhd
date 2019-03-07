----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 05:45:41 PM
-- Design Name: 
-- Module Name: ALU_tester - Behavioral
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

entity ALU_tester is
    Port ( LED : out STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (3 downto 0));
end ALU_tester;

architecture Behavioral of ALU_tester is
    component my_alu is
        Port ( OP : in STD_LOGIC_VECTOR (3 downto 0);
               A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               S : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    component debounce is
        Port ( clk : in STD_LOGIC;
               btn : in STD_LOGIC;
               debounced : out STD_LOGIC);
    end component;
    signal AREG, BREG, OPREG : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal btn0, btn1, btn2, btn3: STD_LOGIC;
begin
    DBNnc0: DEBOUNCE
    port map( clk => clk,
              btn => btn(0),
              debounced => btn0);
    DBNC1: DEBOUNCE
    port map( clk => clk,
              btn => btn(1),
              debounced => btn1);
    DBNC2: DEBOUNCE
    port map( clk => clk,
              btn => btn(2),
              debounced => btn2);
    DBNC3: DEBOUNCE
    port map( clk => clk,
              btn => btn(3),
              debounced => btn3);                                          
    ALU: my_alu
    port map(S => LED,
             A => AREG,
             B => BREG,
             OP =>OPREG); 
        process(clk)
        begin
            if rising_edge(clk) then
                if btn0 = '1' then
                    BREG <= SW;
                end if;
                if btn1 = '1' then
                    AREG <= SW;
                end if;
                if btn2 = '1' then
                    OPREG <= SW;
                end if;
                if btn3 = '1' then
                    AREG <= x"0";
                    BREG <= x"0";
                    OPREG <= x"0";
                end if;
            end if;
        end process;
end Behavioral;
