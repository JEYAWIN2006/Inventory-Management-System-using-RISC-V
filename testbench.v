`timescale 1ns/1ps   // <-- Add this line at the top!

module testbench;
    reg clk = 0;
    reg reset = 1;

    // Instantiate the top module
    top_riscv dut(.clk(clk), .reset(reset));

    // Clock generation: toggles every 5ns (period = 10ns → 100MHz)
    always #5 clk = ~clk;

    initial begin
        // Waveform dump
        $dumpfile("riscv.vcd");
        $dumpvars(0, dut);  // dump all internal DUT signals

        // Reset sequence
        reset = 1;
        #200;               // Hold reset longer (200ns instead of 20ns)
        reset = 0;          // Release reset

        // Simulation runtime
        #5000;              // Run long enough (5µs)
        $display("Simulation completed.");
        $finish;
    end
endmodule
