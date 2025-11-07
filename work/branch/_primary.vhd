library verilog;
use verilog.vl_types.all;
entity branch is
    port(
        op1             : in     vl_logic_vector(31 downto 0);
        op2             : in     vl_logic_vector(31 downto 0);
        branch_en       : in     vl_logic;
        branch_taken    : out    vl_logic
    );
end branch;
