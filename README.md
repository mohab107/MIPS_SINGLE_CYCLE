# MIPS_SINGLE_CYCLE
A 32-bit single-cycle MIPS processor implemented in VHDL. Supports R-type, I-type, and J-type instructions with core components like ALU, register file, control unit, and memory. Verified using a testbench with hand-encoded MIPS instructions.

🧩 Components

Program Counter (PC): Holds the address of the current instruction

Instruction Memory: Stores 32-bit MIPS instructions

Sign Extend: Extends 16-bit immediates to 32-bit

Register File: Contains 32 general-purpose registers

ALU: Performs arithmetic and logic operations

Control Unit: Generates control signals based on opcode/funct

Data Memory: Supports load/store instructions



---

🧾 Supported Instructions

✅ R-Type

add, sub, and, or, slt


✅ I-Type

addi, lw, sw, beq


✅ J-Type

j



---

🧪 Testbench

A complete testbench was created by:

1. Writing MIPS assembly code to test each supported instruction


2. Manually converting the instructions into 32-bit binary format based on the MIPS ISA


3. Loading these binary instructions into the instruction memory


4. Simulating the processor and verifying that the outputs (registers, memory) matched the expected results



This ensures that control flow, memory access, and ALU operations work as expected.

---

👨‍💻 Developed by: Mohab Elsayed
