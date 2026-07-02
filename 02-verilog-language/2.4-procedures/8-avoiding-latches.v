// Goal: A circuit has one 16-bit input, and four outputs. Build this 
// circuit that recognizes these four scancodes and asserts the correct 
// output.

// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
	
    always @(*) begin
        {left, down, right, up} = 0;
        
        if (scancode == 16'he06b) left = 1;
        if (scancode == 16'he072) down = 1;
        if (scancode == 16'he074) right = 1;
        if (scancode == 16'he075) up = 1;
    end
endmodule
