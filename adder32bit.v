`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2017 02:36:26 AM
// Design Name: 
// Module Name: adder32bit
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


module adder32bit(
    input [31:0] in1, //input1
    input [31:0] in2, //input2
    output [31:0] sum //sum[31:0] is the 32bit modulo adder result
    );
    wire carry[30:0];
    reg[0:0] i=0; //first cin will be zero 
    reg[0:0] carryout; // last carryout discarded due to modulo addition
 onebitadder a0 (in1[0],in2[0],i,sum[0],carry[0]);
 onebitadder a1 (in1[1],in2[1],carry[0],sum[1],carry[1]);
 onebitadder a2 (in1[2],in2[2],carry[1],sum[2],carry[2]);
 onebitadder a3 (in1[3],in2[3],carry[2],sum[3],carry[3]);
 onebitadder a4 (in1[4],in2[4],carry[3],sum[4],carry[4]);
 onebitadder a5 (in1[5],in2[5],carry[4],sum[5],carry[5]);
 onebitadder a6 (in1[6],in2[6],carry[5],sum[6],carry[6]);
 onebitadder a7 (in1[7],in2[7],carry[6],sum[7],carry[7]);
 onebitadder a8 (in1[8],in2[8],carry[7],sum[8],carry[8]);
 onebitadder a9 (in1[9],in2[9],carry[8],sum[9],carry[9]);
 onebitadder a10 (in1[10],in2[10],carry[9],sum[10],carry[10]);
 onebitadder a11 (in1[11],in2[11],carry[10],sum[11],carry[11]);
 onebitadder a12 (in1[12],in2[12],carry[11],sum[12],carry[12]);
 onebitadder a13 (in1[13],in2[13],carry[12],sum[13],carry[13]);
 onebitadder a14 (in1[14],in2[14],carry[13],sum[14],carry[14]);
 onebitadder a15 (in1[15],in2[15],carry[14],sum[15],carry[15]);
 onebitadder a16 (in1[16],in2[16],carry[15],sum[16],carry[16]);
 onebitadder a17 (in1[17],in2[17],carry[16],sum[17],carry[17]);
 onebitadder a18 (in1[18],in2[18],carry[17],sum[18],carry[18]);
onebitadder a19 (in1[19],in2[19],carry[18],sum[19],carry[19]);
 onebitadder a20 (in1[20],in2[20],carry[19],sum[20],carry[20]);
onebitadder a21 (in1[21],in2[21],carry[20],sum[21],carry[21]);
onebitadder a22 (in1[22],in2[22],carry[21],sum[22],carry[22]);
onebitadder a23 (in1[23],in2[23],carry[22],sum[23],carry[23]);
onebitadder a24 (in1[24],in2[24],carry[23],sum[24],carry[24]);
onebitadder a25 (in1[25],in2[25],carry[24],sum[25],carry[25]);
onebitadder a26 (in1[26],in2[26],carry[25],sum[26],carry[26]);
onebitadder a27 (in1[27],in2[27],carry[26],sum[27],carry[27]);
onebitadder a28 (in1[28],in2[28],carry[27],sum[28],carry[28]);
onebitadder a29 (in1[29],in2[29],carry[28],sum[29],carry[29]);
onebitadder a30 (in1[30],in2[30],carry[29],sum[30],carry[30]);
onebitadder a31 (in1[31],in2[31],carry[30],sum[31],carryout);
endmodule

