library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        op1             : in     vl_logic_vector(31 downto 0);
        op2             : in     vl_logic_vector(31 downto 0);
        alu_ctrl        : in     vl_logic_vector(3 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end alu;
