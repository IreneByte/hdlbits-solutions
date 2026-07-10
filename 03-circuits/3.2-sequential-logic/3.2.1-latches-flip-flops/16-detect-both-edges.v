// Goal: For each bit in an 8-bit vector, detect when the input signal changes from
// one clock cycle to the next.

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] p, n, old_in;
    
    always @(posedge clk) begin
        anyedge = in ^ old_in;
        old_in = in;
    end
endmodule
