`timescale 1ns / 1ps


module Decoder3to8(Dout,Din);
input [2:0] Din;
output [7:0] Dout;
reg [7:0] Dout;

always@(Din)
	case(Din)
	3'd0:
		Dout=8'b00000001;
	3'd1:
		Dout=8'b00000010;
	3'd2:
		Dout=8'b00000100;
	3'd3:
		Dout=8'b00001000;
	3'd4:
		Dout=8'b00010000;
	3'd5:
		Dout=8'b00100000;
	3'd6:
		Dout=8'b01000000;
	3'd7:
		Dout=8'b10000000;
	endcase

endmodule
