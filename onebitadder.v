`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2017 02:33:50 AM
// Design Name: 
// Module Name: onebitadder
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


module onebitadder(
    input [0:0] x,  //onebit input
    input [0:0] y,  // onebit input
    input [0:0] c_in1, //cin 
    output [0:0] sum1, // one bit sum
    output [0:0] cout1 // onebit carryout
    );
    reg sum1, cout1 ;
    always @(*)

    {cout1, sum1}= x+y+c_in1 ;
endmodule

