// Goal: Create a 1-bit wide, 256-to-1 multiplexer. The 256 inputs
// are all packed into a single 256-bit input vector.

module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    assign out = in[sel];
endmodule
