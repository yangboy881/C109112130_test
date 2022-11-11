`timescale 1ns / 1ps


module Div_web( CLK, RST, CLK_Out1, CLK_Out2, CLK_Out3); /* ���W�� Use 100MHz OSC */

    // ���W�]�w  1kHz 1ms
    parameter    Div1   = 17'd100_000;  // ���W��(Even) ���u��
    parameter    Div1_2 = 17'd50_000;  // Div/2
    parameter    Div2   = 22'd25_000_000;  // ���W��(Even) 1/4��
    parameter    Div2_2 = 22'd12_500_000;  // Div/2
    parameter    Div3   = 24'd100_000_000;  // ���W��(Even) 1��
    parameter    Div3_2 = 24'd50_000_000;  // Div/2
    parameter    DivW_1   = 17;          // Divide�e��
    parameter    DivW_2   = 22;
    parameter    DivW_3   = 24;
       

    input   CLK, RST;
    output  CLK_Out1,CLK_Out2,CLK_Out3;
    reg     CLK_Out1,CLK_Out2,CLK_Out3;
    reg     [ DivW_1-1:0] CLK_Cnt1 = 0;
    reg     [ DivW_2-1:0] CLK_Cnt2 = 0;
    reg     [ DivW_3-1:0] CLK_Cnt3 = 0;
    
begin   //  Div1���W
    always @( posedge CLK, negedge RST ) begin
        if( !RST )
            CLK_Cnt1 <= 0;
        else if( CLK_Cnt1 == Div1-1 )
            CLK_Cnt1 <= 0;
        else
            CLK_Cnt1 <= CLK_Cnt1 + 1'b1;
    end
    
    always @( posedge CLK or negedge RST ) begin // ���W 1s
        if( !RST )
            CLK_Out1 <= 1'b0;
        else if( CLK_Cnt1 <= Div1_2-1 )
            CLK_Out1 <= 1'b0;
        else
            CLK_Out1 <= 1'b1;
    end
end

begin   //  Div2���W
    always @( posedge CLK, negedge RST ) begin
        if( !RST )
            CLK_Cnt2 <= 0;
        else if( CLK_Cnt2 == Div2-1 )
            CLK_Cnt2 <= 0;
        else
            CLK_Cnt2 <= CLK_Cnt2 + 1'b1;
    end
    
    always @( posedge CLK or negedge RST ) begin // ���W 1s
        if( !RST )
            CLK_Out2 <= 1'b0;
        else if( CLK_Cnt2 <= Div2_2-1 )
            CLK_Out2 <= 1'b0;
        else
            CLK_Out2 <= 1'b1;
    end
end

begin   //  Div3���W
    always @( posedge CLK, negedge RST ) begin
        if( !RST )
            CLK_Cnt3 <= 0;
        else if( CLK_Cnt3 == Div3-1 )
            CLK_Cnt3 <= 0;
        else
            CLK_Cnt3 <= CLK_Cnt3 + 1'b1;
    end
    
    always @( posedge CLK or negedge RST ) begin // ���W 1s
        if( !RST )
            CLK_Out3 <= 1'b0;
        else if( CLK_Cnt3 <= Div3_2-1 )
            CLK_Out3 <= 1'b0;
        else
            CLK_Out3 <= 1'b1;
    end
end

endmodule