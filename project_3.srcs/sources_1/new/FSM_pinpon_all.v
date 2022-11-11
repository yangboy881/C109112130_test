
`timescale 1ns / 1ps

module FSM_pinpon_all(clk,rst,IN_left,IN_right,Sel_IN,Sel_CH,Mux2_pinpon_out); //CNT_left,CNT_right,CNT_seg7

input clk,rst;
input IN_left,IN_right,Sel_IN,Sel_CH;
//output [1:0] seg7_outselect;
output [7:0] Mux2_pinpon_out;
//output [3:0] CNT_left,CNT_right;
wire [3:0] CNT_seg7;
//wire [3:0] s1_seg7;
wire clk_out_1,clk_out_2,clk_out_3,de_L,de_R,divclk_ran,divclk_been;
wire divclk_c1,divclk_c2,divclk_c3,divclk_c4,divclk_c5;
wire [3:0] CNT_left,CNT_right;
wire [7:0] led_pinpon,CNT_in;
wire [2:0] Randon_out;

assign CNT_in[3:0] = CNT_right [3:0];
assign CNT_in[7:4] = CNT_left  [3:0];


//Div_web Div_forFSM(.CLK(clk), .RST(~rst), .CLK_Out1(clk_out_1), .CLK_Out2(clk_out_2), .CLK_Out3(clk_out_3));

de_jump de_left (.Din(~IN_left),.Dout(de_L),.clk(clk_out_1),.reset(~rst));  //���s���u��
de_jump de_right(.Din(~IN_right),.Dout(de_R),.clk(clk_out_1),.reset(~rst)); //���s���u��

FSM_Main_pinpon Main_FSM_1(.In_left_go(de_L),.In_right_go(de_R),.CNT_left_go(CNT_left),.CNT_right_go(CNT_right),.led_light(led_pinpon),
									.clk_fast(clk_out_2),.clk_slow(divclk_been),.rst_n(~rst));

Mux2to1_8bit Mux2to1_forCNT(.in_A(led_pinpon),.in_B(CNT_in),.sel(Sel_IN),.Mux_out(Mux2_pinpon_out)); // in_A�y�Ain_B����
				
									
div div_1(.divclk_1(clk_out_1),.divclk_2(clk_out_2),.divclk_3(clk_out_3),.clk(clk),.rst(~rst));  //���W[0]�B[1]�B[5]
div_ch Div_radon(.divclk_c1(divclk_c1),.divclk_c2(divclk_c2),.divclk_c3(divclk_c3),.divclk_c4(divclk_c4),.divclk_c5(divclk_c5),
                    .clk(clk),.rst(~rst),.LED_Lin({led_pinpon[0]}),.LED_Rin({led_pinpon[7]}),.Randon_out(Randon_out));

Mux2to1_forRandon Mux_ch(.in_A(clk_out_3),.in_B(divclk_ran),.sel(Sel_CH),.Mux_out(divclk_been)); // in_A�y�Ain_B����

Mux5to1_forRandon M5(.in_A(divclk_c1),.in_B(divclk_c2),.in_C(divclk_c3),.in_D(divclk_c4),.in_E(divclk_c5),.sel_Randon(Randon_out),.Mux_out(divclk_ran));



//mux_sel m1(.in_cnt_R(CNT_right),.in_cnt_L(CNT_left),.sel(sel),.rst(~rst),.cnt_out(CNT_seg7));
//seg7 seg7_1(.seg7_out(seg7_out),.seg7_in(CNT_seg7));  //�C�q��ܾ��G�p����[�����1.2�ӭ�]�B�p�ɾ�[�����3.4�ӭ�]
//seg7out_switch S1(.seg7_selected(seg7_outselect),.seg7outvalue(s1_seg7),.in0(CNT_left),  //�ֳt���y7�q��ܾ��A��4�ӼƦr����e�{ CNT_R:IN1 CNT_L:IN2
//					.in1(CNT_right),.clk(clk_out_1),.rst(rst));


endmodule


