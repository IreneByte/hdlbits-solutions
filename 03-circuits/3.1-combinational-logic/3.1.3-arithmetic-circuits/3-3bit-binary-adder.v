// Goal: Create a 3-bit binary ripple-carry adder.

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    wire [3:0] w;
    assign w[0] = cin;
    
    genvar j;
    generate
        for (j = 0; j <= 2; j = j+1) begin : ripple_carry
            fadd f (a[j], b[j], w[j], w[j+1], sum[j]);
        end
    endgenerate
        
    assign cout = w[3:1];
endmodule

module fadd (
    input a, b, cin, 
    output cout, sum);
    assign {cout, sum} = a + b + cin;
endmodule
