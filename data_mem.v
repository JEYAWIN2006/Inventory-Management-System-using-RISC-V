module data_mem(
    input clk, input we,
    input [31:0] addr, wdata,
    output [31:0] rdata
);
    reg [31:0] memory [0:1023];
    assign rdata = memory[addr[11:2]];
    always @(posedge clk)
        if (we) memory[addr[11:2]] <= wdata;
endmodule
