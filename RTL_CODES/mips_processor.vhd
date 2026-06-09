----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/24/2025 04:26:25 AM
-- Design Name: 
-- Module Name: mips_processor - Behavioral
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

entity mips_processor is
    Port (clk,reset : in std_logic;
            done : out std_logic);
end mips_processor;

architecture Behavioral of mips_processor is
signal  signed_imm : std_logic_vector ( 31 downto 0);
signal  instruction :std_logic_vector ( 31 downto 0);
signal  pc_plus4, pc_branch, pc_next,pc_jump :std_logic_vector ( 31 downto 0);
signal  mem_rd_data :std_logic_vector ( 31 downto 0);
signal  rd2 :std_logic_vector ( 31 downto 0);
signal  src_a ,src_b ,alu_result :std_logic_vector ( 31 downto 0);
signal  wd3 :std_logic_vector ( 31 downto 0);
signal  a3 :std_logic_vector ( 4 downto 0);
signal pc : std_logic_vector ( 31 downto 0):= (others=>'0');

signal pc_src : std_logic;

signal jump: std_logic;
signal alu_src : std_logic;
signal reg_dst : std_logic;
signal mem_reg : std_logic;
signal reg_write :  STD_LOGIC;
signal branch :  STD_LOGIC;
signal mem_write :  STD_LOGIC;
signal alu_control : STD_LOGIC_VECTOR (2 downto 0);
signal zero_flag :  STD_LOGIC;
begin
pc_plus4 <= std_logic_vector(unsigned(pc) + 4);
pc_branch <= std_logic_vector(signed(pc_plus4) + (signed(signed_imm)sll 2));
pc_jump <=  pc(31 downto 28) & std_logic_vector(unsigned(instruction(25 downto 0))) & "00";
pc_next <= pc_jump when jump ='1' else pc_branch when pc_src ='1' else pc_plus4;

src_b <= rd2 when alu_src ='0' else signed_imm ;
a3 <= instruction(20 downto 16) when reg_dst ='0' else instruction(15 downto 11);
wd3 <= alu_result when mem_reg ='0' else mem_rd_data;
pc_src <= branch and zero_flag;

done <= '1';

pc_file : entity work.pc port map(
    clk => clk,
    reset => reset,
    pc_next_inst => pc_next,
    pc_out => pc
);

sign_extension_file : entity work.sign_extension port map (
    instr_imm => instruction(15 downto 0),
    signed_imm => signed_imm
);

alu_file : entity work.alu port map (
    operand_a => src_a,
    operand_b => src_b,
    alu_control=> alu_control,
    zero_flag=> zero_flag,
    alu_result=> alu_result
);

register_file_2 : entity work.register_file port map (
    a1 => instruction(25 downto 21),
   a2 => instruction(20 downto 16),
   a3 => a3,
   wd3 => wd3,
   wr_en  => reg_write,
   clk => clk,
   rd1 => src_a,
   rd2 => rd2
);

inst_memory_file : entity work.instruction_memory port map (
   pc_out => pc,
   instr_out => instruction
);

data_memory_file : entity work.data_memory port map (
   clk => clk,
   wr_en => mem_write,
   addr => alu_result(7 downto 0),
   wr_data => rd2,
   rd_data => mem_rd_data
);

control_unit_file : entity work.control_unit port map (
   op_code => instruction (31 downto 26),
   funct => instruction (5 downto 0),
   reg_write => reg_write,
   reg_dst  => reg_dst ,
   alu_src => alu_src ,
   branch => branch ,
   mem_write => mem_write ,
   mem_reg => mem_reg ,
   alu_control => alu_control ,
   jump =>jump
);
end Behavioral;
