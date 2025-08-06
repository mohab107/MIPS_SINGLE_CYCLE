----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/24/2025 06:07:15 AM
-- Design Name: 
-- Module Name: mips_processor_tb - Behavioral
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

entity mips_processor_tb is
end mips_processor_tb;

architecture Behavioral of mips_processor_tb is
component mips_processor is
    Port (clk,reset : in std_logic;
            done : out std_logic);
end component;

signal clk,reset : std_logic:='0';
signal done : std_logic;
begin
uut : mips_processor port map ( clk,reset,done);
process begin
    wait for 10 ns;
    reset <= '1';
end process;
process begin
    wait for 5 ns;
    clk <= not clk;
end process;
end Behavioral;
