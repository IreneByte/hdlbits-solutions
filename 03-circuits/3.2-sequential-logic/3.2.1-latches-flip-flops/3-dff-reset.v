// Goal: Create 8 D flip-flops with active high synchronous reset. All DFFs should
// be triggered by the positive edge of clk.

module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk) begin
        q = 0;
        if (~reset) q = d;
    end
endmodule
