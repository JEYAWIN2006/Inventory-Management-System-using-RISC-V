module branch(
    input [31:0] op1, op2,
    input branch_en,
    output reg branch_taken
);
    always @(*) begin
        branch_taken = 1'b0;  // Default
        if (branch_en && (op1 == op2))
            branch_taken = 1'b1;
    end
endmodule
