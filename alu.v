module alu(
    input [7:0] A, B,        // 8-bit Input operands
    input [2:0] ALU_Sel,     // 3-bit Selection code
    output reg [7:0] ALU_Out,// 8-bit Result
    output reg CarryOut      // Carry out flag for addition
);
    wire [8:0] tmp;
    assign tmp = {1'b0, A} + {1'b0, B}; // Calculate carry for addition

    always @(*) begin
        case(ALU_Sel)
            3'b000: begin // Addition
                ALU_Out = A + B;
                CarryOut = tmp[8];
            end
            3'b001: begin // Subtraction
                ALU_Out = A - B;
                CarryOut = 1'b0;
            end
            3'b010: begin // Bitwise AND
                ALU_Out = A & B;
                CarryOut = 1'b0;
            end
            3'b011: begin // Bitwise OR
                ALU_Out = A | B;
                CarryOut = 1'b0;
            end
            3'b100: begin // Bitwise NOT (Inverts A)
                ALU_Out = ~A;
                CarryOut = 1'b0;
            end
            default: begin
                ALU_Out = 8'b00000000;
                CarryOut = 1'b0;
            end
        endcase
    end
endmodule
