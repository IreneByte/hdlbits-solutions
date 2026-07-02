// Goal: Read the simulation waveform on HDLBits and implement it.

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    always @(*) begin
        q = 0;
        if ({a,b} == {c,d} || {a,b} == ~{c,d})
            q = 1;
    end
endmodule
