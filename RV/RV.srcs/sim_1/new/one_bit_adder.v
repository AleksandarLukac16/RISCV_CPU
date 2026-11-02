`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2026 05:15:47 PM
// Design Name: 
// Module Name: one_bit_adder
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


module one_bit_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );


    assign sum = a^b^cin;
    assign cout = (a&b) | (b&cin) | (a&cin);



endmodule
