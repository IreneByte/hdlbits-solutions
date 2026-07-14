module top_module ( );
    output reg clk;
    
    initial clk = 0;
	always #5 clk = ~clk;
    dut dut0(clk);
endmodule
