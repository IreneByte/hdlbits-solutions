// Goal: Create a set of counters suitable for use as a 12-hour clock (with am/pm indicator).

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    wire ss_ones_ena, ss_tens_ena, mm_ones_ena, mm_tens_ena, hh_ena;
    
    assign ss_ones_ena = ena;
    assign ss_tens_ena = ss_ones_ena && ss[3:0] == 4'd9;
    assign mm_ones_ena = ss_tens_ena && ss[7:4] == 4'd5;
    assign mm_tens_ena = mm_ones_ena && mm[3:0] == 4'd9;
    assign hh_ena = mm_tens_ena && mm[7:4] == 4'd5;
        
    counter ss_ones (clk, ss_ones_ena, reset, 4'd9, ss[3:0]);
    counter ss_tens (clk, ss_tens_ena, reset, 4'd5, ss[7:4]);
    
    counter mm_ones (clk, mm_ones_ena, reset, 4'd9, mm[3:0]);
    counter mm_tens (clk, mm_tens_ena, reset, 4'd5, mm[7:4]);
    
    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
        	pm <= 0;
        end else if (hh_ena) begin
            if (hh == 8'h11) begin
                hh <= 8'h12;
                pm <= ~pm;
            end else if (hh == 8'h12) begin
                hh <= 8'h01;
            end else if (hh[3:0] == 4'd9) begin
                hh[7:4] <= hh[7:4] + 1'b1;
                hh[3:0] <= 0;
            end else begin
                hh[3:0] <= hh[3:0] + 1'b1;
            end
        end
    end

endmodule

module counter (
    input clk,
    input ena,
    input reset,        // Synchronous active-high reset
    input [3:0] rollover,
    output [3:0] q);

    always @(posedge clk) begin
        if (reset)				q <= 0;
        else if (ena) begin
            if (q >= rollover)	q <= 0;
            else				q <= q + 1'b1;
        end
    end
endmodule