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
    
reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] result;
wire cout;


initial begin
a = 4'b1111;
b = 4'b0000;
cin = 1'b1;

$display("a=%b, b=%b, cin=%b, result=%b, cout=%b", a, b, cin, result, cout);

end

four_bit_adder adder(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(result),
    .cout(cout)
);




endmodule
