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
reg [3:0] results [3:0];

reg reset = 1'b0;
reg clk = 1'b0;

wire [3:0] y_dmx1 [3:0];


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
    .y(y_dmx1)
);

genvar i;

generate
    for(i=0; i<4;i = i+1)begin : reg_loop
        
        FourBitRegister register(
            .data(y_dmx1[i]),
            .load(1'b1),
            .inc(1'b0),
            .clk(clk),
            .reset(reset),
            .q(results[i])
        );



    end
endgenerate




endmodule
