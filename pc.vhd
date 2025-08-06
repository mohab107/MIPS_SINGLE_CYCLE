----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2025 12:06:27 PM
-- Design Name: 
-- Module Name: pc - Behavioral
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

entity pc is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           pc_next_inst : in STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out STD_LOGIC_VECTOR (31 downto 0));
end pc;

architecture Behavioral of pc is

begin
process(clk ,reset) begin
    if(rising_edge(clk) or falling_edge(reset)) then
        if(reset='0') then
            pc_out <= (others=>'0');
        else
            pc_out <= pc_next_inst;
        end if;
    end if;
end process;

end Behavioral;
