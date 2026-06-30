// Goal: Create a module that implements an XNOR gate
module top_module( 
    input a, 
    input b, 
    output out );
    // Outputs 1 if there is an even number of 1s in input, 0 otherwise
	assign out = a~^b;
endmodule