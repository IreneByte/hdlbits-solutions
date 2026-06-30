// Goal: Create a circuit that will compute a parity bit for a 8-bit byte (which 
// will add a 9th bit to the byte).

module top_module (
    input [7:0] in,
    output parity); 
	assign parity = ^in;
endmodule
