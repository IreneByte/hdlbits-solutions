module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    
	always @(posedge clk) begin
        if (reset) q <= 32'h1;
        else begin          
            q[31] <= q[0];
            for (int i = 31; i > 0; i--) begin
                case(i)
                    22, 2, 1: 
                        q[i-1] <= q[i] ^ q[0];
                    default: 
                        q[i-1] <= q[i];
                endcase
            end
        end
    end
endmodule
