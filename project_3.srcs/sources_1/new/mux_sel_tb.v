`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:54:19 11/07/2022
// Design Name:   mux_sel
// Module Name:   C:/Users/Rebas/Desktop/FPGA_new/Lab3_copy/Lab3_pinpon/mux_sel_tb.v
// Project Name:  Lab3_pinpon
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_sel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_sel_tb;

	// Inputs
	reg [3:0] in_cnt_R;
	reg [3:0] in_cnt_L;
	reg sel;
	reg rst;

	// Outputs
	wire [3:0] cnt_out;

	// Instantiate the Unit Under Test (UUT)
	mux_sel uut (
		.in_cnt_R(in_cnt_R), 
		.in_cnt_L(in_cnt_L), 
		.sel(sel), 
		.rst(rst), 
		.cnt_out(cnt_out)
	);

	initial begin
		// Initialize Inputs
		in_cnt_R = 0;
		in_cnt_L = 0;
		sel = 0;
		rst = 0;
		#10 rst = 1;
		in_cnt_R = 4'd10;
		in_cnt_L = 4'd12;
		#20 sel = 1;
		#20 sel = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

