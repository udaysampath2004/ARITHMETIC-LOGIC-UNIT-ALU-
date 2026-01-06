//Testbench for Alu
module alu_tb;
    reg [7:0] A, B;
    reg [2:0] ALU_Sel;
    wire [7:0] ALU_Out;
    wire CarryOut;

    // Instantiate the ALU unit
    alu uut (
        .A(A), .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .CarryOut(CarryOut)
    );

    initial begin
        $monitor("Time=%0t | A=%b B=%b Sel=%b | Result=%b Carry=%b", 
                 $time, A, B, ALU_Sel, ALU_Out, CarryOut);

        // Test Case 1: Addition (A + B)
        A = 8'h01; B = 8'h09; ALU_Sel = 3'b000; #10;
        
        // Test Case 2: Subtraction (A - B)
        A = 8'h0A; B = 8'h02; ALU_Sel = 3'b001; #10;

        // Test Case 3: Bitwise AND
        A = 8'hFF; B = 8'h0F; ALU_Sel = 3'b010; #10;

        // Test Case 4: Bitwise OR
        A = 8'hF0; B = 8'h0F; ALU_Sel = 3'b011; #10;

        // Test Case 5: Bitwise NOT
        A = 8'hAA; ALU_Sel = 3'b100; #10;

        $finish;
    end
endmodule
