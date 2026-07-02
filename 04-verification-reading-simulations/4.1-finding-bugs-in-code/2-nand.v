// Goal: Fix the bug(s) in the 3-input NAND gate using a 5-input
// AND gate.

module top_module (input a, input b, input c, output out);
    wire intout;
    andgate inst1(intout, a, b, c, 1'b1, 1'b1);
    assign out = ~intout;
endmodule
