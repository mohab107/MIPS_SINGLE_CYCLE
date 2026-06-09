----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2025 12:41:40 PM
-- Design Name: 
-- Module Name: register_file - Behavioral
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

entity register_file is
    Port ( a1 : in STD_LOGIC_VECTOR (4 downto 0);
           a2 : in STD_LOGIC_VECTOR (4 downto 0);
           a3 : in STD_LOGIC_VECTOR (4 downto 0);
           wd3 : in STD_LOGIC_VECTOR (31 downto 0);
           wr_en : in STD_LOGIC;
           clk : in STD_LOGIC;
           rd1 : out STD_LOGIC_VECTOR (31 downto 0);
           rd2 : out STD_LOGIC_VECTOR (31 downto 0));
end register_file;

architecture Behavioral of register_file is
type reg_file is array (0 to 31) of std_logic_vector (31 downto 0);
signal reg_data : reg_file:= (0=> x"00000000", others => x"FFFFFFFF") ;
begin
process(clk) begin
    if(rising_edge(clk)) then
        if(wr_en ='1') then
            reg_data(to_integer(unsigned(a3))) <= wd3;
        end if;
    end if;
end process;
rd1 <= reg_data(to_integer(unsigned(a1))) when a1 /= "00000" else x"00000000";
rd2 <= reg_data(to_integer(unsigned(a2))) when a2 /= "00000" else x"00000000";
end Behavioral;
