module top_module ( output reg A, output reg B );//

    // generate input patterns here
    initial A = 0;
    initial B = 0;
    
    initial begin
		#10		A <= 1;
        #5		B <= 1;
        #5 	A <= 0;
        #20		B <= 0;
    end

endmodule
