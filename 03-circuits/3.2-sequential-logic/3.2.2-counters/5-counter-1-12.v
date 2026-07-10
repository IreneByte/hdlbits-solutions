// Goal: Design a 1-12 counter with the following inputs and outputs:

// Reset Synchronous active-high reset that forces the counter to 1
// Enable Set high for the counter to run
// Clk Positive edge-triggered clock input
// Q[3:0] The output of the counter
// c_enable, c_load, c_d[3:0] Control signals going to the provided 4-bit counter, so correct operation can be verified.

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
  
    assign c_d = 4'd1;
    assign c_enable = enable;
    assign c_load = (reset || Q == 4'd12 && enable) ? 1 : 0;
    
    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule
