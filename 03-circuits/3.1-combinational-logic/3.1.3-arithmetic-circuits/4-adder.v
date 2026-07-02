// Goal: Create a ripple-carry adder using 4 full adders.

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire w0, w1, w2;
    
    FA f0(x[0], y[0], 1'b0, w0, sum[0]);
    FA f1(x[1], y[1], w0, w1, sum[1]);
    FA f2(x[2], y[2], w1, w2, sum[2]);
    FA f3(x[3], y[3], w2, sum[4], sum[3]);
endmodule

module FA (input x, input y, input cin, output cout, output sum);
    assign {cout, sum} = x + y + cin;
endmodule
