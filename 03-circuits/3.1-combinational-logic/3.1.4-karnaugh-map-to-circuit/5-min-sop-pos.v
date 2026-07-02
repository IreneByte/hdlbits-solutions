// Goal: For inputs a,b,c,d, generate a logic-1 for 2, 7, and 15, and logic-0 for
// 0,1,4,5,6,9,10,13,14.

// 3,8,11,12 never occur. Find out_sop in minimum SOP form and out_pos in minimum
// POS form.

module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

    assign out_sop = (c & d) | (~a & ~b & c);
    assign out_pos = c & (~a | d) & (~b | ~c | d);
endmodule
