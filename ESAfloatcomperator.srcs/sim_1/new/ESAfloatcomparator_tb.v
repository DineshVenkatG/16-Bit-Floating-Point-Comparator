`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2022 20:00:35
// Design Name: 
// Module Name: ESAfloatcomparator_tb
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


module float_comp;
reg [15:0]a,b; 
wire aeqb, agrb, alsb;

float_comparator g1(a,b,aeqb,agrb,alsb);

initial
begin
#2 a=16'h4f00; b=16'h4900;//a=7.5, b=4.5
#2 a=16'h4700; b=16'h47c0;//a=3.75, b=3.9375
#2 a=16'h7fff; b=16'h7fff;//a=511.875,b=511.875
#2 a=16'hd100; b=16'h0000;//a=-9,b=0
#2 a=16'hca20; b=16'h5040;//a=-5.0625,b=8.25
#2 a=16'h4700; b=16'h4700;//a=3.75,b=3.75
#2 a=16'hffff; b=16'h7fff;//a=-511.875,b=511.875
end

initial $monitor($time, "  a= %h, b= %h, A=B : %b, A>B : %b, A<B : %b ", a,b,aeqb,agrb,alsb);
initial #50 $stop;

endmodule

