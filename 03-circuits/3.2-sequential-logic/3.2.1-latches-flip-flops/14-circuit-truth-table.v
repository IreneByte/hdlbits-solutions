// Goal: Implement a JK flip-flop with only a D-type flip-flop and gates.

module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
	reg Q_old;
    
    always @(posedge clk) begin
        if (~j && ~k) Q <= Q;
        else if (~j && k) Q <= 0;
        else if (j && ~k) Q <= 1;
        else Q <= ~Q;
    end
endmodule
