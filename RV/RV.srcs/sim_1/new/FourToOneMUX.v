`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2026 06:28:58 PM
// Design Name: 
// Module Name: FourToOneMUX
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


module FourToOneMUX(input [3:0] a0,
                    input [3:0] a1,
                    input [3:0] a2,
                    input [3:0] a3,
                    input [1:0] sel,
                    output reg [3:0] y
    );

    always @(*)
    begin
        case(sel)
            2'b00: y=a0;
            2'b01: y=a1;
            2'b10: y=a2;
            2'b11: y=a3;
            default: y=1'b0;
        endcase



    end



endmodule
