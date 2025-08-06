----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2025 01:14:54 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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

entity alu is
    Port ( operand_a : in STD_LOGIC_VECTOR (31 downto 0);
           operand_b : in STD_LOGIC_VECTOR (31 downto 0);
           alu_control : in STD_LOGIC_VECTOR (2 downto 0);
           zero_flag : out STD_LOGIC;
           alu_result : out STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is
signal alu_result_temp : std_logic_vector(31 downto 0);
begin
process(operand_a,operand_b,alu_control) begin
    case(alu_control) is
        when "000" => alu_result_temp <= operand_a and operand_b;
        when "001" => alu_result_temp <= operand_a or operand_b;
        when "010" => alu_result_temp <= std_logic_vector(signed(operand_a) + signed(operand_b));
        when "110" => alu_result_temp <= std_logic_vector(signed(operand_a) - signed(operand_b));
        when "111" => if(signed(operand_a) < signed(operand_b)) then
                            alu_result_temp <= (31 downto 1 =>'0') & '1';
                      else
                            alu_result_temp <= (others => '0');
                      end if;
        when others => alu_result_temp <= (others =>'0');
    end case;
end process;
zero_flag <= '1' when unsigned(alu_result_temp)=0 else '0';
alu_result <= alu_result_temp;

end Behavioral;
