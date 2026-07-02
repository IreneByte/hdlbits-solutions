// Goal: Instantiate 100 copies of bcd_fadd to create a 100-digit BCD 
// ripple-carry adder. 

// - Provided with a BCD one-digit adder named bcd_fadd that adds two BCD 
// digits and carry-in, and produces a sum and carry-out.

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire [100:0] w;
    assign w[0] = cin;
    
    genvar j;
    generate
        for (j = 0; j <= 99; j = j+1) begin : ripple_carry
            bcd_fadd f (a[j*4 +: 4], b[j*4 +: 4], w[j], w[j+1], sum[j*4 +: 4]);
        end
    endgenerate
    
    assign cout = w[100];
endmodule