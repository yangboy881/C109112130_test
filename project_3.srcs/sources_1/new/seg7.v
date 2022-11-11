`timescale 1ns / 1ps

module seg7(seg7_out,seg7_in);

input[3:0]seg7_in;
output reg[7:0]seg7_out;

always@(*)begin
   case(seg7_in)
	4'd0:begin seg7_out=8'b00000011;end
	4'd1:begin seg7_out=8'b10011111;end
	4'd2:begin seg7_out=8'b00100101;end
	4'd3:begin seg7_out=8'b00001101;end
	4'd4:begin seg7_out=8'b10011001;end
	4'd5:begin seg7_out=8'b01001001;end
	4'd6:begin seg7_out=8'b01000001;end
	4'd7:begin seg7_out=8'b00011111;end
	4'd8:begin seg7_out=8'b00000001;end
	4'd9:begin seg7_out=8'b00001001;end
	4'd10:begin seg7_out=8'b00010001;end
	4'd11:begin seg7_out=8'b11000001;end
	4'd12:begin seg7_out=8'b01100011;end
	4'd13:begin seg7_out=8'b10000101;end
	4'd14:begin seg7_out=8'b01100001;end
	4'd15:begin seg7_out=8'b01110001;end
	default:;
	endcase
end

endmodule
