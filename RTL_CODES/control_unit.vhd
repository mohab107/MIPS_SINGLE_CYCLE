----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2025 01:44:33 PM
-- Design Name: 
-- Module Name: control_unit - Behavioral
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

entity control_unit is
    Port ( op_code : in STD_LOGIC_VECTOR (5 downto 0);
           funct : in STD_LOGIC_VECTOR (5 downto 0);
           reg_write : out STD_LOGIC;
           reg_dst : out STD_LOGIC;
           alu_src : out STD_LOGIC;
           branch : out STD_LOGIC;
           mem_write : out STD_LOGIC;
           mem_reg : out STD_LOGIC;
           alu_control : out STD_LOGIC_VECTOR (2 downto 0);
           jump : out STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is
signal alu_op : std_logic_vector ( 1 downto 0);
begin
process (op_code,funct) begin
    case(op_code) is
        when "000000" => alu_op <= "10";
                         reg_write <= '1';
                         reg_dst <= '1';
                         alu_src <= '0';
                         branch <= '0';
                         mem_write <= '0';
                         mem_reg <= '0';
                         jump <= '0';
                         
        when "100011" => alu_op <= "00";
                         reg_write <= '1';
                         reg_dst <= '0';
                         alu_src <= '1';
                         branch <= '0';
                         mem_write <= '0';
                         mem_reg <= '1';
                         jump <= '0';
    
        when "101011" => alu_op <= "00";
                         reg_write <= '0';
                         reg_dst <= '0';
                         alu_src <= '1';
                         branch <= '0';
                         mem_write <= '1';
                         mem_reg <= '0';
                         jump <= '0';
    
        when "000100" => alu_op <= "01";
                         reg_write <= '0';
                         reg_dst <= '0';
                         alu_src <= '0';
                         branch <= '1';
                         mem_write <= '0';
                         mem_reg <= '0';
                         jump <= '0';
    
        when "001000" => alu_op <= "00";
                         reg_write <= '1';
                         reg_dst <= '0';
                         alu_src <= '1';
                         branch <= '0';
                         mem_write <= '0';
                         mem_reg <= '0';
                         jump <= '0';
    
        when "000010" => alu_op <= "00";
                         reg_write <= '0';
                         reg_dst <= '0';
                         alu_src <= '0';
                         branch <= '0';
                         mem_write <= '0';
                         mem_reg <= '0';
                         jump <= '1';
    
        when others => alu_op <= "00";
                        reg_write <= '0';
                        reg_dst <= '0';
                        alu_src <= '0';
                        branch <= '0';
                        mem_write <= '0';
                        mem_reg <= '0';
                        jump <= '0';
end case;
end process;
process (alu_op , funct) begin
    if (alu_op="00") then
        alu_control <= "010";
    elsif (alu_op(0) ='1') then
        alu_control <= "110";
    elsif (alu_op(1) ='1') then
        case(funct) is
            when "100000" =>  alu_control <= "010";
            when "100010" =>  alu_control <= "110";
            when "100100" =>  alu_control <= "000";
            when "100101" =>  alu_control <= "001";
            when "101010" =>  alu_control <= "111";
            when others => alu_control <= "010";
        end case;
    else 
        alu_control <= "010";
    end if;
end process;
end Behavioral;
