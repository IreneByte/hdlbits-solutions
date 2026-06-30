// Goal: Implement a circuit with multiple instances of modules.

module A (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule

module B ( input x, input y, output z );
	assign z = x ~^ y;
endmodule

module top_module (input x, input y, output z);
    wire zA1, zA2, zB1, zB2, o1, o2;
    
    A IA1 (x, y, zA1);
    A IA2 (x, y, zA2);
    B IB1 (x, y, zB1);
    B IB2 (x, y, zB2);
    
    assign o1 = zA1 | zA2;
    assign o2 = zB1 & zB2;
    assign z = o1 ^ o2;
endmodule