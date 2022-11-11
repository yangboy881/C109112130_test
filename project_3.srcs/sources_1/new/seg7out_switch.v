`timescale 1ns / 1ps

module seg7out_switch(seg7_selected,seg7outvalue,in0,in1,clk,rst);

output reg [1:0] seg7_selected;
output reg [3:0] seg7outvalue;
input [3:0] in0,in1;
input clk,rst;

always @(posedge clk or negedge rst)begin
	if(~rst)
		seg7_selected<=2'b01;
	else
		seg7_selected<={seg7_selected[0],seg7_selected[1]};
end

always @(*)begin
	case(seg7_selected)
	2'b01:seg7outvalue<=in0;
	2'b10:seg7outvalue<=in1;
	default:seg7outvalue<=2'd0;
	endcase
	
end

endmodule
