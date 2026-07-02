// Goal: Build the adder-subtractor using two `add16` modules.

// Use a 32-bit XOR gate to invert `b` when `sub` is 1, and connect `sub` to the
// adder carry-in.

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire w, cout2;
    
    add16 A1 (a[15:0], b[15:0] ^ {32{sub}}, sub, sum[15:0], w);
    add16 A2 (a[31:16], b[31:16] ^ {32{sub}}, w, sum[31:16], cout2);
endmodule