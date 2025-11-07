library verilog;
use verilog.vl_types.all;
entity data_mem is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        rdata           : out    vl_logic_vector(31 downto 0)
    );
end data_mem;
