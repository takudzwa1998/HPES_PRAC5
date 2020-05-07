`timescale 1ns / 1ps


module tb_top();


    reg  CLK100MHZ_tb;
    reg [7:0] SW_tb;
    integer address = 0;
    wire AUD_PWM_tb; 
    wire AUD_SD_tb;
    wire [2:0] LED_tb;
    reg PWM=0;
    reg output_audio=0;
    
    top uut(.CLK100MHZ(CLK100MHZ_tb), .SW(SW_tb), .AUD_PWM(AUD_PWM_tb), .AUD_SD(AUD_SD_tb), .LED(LED_tb));
    
    initial begin
    
        CLK100MHZ_tb=1;SW_tb=0;
        uut.ena = 1;
        uut.wea = 0;
        uut.dina = 0;
        uut.addra = 0;
        
    end
    
    always begin
        CLK100MHZ_tb = ~CLK100MHZ_tb;
        #1;
    end
    
    
    always@(posedge uut.CLK100MHZ)begin
       uut.PWM<=uut.douta;
       uut.addra <= uut.addra + 1;
       PWM<=uut.PWM;
       output_audio<=uut.AUD_PWM;
    end
endmodule