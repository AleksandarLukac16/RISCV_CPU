`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2026 08:46:19 PM
// Design Name: 
// Module Name: FourBitRegister
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


module FourBitRegister(
    input [3:0]data,
    input load,
    input inc,
    input clk,
    input reset,
    output reg [3:0]q

    );

    reg [3:0] q_next;

    //sequential logic
    always @(posedge clk or posedge reset)begin

        if(reset)begin
            q<=4'b0000;
        end
        else begin
            q<=q_next;
        end

    end

    //combinational logic

    always @(*)begin

        q_next = q;
        if(load)
            begin
                q_next = data;
            end
        else if(inc)
            begin
            q_next = q + 1;
        end



    end





endmodule
