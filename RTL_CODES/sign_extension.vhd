----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2025 12:14:04 PM
-- Design Name: 
-- Module Name: sign_extension - Behavioral
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

entity sign_extension is
    Port ( instr_imm : in STD_LOGIC_VECTOR (15 downto 0);
           signed_imm : out STD_LOGIC_VECTOR (31 downto 0));
end sign_extension;

architecture Behavioral of sign_extension is

begin
signed_imm <= std_logic_vector(resize(signed(instr_imm),32));


end Behavioral;
