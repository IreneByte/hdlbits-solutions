// Goal: Build a carry-select adder using three `add16` modules and your own
// 16-bit 2-to-1 multiplexer.

// The provided `add16` module adds two 16-bit numbers with a carry-in and
// produces a 16-bit sum and carry-out.

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1, cout2, cout3;
    wire [15:0] sum2, sum3;
    
    add16 A1 (a[15:0], b[15:0], 1'b0, sum[15:0], cout1);
    add16 A2 (a[31:16], b[31:16], 1'b0, sum2, cout2);
    add16 A3 (a[31:16], b[31:16], 1'b1, sum3, cout3);
    
    always @(*) begin
        case(cout1)
            1'b0: sum[31:16] = sum2;
            1'b1: sum[31:16] = sum3;
            default: ;
        endcase
    end
endmodule
