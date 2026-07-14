module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF muxdff0 (KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);
    MUXDFF muxdff1 (KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    MUXDFF muxdff2 (KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    MUXDFF muxdff3 (KEY[0], KEY[3], SW[3], KEY[1], KEY[2], LEDR[3]);

endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);
    always @(posedge clk) begin
        case({L, E})
            2'b00: Q = Q;
            2'b01: Q = w;
            2'b10: Q = R;
            2'b11: Q = R;
            default: ;
        endcase
    end
endmodule
