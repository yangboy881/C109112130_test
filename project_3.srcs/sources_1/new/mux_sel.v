`timescale 1ns / 1ps

module mux_sel(
    input [3:0] in_cnt_R,
    input [3:0] in_cnt_L,
    input sel,
	 input rst,
    output [3:0] cnt_out
    );

reg [3:0] cnt;


assign cnt_out[3:0] = cnt[3:0];


always @(*)begin
	if(~rst)cnt<=in_cnt_L;
	else begin
		case(sel)
			1'b0:cnt<=in_cnt_L;
			1'b1:cnt<=in_cnt_R;
		endcase
	end
end

endmodule
