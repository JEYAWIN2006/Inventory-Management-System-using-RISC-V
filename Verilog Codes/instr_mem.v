module instr_mem (
    input  [31:0] addr,
    output [31:0] instr
);
    // 256 words (1 KB instruction memory)
    reg [31:0] mem [0:1023];

    // Load program from HEX file
    initial begin
        $display("--------------------------------------------------");
        $display("Loading program.hex ...");
        $readmemh("program.hex", mem);
        $display("Program loaded successfully");
        $display("--------------------------------------------------");
    end

    // Output instruction (word-aligned)
    assign instr = mem[addr[9:2]];  

    // For debugging: show PC and instruction whenever address changes
    always @(addr) begin
        $display("Time=%0t | PC=%h | INSTR=%h", $time, addr, instr);
    end

endmodule
