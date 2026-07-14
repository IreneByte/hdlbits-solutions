module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT=2'd0, RIGHT=2'd1, FALL_L=2'd2, FALL_R=2'd3;
    reg [1:0] state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT: begin
                if (~ground) next_state = FALL_L;
                else if (bump_left && ground) next_state = RIGHT;
            	else next_state = LEFT;
            end
            RIGHT: begin
                if (~ground) next_state = FALL_R;
                else if (bump_right && ground) next_state = LEFT;
            	else next_state = RIGHT;
            end
            FALL_L: next_state = (ground) ? LEFT : FALL_L;
            FALL_R: next_state = (ground) ? RIGHT : FALL_R;
            default: ;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        state <= (areset) ? LEFT : next_state;
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_L) || (state == FALL_R);
endmodule
