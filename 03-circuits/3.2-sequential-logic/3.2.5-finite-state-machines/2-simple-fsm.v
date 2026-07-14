// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
	parameter A=0, B=1; 
    reg present_state, next_state;
    
    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(present_state)   
            A: next_state <= (in) ? A : B;
            B: next_state <= (in) ? B : A;
            default: next_state <= B;
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        present_state <= (reset) ? B : next_state;
    end

    // Output logic
    assign out = (present_state == B);

endmodule
