`timescale 1ns / 1ps


module Mux5to1_forRandon(
    input  in_A,
    input  in_B,
    input  in_C,
    input  in_D,
    input  in_E,
    input [2:0] sel_Randon,
    output Mux_out
    );

reg  Mux_out;

always @(sel_Randon)begin
		case(sel_Randon)
			3'd0 : Mux_out = in_A;
			3'd1 : Mux_out = in_B;
			3'd2 : Mux_out = in_C;
			3'd3 : Mux_out = in_D;
			3'd4 : Mux_out = in_E;
			default : Mux_out = in_A;
		endcase
end    
    
endmodule
