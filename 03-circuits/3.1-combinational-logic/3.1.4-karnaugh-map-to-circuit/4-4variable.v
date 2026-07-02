// Goal: Implement the shown kmap.

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    always @(*) begin
        out = 1;
        if ({a, b} == {c, d} || {a, b} == ~{c, d}) 
            out = 0;
    end
endmodule
