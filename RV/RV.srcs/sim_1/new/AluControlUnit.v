`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2026 05:02:04 PM
// Design Name: 
// Module Name: AluControlUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AluControlUnit(
    output reg [1:0] selMUX1,
    output reg [1:0] selMUX2,
    output reg [1:0] selDMX1,
    output reg [3:0] regCtrl,
    input start,
    input clk,
    input reset
);


parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter noS = 3'b111;

reg [2:0] state = noS;


always @(posedge clk or posedge reset)begin

    if(reset) begin 
        selMUX1 <= 2'b00;
        selMUX2 <= 2'b00;
        selDMX1 <= 2'b00;
        regCtrl <= 4'b0000;
        state <= noS;
        
    end
    else if (start && state == noS) begin 
        state <= S0;
        selMUX1 <= 2'b00;
        selMUX2 <= 2'b00;
        selDMX1 <= 2'b00;
        regCtrl <= 4'b0000;
    end
    else if (state == S0)begin
        state <=S1;
        selMUX1 <= 2'b00;
        selMUX2 <= 2'b00;
        selDMX1 <= 2'b00;
        regCtrl <= 4'b0001;

        
    end
    else if (state == S1)begin 
        state <= S2;
        selMUX1 <= 2'b01;
        selMUX2 <= 2'b01;
        selDMX1 <= 2'b01;
        regCtrl <= 4'b0010;
        
    end
    else if (state ==S2)begin 
        state <= S3;
        selMUX1 <= 2'b10;
        selMUX2 <= 2'b10;
        selDMX1 <= 2'b10;
        regCtrl <= 4'b0100;
    end
    else if(state==S3)begin 
        state <= S4;
        selMUX1 <= 2'b11;
        selMUX2 <= 2'b11;
        selDMX1 <= 2'b11;
        regCtrl <= 4'b1000;
    end
    else if(state== S4)begin 
        state <= noS;
        selMUX1 <= 2'b00;
        selMUX2 <= 2'b00;
        selDMX1 <= 2'b00;
        regCtrl <= 4'b0000;
    end


end





endmodule
