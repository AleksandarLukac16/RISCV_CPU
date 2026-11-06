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
    output reg [3:0] y [3:0]

    );


    always @(*)begin

        case(sel)
        
            2'b00: y[0]=a;
            2'b01: y[1]=a;
            2'b10: y[2]=a;
            2'b11: y[3]=a;


        default: y[0]=4'b0000;
        endcase


    end
endmodule
