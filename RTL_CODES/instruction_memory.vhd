----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2025 12:23:20 PM
-- Design Name: 
-- Module Name: instruction_memory - Behavioral
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

entity instruction_memory is
    Port ( pc_out : in STD_LOGIC_VECTOR (31 downto 0);
           instr_out : out STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is
type inst_memory is array (0 to 258) of std_logic_vector (7 downto 0);
signal instructions : inst_memory := (0  => x"05",
                                        1  => x"00",
                                        2  => x"08",
                                        3  => x"20",
                                        
                                        4  => x"0A",
                                        5  => x"00",
                                        6  => x"09",
                                        7  => x"20",
                                        
                                        8  => x"20",
                                        9  => x"50",
                                        10 => x"09",
                                        11 => x"01",
                                        
                                        12 => x"22",
                                        13 => x"58",
                                        14 => x"28",
                                        15 => x"01",
                                        
                                        16 => x"25",
                                        17 => x"60",
                                        18 => x"09",
                                        19 => x"01",
                                        
                                        20 => x"24",
                                        21 => x"68",
                                        22 => x"09",
                                        23 => x"01",
                                        
                                        24 => x"2A",
                                        25 => x"70",
                                        26 => x"09",
                                        27 => x"01",
                                        
                                        28 => x"00",
                                        29 => x"00",
                                        30 => x"0A",
                                        31 => x"AC",
                                        
                                        32 => x"00",
                                        33 => x"00",
                                        34 => x"0F",
                                        35 => x"8C",
                                        
                                        36 => x"01",
                                        37 => x"00",
                                        38 => x"EA",
                                        39 => x"11",
                                        
                                        40 => x"E7",
                                        41 => x"03",
                                        42 => x"10",
                                        43 => x"20",
                                        
                                        44 => x"0D",
                                        45 => x"00",
                                        46 => x"00",
                                        47 => x"08",
                                        
                                        48 => x"78",
                                        49 => x"03",
                                        50 => x"11",
                                        51 => x"20",
                                        
                                        52 => x"09",
                                        53 => x"03",
                                        54 => x"12",
                                        55 => x"20",
                                    others=>(others=>'0') );
begin
instr_out ( 7 downto 0) <= instructions(to_integer(unsigned(pc_out)));
instr_out ( 15 downto 8) <= instructions(to_integer(unsigned(pc_out)+1));
instr_out ( 23 downto 16) <= instructions(to_integer(unsigned(pc_out)+2));
instr_out ( 31 downto 24) <= instructions(to_integer(unsigned(pc_out)+3));

end Behavioral;
