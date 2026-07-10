// Goal: Build a circuit that functionally behaves like a dual-edge triggered flip-flop.

module top_module (
    input clk,
    input d,
    output q
);
    reg p, n;
    
    always @(posedge clk) p = d;
    always @(negedge clk) n = d;
    
    assign q = clk ? p : n;
endmodule
