`timescale 1ns / 1ps



module FSM_pinpon_all_tb;

	// Inputs
	reg clk;
	reg rst;
	reg IN_left;
	reg IN_right;

	// Outputs
	wire [3:0] CNT_left;
	wire [3:0] CNT_right;
	wire [7:0] led_pinpon;

	// Instantiate the Unit Under Test (UUT)
	FSM_pinpon_all uut (
		.clk(clk), 
		.rst(rst), 
		.IN_left(IN_left), 
		.IN_right(IN_right), 
		.CNT_left(CNT_left), 
		.CNT_right(CNT_right), 
		.led_pinpon(led_pinpon)
	);

		initial begin
		// Initialize Inputs
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
