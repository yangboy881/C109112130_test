`timescale 1ns / 1ps

module random_8bit(valueout,rst,clk,start);

output reg [3:0]valueout;
input clk, rst, start;

reg [3:0]seedcnt,value;

always@(posedge clk or negedge rst)begin
	if(~rst)
		seedcnt<=0;
	else
		seedcnt<=seedcnt+1;
end

always@(posedge clk or negedge rst)begin
	if(~rst)begin
		valueout<=0;
		value<=0;
	end
	else begin			
		if(start)begin				
			if(value==0)
				value<=seedcnt;
			else begin
				valueout[0]<=value[3]^value[2];
				valueout[1]<=value[2]^value[1];
				valueout[2]<=value[1]^value[0];
				valueout[3]<=value[3];					
			end			
		end
		else begin
			valueout<=valueout;
			value<=0;
		end
	end
end


endmodule
