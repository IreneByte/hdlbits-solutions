// Goal: Fix the bug(s) in the circuit that is supposed to recognize 8-bit
// keyboard scancodes for keys 0 through 9, and indicate whether one of the 10
// were valid, and which key was detected.

module top_module (
    input [7:0] code,
    output reg [3:0] out,
    output reg valid );//

    always @(*) begin
        // Set defaults first
        out = 0;
        valid = 1;

        case (code)
            8'h45: out = 0;
            8'h16: out = 1;
            8'h1e: out = 2;
            8'h26: out = 3;
            8'h25: out = 4;
            8'h2e: out = 5;
            8'h36: out = 6;
            8'h3d: out = 7;
            8'h3e: out = 8;
            8'h46: out = 9;
            default: begin
                
                out = 0; // Explicitly set out to 0 here
                valid = 0;
            end
        endcase
    end
endmodule
