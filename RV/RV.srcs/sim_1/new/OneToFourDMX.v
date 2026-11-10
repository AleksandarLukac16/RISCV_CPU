`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2026 06:41:07 PM
// Design Name: 
// Module Name: OneToFourDMX
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


module OneToFourDMX(
    input [3:0]a,
    input [1:0] sel,
    output reg [3:0] y1 ,
    output reg [3:0] y2 ,
    output reg [3:0] y3 ,
    output reg [3:0] y4

    );


    always @(*)begin

        case(sel)
        
            2'b00: y1=a;
            2'b01: y2=a;
            2'b10: y3=a;
            2'b11: y4=a;
                
        endcase


    end
endmodule
