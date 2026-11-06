`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2026 06:51:07 PM
// Design Name: 
// Module Name: top
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


module top;
    
reg [3:0] a [7:0];
reg cin;
wire [3:0] result;
wire cout;
wire [3:0] y_mux1;
wire [1:0] selMUX1;
wire [1:0] selMUX2;


initial begin


end

FourToOneMUX mux1
(
    .a0(a[0]),
    .a1(a[1]),
    .a2(a[2]),
    .a3(a[3]),
    .sel(selMUX1),
    .y(y_mux1)
);

wire [3:0] y_mux2;

FourToOneMUX mux2
(
    .a0(a[4]),
    .a1(a[5]),
    .a2(a[6]),
    .a3(a[7]),
    .sel(selMUX2),
    .y(y_mux2)
);



four_bit_adder adder(
    .a(y_mux1),
    .b(y_mux2),
    .cin(cin),
    .sum(result),
    .cout(cout)
);

OneToFourDMX dmx1(
    .a(result),
    .sel(selMUX1),
    .y(y_mux1)
);




endmodule
