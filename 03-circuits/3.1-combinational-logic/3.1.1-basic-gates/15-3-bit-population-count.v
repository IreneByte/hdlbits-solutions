// Goal: Build a population count circuit for a 3-bit input vector.

module top_module( 
    input [2:0] in,
    output [1:0] out );

    always @(*) begin
        out = 0;
        for (integer j = 0; j < 3; j = j+1)
            if (in[j] == 1) out = out + 1;
    end
endmodule
