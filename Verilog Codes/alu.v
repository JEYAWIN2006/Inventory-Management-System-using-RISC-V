module alu(
    input [31:0] op1, op2,
    input [3:0] alu_ctrl,
    output reg [31:0] result
);
    always @(*) begin
        case (alu_ctrl)
            4'b0000: result = op1 + op2;
            4'b0001: result = op1 - op2;
            default: result = 0;
        endcase
    end
endmodule
