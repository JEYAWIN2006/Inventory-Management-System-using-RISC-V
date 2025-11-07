module regfile(
    input clk, input we,
    input [4:0] raddr1, raddr2, waddr,
    input [31:0] wdata,
    output [31:0] rdata1, rdata2
);
    reg [31:0] regs[0:31];
    assign rdata1 = regs[raddr1];
    assign rdata2 = regs[raddr2];
    always @(posedge clk)
        if(we && waddr != 0) regs[waddr] <= wdata;
endmodule
