library verilog;
use verilog.vl_types.all;
entity single_cycle_riscv is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        reg_rdata1      : in     vl_logic_vector(31 downto 0);
        reg_rdata2      : in     vl_logic_vector(31 downto 0);
        dmem_rdata      : in     vl_logic_vector(31 downto 0);
        imm             : in     vl_logic_vector(31 downto 0);
        alu_ctrl        : in     vl_logic_vector(3 downto 0);
        branch_taken    : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        next_pc         : out    vl_logic_vector(31 downto 0);
        alu_result      : out    vl_logic_vector(31 downto 0);
        reg_we          : out    vl_logic;
        dmem_we         : out    vl_logic;
        reg_wdata       : out    vl_logic_vector(31 downto 0);
        alu_op2         : out    vl_logic_vector(31 downto 0)
    );
end single_cycle_riscv;
