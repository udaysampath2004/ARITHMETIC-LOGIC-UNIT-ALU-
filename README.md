# ARITHMETIC-LOGIC-UNIT-ALU-

*Company*:CODTECH IT SOLUTIONS

*Name*: GUDLA UDAY SAMPATH

*Intern ID*: CTIS1380

*Domain*: VLSI

*Duration*: 4Weeks

*Mentor*: Neela Santhosh Kumar

Description:
         The Arithmetic Logic Unit (ALU) is the fundamental computational building block of a Central Processing Unit (CPU). It is a combinational digital circuit responsible for performing arithmetic and bitwise logical operations on integer binary numbers. In modern processor architectures, the ALU executes instructions fetched by the control unit, processing data from registers to generate results and status flags. This report describes the design, Verilog implementation, and verification of a basic 8-bit ALU supporting Addition, Subtraction, AND, OR, and NOT operations.
# Verilog Implementation (alu.v)
The Verilog code utilizes a behavioral modeling approach, which describes the functionality of the circuit rather than its gate-level structure.

*1*)Module Definition: The module alu accepts 8-bit inputs A and B and a 3-bit selector ALU_Sel. It outputs an 8-bit ALU_Out and a 1-bit CarryOut.

*2*)Carry Logic: To correctly capture the carry bit during addition, the design uses a temporary 9-bit wire, tmp. By concatenating a leading zero to the inputs ({1'b0, A} + {1'b0, B}), the 9th bit (MSB) of the sum preserves the carry-out information, preventing data loss.

*3*)Operation Selection: A case statement within an always @(*) block forms the heart of the design. This block triggers whenever any input changes (combinational logic).

*4*)Arithmetic: Cases 3'b000 (ADD) and 3'b001 (SUB) utilize Verilog’s built-in arithmetic operators.

*5*)Logic: Cases 3'b010 (AND), 3'b011 (OR), and 3'b100 (NOT) utilize bitwise operators (&, |, ~).

*6*)Default: A default case ensures the latch-free synthesis of the circuit by defining outputs for unused selection codes.
# Verification Strategy (alu_tb.v)
Verification is conducted using a testbench, alu_tb, which simulates the hardware by applying stimulus vectors to the ALU inputs and observing the outputs.

*1*)Instantiation: The Unit Under Test (UUT) is connected to local registers (A, B, ALU_Sel) and wires (ALU_Out, CarryOut).

*2*)Stimulus Generation: The initial block executes a sequence of test cases separated by time delays (#10).

     *a*)Test Case 1 (ADD): Inputs 0A (10) and 02 (2) are added. The expected result is 0C (12) with CarryOut=0.
     *b*)Test Case 2 (SUB): Subtracting 02 from 0A yields 08.
     *c*)Test Case 3 (AND): FF AND 0F masks the upper nibble, resulting in 0F.
*3*)Monitoring: The $monitor system task continuously tracks and prints signal values to the console whenever a change occurs, providing a real-time log of the ALU’s response to each operation.

This design successfully demonstrates the integration of arithmetic and logic functions into a single cohesive unit, verified through comprehensive simulation cases to ensure logical correctness before potential synthesis onto hardware platforms like FPGAs.
#OUTPUT

![img](https://github.com/udaysampath2004/ARITHMETIC-LOGIC-UNIT-ALU-/issues/1#issue-3785335629)

