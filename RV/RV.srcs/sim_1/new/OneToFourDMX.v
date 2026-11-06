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
    input a,
    input [1:0] sel,
    output reg [3:0] y

    );


    always @(*)begin

        case(sel)
        
            2'b00: y=4'b0001;
            2'b01: y=4'b0010;
            2'b10: y=4'b0100;
            2'b11: y=4'b1000;


        default: y=4'b0000;
        endcase


    end
endmodule
