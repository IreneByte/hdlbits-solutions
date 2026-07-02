// Goal: Read the simulation waveform on HDLBits and implement it.

module top_module (
    input a,
    input b,
    output q );

   	// a b q
    // 0 0 0
    // 0 1 0
    // 1 0 0
    // 1 1 1
    
    assign q = a & b;

endmodule
