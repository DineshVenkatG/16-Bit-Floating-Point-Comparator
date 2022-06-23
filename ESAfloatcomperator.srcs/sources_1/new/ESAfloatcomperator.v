`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2022 19:45:22
// Design Name: 
// Module Name: ESAfloatcomperator
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


module sign_comp(a, b, eq, gt, lt);
input a,b;
output eq,gt,lt;
reg eq,gt,lt;

always @(a or b)
begin
eq=0; gt=0; lt=0;

if(a==b)
eq=1; // a=b

else if (a>b)
lt=1; // a<b

else
gt=1; // a>b
end
endmodule
//////////////////////////////////////////////////////////////////////
module exp_comp(a,b,eq,gt,lt);
input [3:0] a,b;
output eq,gt,lt;
reg eq,gt,lt;

always @(a or b)
begin
eq=0; gt=0; lt=0;

if(a==b)
eq=1; // a=b

else if (a>b)
gt=1; // a>b

else
lt=1; // a<b
end

endmodule
//////////////////////////////////////////////////////////////////////
module man_comp(a,b,eq,gt,lt);
input [10:0] a,b;
output eq,gt,lt;
reg eq,gt,lt;

always @(a or b)
begin
eq=0; gt=0; lt=0;

if(a==b)
eq=1; // a=b

else if (a>b)
gt=1; // a>b

else
lt=1; // a<b
end

endmodule
//////////////////////////////////////////////////////////////////////
module ESAfloatcomperator(input [15:0]a,b, output [2:0]aopb); // main module

wire a_sgn,b_sgn;
wire [3:0]a_exp,b_exp;
wire [10:0]a_man,b_man;
wire sgn_ls,sgn_eq,sgn_gr;
wire exp_eq, exp_gr, exp_ls;
wire man_eq, man_gr, man_ls;
wire t1,t2,t3,t4;



assign a_sgn=a[15];
assign b_sgn=b[15];
assign a_exp=a[14:11];
assign b_exp=b[14:11];
assign a_man=a[10:0];
assign b_man=b[10:0];

sign_comp g3(a_sgn,b_sgn, sgn_eq, sgn_gr, sgn_ls);
exp_comp g4(a_exp, b_exp, exp_eq, exp_gr, exp_ls);
man_comp g5(a_man, b_man, man_eq, man_gr, man_ls);

and g6(t1, exp_gr, sgn_eq);
and g7(t2, man_gr, exp_eq, sgn_eq);
or g8(aopb[1], sgn_gr, t1, t2);  // a>b

and g9(aopb[2], exp_eq, man_eq, sgn_eq);// a=b

and g10(t3, exp_ls, sgn_eq);
and g11(t4, man_ls, exp_eq, sgn_eq);
or g12(aopb[0], sgn_ls, t3, t4);// a<b




endmodule
/////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////
