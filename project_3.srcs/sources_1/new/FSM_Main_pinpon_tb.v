`timescale 1ns / 1ps



module FSM_Main_pinpon_tb;

	// Inputs
	reg in_left;
	reg in_right;
	reg clk_fast;
	reg clk_slow;
	reg rst_n;

	// Outputs
	wire [3:0] CNT_left;
	wire [3:0] CNT_right;
	wire [7:0] led_light;

	// Instantiate the Unit Under Test (UUT)
	FSM_Main_pinpon uut (
		.in_left(in_left), 
		.in_right(in_right), 
		.CNT_left(CNT_left), 
		.CNT_right(CNT_right), 
		.led_light(led_light), 
		.clk_fast(clk_fast), 
		.clk_slow(clk_slow), 
		.rst_n(rst_n)
	);


	initial begin
		// Initialize Inputs
		clk_fast = 0;
		clk_slow = 0;
		rst_n = 0;
		in_right = 0;
		in_left  = 0;
		#10  rst_n = 1;
		#50  in_right = 1;
		#10  in_right = 0;
		#414 in_left = 1;
		#10 in_left = 0;
		#414  in_right = 1;
		#10  in_right = 0;
		#414 in_left = 1;
		#10 in_left = 0;
		#414  in_right = 1;
		#10  in_right = 0;
		#414 in_left = 1;
		#10 in_left = 0;
		#414  in_right = 1;
		#10  in_right = 0;
		#414 in_left = 1;
		#10 in_left = 0;
		#414  in_right = 1;
		#10  in_right = 0;
		#414 in_left = 1;
		#10 in_left = 0;
		
		
		
		

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here

	end
	
	initial forever #2 clk_fast=~clk_fast;
	initial forever #32 clk_slow=~clk_slow;
      
endmodule

