module top_module ();
    reg clk, reset, t;
    wire q;
    
    always #10 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        t = 0;
        
        #10 reset <= 0;
        #10 t <= 1;
    end
    
    tff tff0 (clk, reset, t, q);
endmodule
