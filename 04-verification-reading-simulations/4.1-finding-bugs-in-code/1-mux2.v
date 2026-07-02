// Goal: Fix the bug(s) in the 8-bit wide 2-to-1 multiplexer.

module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );
    
    assign out = sel ? a : b;

endmodule
