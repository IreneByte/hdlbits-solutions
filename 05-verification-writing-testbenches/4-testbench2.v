module top_module();
	reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
    initial clk = 0;
    initial in = 0;
    initial s = 3'd2;
    
    always #5 clk = ~clk;
    
    initial begin
        #10 s = 3'd6;
        
        #10 s = 3'd2;
        	in <= 1;
        
        #10 s = 3'd7;
        	in <= 0;
        
        #10 s = 3'd0;
        	in <= 1;
        
        #30 in <= 0;
    end
    
    q7 q7_0 (clk, in, s, out);
endmodule
