`timescale 1ns / 1ps


module FSM_Main_pinpon(
    input In_left_go,
    input In_right_go,
    output [3:0] CNT_left_go,
    output [3:0] CNT_right_go,
	output [7:0] led_light,
    input clk_fast,		//給按鈕、FSM判斷用
	input clk_slow,		//給FSM改狀態用，FOR移位暫存器
    input rst_n
    );

//reg [7:0] ball = 8'b0000_0001; //移位暫存器，reg(7:1)和(0)



parameter IDLE = 3'b000;
parameter S0   = 3'b001;
parameter S1   = 3'b010;
parameter S2   = 3'b011;
parameter S3   = 3'b100;

reg sel;
reg num_right;
reg num_left;
reg [7:0] led_out;
reg [3:0] cnt_left;
reg [3:0] cnt_right;
reg [2:0] curr_state;

assign in_left			  = In_left_go;
assign in_right		      = In_right_go;
assign CNT_left_go[3:0]   =  cnt_left[3:0];
assign CNT_right_go[3:0]  =  cnt_right[3:0];
assign led_light[7:0]  =  led_out[7:0];

// FSM判斷   
always@(posedge clk_fast or negedge rst_n) begin
	case (curr_state)
   IDLE    : if (~rst_n) curr_state <= IDLE;		//1
             else     curr_state <= S0;  	//0
	//右邊發球
   S0      : if (~rst_n) curr_state <= IDLE;	
				 else if (in_right) curr_state <= S2;	//1
             else     curr_state <= S0;			//0
	//左邊發球
   S1      : if (~rst_n) curr_state <= IDLE;
				 else if (in_left) curr_state <= S3;	//1
             else     curr_state <= S1;			//0
	//左邊移動
   S2      : if (~rst_n) curr_state <= IDLE;
				 else if (in_left  && led_out == 8'b1000_0000)begin
					curr_state <= S3;	//1			
				 end
				 else if (in_left  && led_out < 8'b1000_0000)begin //左邊早按
					curr_state <= S0;			//0
				 end		
				 else if (led_out == 1'b0)begin //左邊晚按
					curr_state <= S0;			//0
				 end				
             else     curr_state <= S2;			//0
	//右邊移動
   S3      : if (~rst_n) curr_state <= IDLE;
				 else if (in_right && led_out == 8'b0000_0001)begin
					curr_state <= S2;	//1
				 end
				 else if (in_right && led_out > 8'b0000_0001)begin//左邊早按
					curr_state <= S1;			//0
				 end
				 else if (led_out == 1'b0)begin//左邊晚按
					curr_state <= S1;			//0
				 end
             else     curr_state <= S3;			//0
				 
    default :         curr_state <= IDLE;
  endcase   
end  


always@(posedge clk_fast or negedge rst_n) begin  //左邊判定(左移)
	if (~rst_n) begin
		cnt_left  <= 4'b0;
		cnt_right <= 4'b0;
		num_right <= 1;
		num_left	 <= 1;
	end
	else begin
	case (curr_state)
	S0      :
			num_right <=1;
	S1      :	
			num_left  <=1;
	S2      :												//右邊加分條件
		if({in_left  && led_out < 8'b1000_0000} || led_out == 1'b0)begin
			if(num_right)begin
				cnt_right	<= cnt_right+1'b1;		//右邊+1分
				num_right	<= 0;
			end
			else
				cnt_right <= cnt_right;
		end
		else begin
			cnt_right <= cnt_right;
		end
		
	S3      :												//左邊加分條件
		if ({in_right && led_out > 8'b0000_0001} || led_out == 1'b0) begin
			if(num_left)begin
				cnt_left		<= cnt_left+1'b1;			//左邊+1分
				num_left		<= 0;
			end
			else
				cnt_left  <= cnt_left;		//不動
		end
		else begin
			cnt_left  <= cnt_left;//不動
		end
	default :  ;
	endcase
	end
end


//移位暫存器(左右移)慢的CLK
always@(posedge clk_slow or negedge rst_n)begin
	if (~rst_n) begin
		led_out <= 8'b0000_0001;  //定義0000_0001，右邊發球
	end
	else begin
	case (curr_state)
		S0		:	led_out <= 8'b0000_0001;
		S1		:	led_out <= 8'b1000_0000;
		S2		:   led_out <= {led_out[6:0],1'b0};  //左移
		S3		:	led_out <= {1'b0,led_out[7:1]};  //右移
		default :         led_out <= led_out;		 //都不是
	endcase
	end
end

//de_btn  防止常按連續得分(左) 1可能分，0防止得分

endmodule
