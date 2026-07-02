// Goal: Determine the relationship between each bit of `in[99:0]` and its
// neighbor.

// `out_both`: Set each bit if the corresponding input bit and its left neighbor
// are both 1 (`out_both[3]` is unused).

// `out_any`: Set each bit if the corresponding input bit or its right neighbor
// is 1 (`out_any[0]` is unused).

// `out_different`: Set each bit if the corresponding input bit differs from its
// left neighbor, treating the vector as wrapping around.

module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

    always @(*) begin
        for (integer j = 0; j <= 98; j = j+1) 
            out_both[j] = (in[j] && in[j+1]) ? 1 : 0;
        
        for (integer j = 1; j <= 99; j = j+1) 
            out_any[j] = (in[j] || in[j-1]) ? 1 : 0;
        
        for (integer j = 0; j <= 99; j = j+1) 
            out_different[j] = (in[j] ^ in[(j+1)%100]) ? 1 : 0;
    end
endmodule
