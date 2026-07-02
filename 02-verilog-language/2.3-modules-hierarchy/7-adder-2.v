// Goal: Create a circuit with two levels of hierarchy.
// The top_module will instantiate two copies of add16 (provided),
// each of which will instantiate 16 copies of add1


module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire w1, cout1; 
    add16 A1 (a[15:0], b[15:0], 1'b0, sum[15:0], w1);
    add16 A2 (a[31:16], b[31:16], w1, sum[31:16], cout1);

endmodule

module add1 (input a, input b, input cin, output sum, output cout);
    assign {cout, sum} = a + b + cin;
endmodule
