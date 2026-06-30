// Goal: Given a module my_dff with two inputs and one output (that implements a D flip-flop). 
// Instantiate three of them, then chain them together to make a shift register of length 3. 
// The clk port needs to be connected to all instances.

module top_module ( input clk, input d, output q );
    wire w1, w2;
    
    my_dff ff1 (clk, d, w1);
    my_dff ff2 (clk, w1, w2);
    my_dff ff3 (clk, w2, q);
endmodule
