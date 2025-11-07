module single_cycle_riscv(
    input clk,
    input reset,
    input [31:0] instr,
    input [31:0] reg_rdata1,
    input [31:0] reg_rdata2,
    input [31:0] dmem_rdata,
    input [31:0] imm,
    input [3:0]  alu_ctrl,
    input branch_taken,
    output reg [31:0] pc,
    output [31:0] next_pc,
    output [31:0] alu_result,
    output reg reg_we,
    output reg dmem_we,
    output reg [31:0] reg_wdata,
    output [31:0] alu_op2
);

    always @(posedge clk or posedge reset)
        if (reset)
            pc <= 0;
        else
            pc <= next_pc;

    // ALU operand select
    assign alu_op2 = (instr[6:0] == 7'b0010011 || instr[6:0] == 7'b0000011)
                     ? imm : reg_rdata2;

    // Next PC calculation
    assign next_pc = branch_taken ? (pc + imm) : (pc + 4);

    // ALU operation (simple add for now)
    assign alu_result = reg_rdata1 + alu_op2;

    // Control signals
    always @(*) begin
        reg_we   = (instr[6:0] == 7'b0110011 || instr[6:0] == 7'b0010011 || instr[6:0] == 7'b0000011);
        dmem_we  = (instr[6:0] == 7'b0100011);
        reg_wdata = (instr[6:0] == 7'b0000011) ? dmem_rdata : alu_result;
    end

endmodule
