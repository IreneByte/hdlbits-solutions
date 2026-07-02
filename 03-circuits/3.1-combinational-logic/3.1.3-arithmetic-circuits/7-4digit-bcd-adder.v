// Goal: Create a 4-digit BCD ripple-carry adder.

// Use four provided bcd_fadd modules to add two 4-digit BCD numbers (packed into
// 16-bit vectors) and a carry-in, producing a 4-digit sum and carry-out.

module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
	
    wire [4:0] w;
    assign w[0] = cin;
    
    genvar j;
    generate
        for (j = 0; j < 4; j = j+1) begin : ripple_carry
            bcd_fadd f (a[j*4 +: 4], b[j*4 +: 4], w[j], w[j+1], sum[j*4 +: 4]);
        end
    endgenerate
    
    assign cout = w[4];
endmodule
