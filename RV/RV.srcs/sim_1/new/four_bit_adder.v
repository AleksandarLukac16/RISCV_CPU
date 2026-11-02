`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2026 06:01:25 PM
// Design Name: 
// Module Name: four_bit_adder
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


module four_bit_adder(

    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout

    );


    wire cout0, cout1, cout2 ;

one_bit_adder adder0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(cout0)
    );

    one_bit_adder adder1(
        .a(a[1]),
        .b(b[1]),
        .cin(cout0),
        .sum(sum[1]),
        .cout(cout1)
    );
    one_bit_adder adder2(
        .a(a[2]),
        .b(b[2]),
        .cin(cout1),
        .sum(sum[2]),
        .cout(cout2)
    );

    one_bit_adder adder3(
        .a(a[3]),
        .b(b[3]),
        .cin(cout2),
        .sum(sum[3]),
        .cout(cout)
    );

endmodule
