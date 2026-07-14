module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
                
    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            for (int i = 0; i <= 511; i++) begin
                reg l, c, r;
                
                c = q[i];
                l = (i == 511) 	?	0 : q[i+1];
                r = (i == 0)	? 	0 : q[i-1];
                
                q[i] <= (c & ~r) | (r & (~l | ~c));
            end
        end
    end
endmodule
