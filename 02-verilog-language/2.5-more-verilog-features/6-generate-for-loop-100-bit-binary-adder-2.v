// Goal: Create a 100-bit binary ripple-carry adder by instantiating 100 full adders.

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
	
    fadd f0 (a[0], b[0], cin, cout[0], sum[0]);
    genvar j;
    generate
        for (j = 1; j <= 99; j = j+1) begin : ripple_carry
            fadd f1 (a[j], b[j], cout[j-1], cout[j], sum[j]);
        end
    endgenerate
endmodule

module fadd ( 
    input a, b, cin,
    output cout, sum );
	
    assign {cout, sum} = a + b + cin;
endmodule