// Goal: Implement Circuit B given a simulation waveform.

module top_module ( input x, input y, output z );
	assign z = x ~^ y;
endmodule
