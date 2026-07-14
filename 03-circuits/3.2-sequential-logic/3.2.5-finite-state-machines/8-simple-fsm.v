module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    reg [3:0] state;
    reg [3:0] next_state;
    
    // State transition logic
    always @(*) begin
        next_state[0] = state[0]&(~in) | state[2]&(~in);
        next_state[1] = state[0]&(in) | state[1]&(in) | state[3]&(in);
        next_state[2] = state[1]&(~in) | state[3]&(~in);
        next_state[3] = state[2]&(in);
    end
    
    // State flip-flops with asynchronous reset
    always @(posedge clk) begin
        state <= (reset) ? 4'b0001 : next_state;
    end
    
    // Output logic
    assign out = state[3];

endmodule
