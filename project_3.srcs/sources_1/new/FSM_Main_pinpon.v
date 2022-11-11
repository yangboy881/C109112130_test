`timescale 1ns / 1ps


module FSM_Main_pinpon(
    input In_left_go,
    input In_right_go,
    output [3:0] CNT_left_go,
    output [3:0] CNT_right_go,
	output [7:0] led_light,
    input clk_fast,		//�����s�BFSM�P�_��
	input clk_slow,		//��FSM�窱�A�ΡAFOR����Ȧs��
    input rst_n
    );

//reg [7:0] ball = 8'b0000_0001; //����Ȧs���Areg(7:1)�M(0)



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

// FSM�P�_   
always@(posedge clk_fast or negedge rst_n) begin
	case (curr_state)
   IDLE    : if (~rst_n) curr_state <= IDLE;		//1
             else     curr_state <= S0;  	//0
	//�k��o�y
   S0      : if (~rst_n) curr_state <= IDLE;	
				 else if (in_right) curr_state <= S2;	//1
             else     curr_state <= S0;			//0
	//����o�y
   S1      : if (~rst_n) curr_state <= IDLE;
				 else if (in_left) curr_state <= S3;	//1
             else     curr_state <= S1;			//0
	//���䲾��
   S2      : if (~rst_n) curr_state <= IDLE;
				 else if (in_left  && led_out == 8'b1000_0000)begin
					curr_state <= S3;	//1			
				 end
				 else if (in_left  && led_out < 8'b1000_0000)begin //���䦭��
					curr_state <= S0;			//0
				 end		
				 else if (led_out == 1'b0)begin //����߫�
					curr_state <= S0;			//0
				 end				
             else     curr_state <= S2;			//0
	//�k�䲾��
   S3      : if (~rst_n) curr_state <= IDLE;
				 else if (in_right && led_out == 8'b0000_0001)begin
					curr_state <= S2;	//1
				 end
				 else if (in_right && led_out > 8'b0000_0001)begin//���䦭��
					curr_state <= S1;			//0
				 end
				 else if (led_out == 1'b0)begin//����߫�
					curr_state <= S1;			//0
				 end
             else     curr_state <= S3;			//0
				 
    default :         curr_state <= IDLE;
  endcase   
end  


always@(posedge clk_fast or negedge rst_n) begin  //����P�w(����)
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
	S2      :												//�k��[������
		if({in_left  && led_out < 8'b1000_0000} || led_out == 1'b0)begin
			if(num_right)begin
				cnt_right	<= cnt_right+1'b1;		//�k��+1��
				num_right	<= 0;
			end
			else
				cnt_right <= cnt_right;
		end
		else begin
			cnt_right <= cnt_right;
		end
		
	S3      :												//����[������
		if ({in_right && led_out > 8'b0000_0001} || led_out == 1'b0) begin
			if(num_left)begin
				cnt_left		<= cnt_left+1'b1;			//����+1��
				num_left		<= 0;
			end
			else
				cnt_left  <= cnt_left;		//����
		end
		else begin
			cnt_left  <= cnt_left;//����
		end
	default :  ;
	endcase
	end
end


//����Ȧs��(���k��)�C��CLK
always@(posedge clk_slow or negedge rst_n)begin
	if (~rst_n) begin
		led_out <= 8'b0000_0001;  //�w�q0000_0001�A�k��o�y
	end
	else begin
	case (curr_state)
		S0		:	led_out <= 8'b0000_0001;
		S1		:	led_out <= 8'b1000_0000;
		S2		:   led_out <= {led_out[6:0],1'b0};  //����
		S3		:	led_out <= {1'b0,led_out[7:1]};  //�k��
		default :         led_out <= led_out;		 //�����O
	endcase
	end
end

//de_btn  ����`���s��o��(��) 1�i����A0����o��

endmodule
