// Goal: Read the simulation waveform on HDLBits and implement it.

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (a | b) & (c | d);

endmodule

