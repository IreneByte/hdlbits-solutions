// Goal: Given a module my_dff8 with two inputs and one output (that implements a set 
// of 8 D flip-flops). Instantiate three of them, then chain them together to make 
// a 8-bit wide shift register of length 3. In addition, create a 4-to-1 multiplexer 
// (not provided) that chooses what to output depending on sel[1:0].

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] w1, w2, w3;
    my_dff8 d1 (clk, d, w1);
    my_dff8 d2 (clk, w1, w2);
    my_dff8 d3 (clk, w2, w3);
    
    always @(*) begin
        case(sel)
            2'd0: q = d;
            2'd1: q = w1;
            2'd2: q = w2;
            2'd3: q = w3;
            default:;
        endcase
    end
endmodule