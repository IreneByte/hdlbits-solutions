module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [3:0] state, next_state;
    localparam BELOW_S1 = 4'b0001, S2_S1 = 4'b0010, S3_S2 = 4'b0100, ABOVE_S3 = 4'b1000;
    
    always @(*) begin
        next_state[3] = s[1] & s[2] & s[3];
        next_state[2] = s[1] & s[2] & ~s[3];
        next_state[1] = s[1] & ~s[2] & ~s[3];
        next_state[0] = ~s[1] & ~s[2] & ~s[3];
    end
    
    always @(posedge clk) begin
        if (reset) begin
            state <= BELOW_S1;
            dfr <= 1;
        end else begin
            state <= next_state;
            if (next_state < state)			dfr <= 1;
            else if (next_state > state)	dfr <= 0;
        end
    end
    
    assign fr1 = state[2] | state[1] | state[0];
    assign fr2 = state[1] | state[0];
    assign fr3 = state[0];
        
endmodule
