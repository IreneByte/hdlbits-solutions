// Goal: create one instance of module mod_a, then connect the module's three pins 
// (in1, in2, and out) to your top-level module's three ports (wires a, b, and out).

module top_module ( input a, input b, output out );
    mod_a instance1 (.in1(a), .in2(b), .out(out));
endmodule
