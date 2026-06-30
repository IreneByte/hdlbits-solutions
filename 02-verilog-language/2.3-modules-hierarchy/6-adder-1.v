// Goal: Given a module add16 that performs a 16-bit addition. Instantiate two of 
// them to create a 32-bit adder. One add16 module computes the lower 16 bits of 
// the addition result, while the second add16 module computes the upper 16 bits 
// of the result, after receiving the carry-out from the first adder.

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1, cout2;
    wire [15:0] sum1, sum2;
    add16 a1 (a[15:0], b[15:0], 1'b0, sum1, cout1);
    add16 a2 (a[31:16], b[31:16], cout1, sum2, cout2);
    
    assign sum[15:0] = sum1;
    assign sum[31:16] = sum2;
endmodule