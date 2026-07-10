// Goal: For each bit in an 8-bit vector, detect when the input signal changes from 0 in 
// one clock cycle to 1 the next.

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] old_in;
    
    always @(posedge clk) begin
        pedge <= in & ~old_in;
        old_in <= in; // save to a temporary 8-bit vector for slight delay
    end
endmodule