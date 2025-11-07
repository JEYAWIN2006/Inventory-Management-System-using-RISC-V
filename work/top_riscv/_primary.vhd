library verilog;
use verilog.vl_types.all;
entity top_riscv is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end top_riscv;
