module alu_control(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] alu_ctrl
);
    always @(*) begin
        case (opcode)
            7'b0110011: begin  // R-type
                case ({funct7, funct3})
                    10'b0000000_000: alu_ctrl = 4'b0000; // ADD
                    10'b0100000_000: alu_ctrl = 4'b0001; // SUB
                    default: alu_ctrl = 4'b0000;
                endcase
            end
            7'b0010011: alu_ctrl = 4'b0000;  // ADDI
            7'b0000011: alu_ctrl = 4'b0000;  // LW
            7'b0100011: alu_ctrl = 4'b0000;  // SW
            7'b1100011: alu_ctrl = 4'b0001;  // BEQ (compare)
            default:    alu_ctrl = 4'b0000;
        endcase
    end
endmodule
