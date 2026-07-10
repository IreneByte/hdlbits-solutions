// Goal: Implement the shown kmap.

module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    assign out = a | b | c;
endmodule
