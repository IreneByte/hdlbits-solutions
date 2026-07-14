module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end else begin
            for (int i = 0; i < 256; i++) begin
                int row, col;
                int u, d, l, r;
                int count;
                
                row = i / 16;
                col = i % 16;
                
                u = (row == 15) ? 0  : row + 1;
                d = (row == 0)  ? 15 : row - 1;
                l = (col == 0)  ? 15 : col - 1;
                r = (col == 15) ? 0  : col + 1;
                
                count = q[u*16+l] + q[u*16+col] + q[u*16+r] +
                            q[row*16+l]				+ q[row*16+r] +
                            q[d*16+l] + q[d*16+col] + q[d*16+r];
                
                case (count)
                    2: q[i] <= q[i];
                    3: q[i] <= 1'b1;
                    default: q[i] <= 1'b0;
                endcase
            end
        end
    end
endmodule
