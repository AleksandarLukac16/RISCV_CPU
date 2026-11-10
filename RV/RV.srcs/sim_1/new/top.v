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
wire [3:0] results [3:0];
wire [1:0]  selDMX1;
wire [3:0] regCtrl;

reg reset = 1'b0;
reg clk = 1'b0;

wire [3:0] y_dmx1 [3:0];
reg start = 1'b0;


always #5 clk = ~clk;

initial begin 

    a[0] = 4'b0001;
    a[1] = 4'b0010;
    a[2] = 4'b0011;
    a[3] = 4'b0100;
    a[4] = 4'b0101;
    a[5] = 4'b0110;
    a[6] = 4'b0111;
    a[7] = 4'b1000;
    cin = 1'b0;
    
    #10 start = 1'b1;
    $display("Starting simulation...");
    #10 start = 1'b0;
    #100
    $display("results[0] = %b", results[0]);
    $display("results[1] = %b", results[1]);
    $display("results[2] = %b", results[2]);
    $display("results[3] = %b", results[3]);
    
    #10 $finish;

end




AluControlUnit aluControlUnit(
    .selMUX1(selMUX1),
    .selMUX2(selMUX2),
    .selDMX1(selDMX1),
    .regCtrl(regCtrl),
    .start(start),
    .clk(clk),
    .reset(reset)
);


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
    .sel(selDMX1),
    .y1(y_dmx1[0]),
    .y2(y_dmx1[1]),
    .y3(y_dmx1[2]),
    .y4(y_dmx1[3])
);

genvar i;

generate
    for(i=0; i<4;i = i+1)begin : registers
        
        FourBitRegister register(

            .data(y_dmx1[i]),
            .load(regCtrl[i]),
            .inc(1'b0),
            .clk(clk),
            .reset(reset),
            .q(results[i])
        );



    end
endgenerate




endmodule
