library verilog;
use verilog.vl_types.all;
entity instr_mem is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        instr           : out    vl_logic_vector(31 downto 0)
    );
end instr_mem;
