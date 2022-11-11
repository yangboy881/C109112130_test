`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:24:57 11/07/2022
// Design Name:   FSM_pinpon_all
// Module Name:   C:/Users/Rebas/Desktop/FPGA_new/Lab3_copy/Lab3_pinpon/FSM_pinpon_all2_tb.v
// Project Name:  Lab3_pinpon
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_pinpon_all
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_pinpon_all2_tb;

	// Inputs
	reg clk;
	reg rst;
	reg IN_left;
	reg IN_right;

	// Outputs
	wire [7:0] led_pinpon;
	wire [3:0] CNT_left;
	wire [3:0] CNT_right;
	wire [7:0] seg7_out;

	// Instantiate the Unit Under Test (UUT)
	FSM_pinpon_all uut (
		.clk(clk), 
		.rst(rst), 
		.IN_left(IN_left), 
		.IN_right(IN_right), 
		.led_pinpon(led_pinpon), 
		.CNT_left(CNT_left), 
		.CNT_right(CNT_right), 
		.seg7_out(seg7_out)
	);

		initial begin
		clk = 0;
		rst = 0;
		IN_right = 0;
		IN_left  = 0;
		#20 rst = 1;
		#50 IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		#808 IN_left = 1;
		#40  IN_left = 0;
		#808  IN_right = 1;
		#40  IN_right = 0;
		
		
		
		

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here

	end
	
	initial forever #1 clk=~clk;
      
endmodule
