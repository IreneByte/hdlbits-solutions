// Goal: Build a 4-digit BCD (binary-coded decimal) counter. 
// Each decimal digit is encoded using 4 bits/

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
  
    assign ena[1] = (q[3:0] == 4'd9) ? 1 : 0;
    assign ena[2] = (q[3:0] == 4'd9 && q[7:4] == 4'd9) ? 1 : 0;
    assign ena[3] = (q[3:0] == 4'd9 && q[7:4] == 4'd9 && q[11:8] == 4'd9) ? 1 : 0;
    
    bcd_counter ones (clk, 1'b1, reset, q[3:0]);
    bcd_counter tens (clk, ena[1], reset, q[7:4]);
    bcd_counter hundreds (clk, ena[2], reset, q[11:8]);
    bcd_counter thousands (clk, ena[3], reset, q[15:12]);
endmodule

module bcd_counter (
    input clk,
    input ena,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    always @(posedge clk) begin
        if (reset)			q <= 0;
        else if (ena) begin
            if (q >= 4'd9)	q <= 0;
            else			q <= q + 1'd1;
        end
    end
endmodule
