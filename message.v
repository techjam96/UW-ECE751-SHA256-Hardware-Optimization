`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2017 07:36:37 PM
// Design Name: 
// Module Name: message
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

// include functions for calculating sigma
`include "functions.v"

module message(
    input wire clk,
    //input rst,
    input wire [511:0] block_i,
             input wire busy_i,
             input wire load_i,
    output wire [31:0] w_out
    );
    // Interal Registers and Signals
    
    // Input register (memory)
    reg [31:0] w_mem[0:15];
    // 32b Registers for 15 memory blocks(shifts)   
    reg [31:0] w_mem00_new, w_mem01_new, w_mem02_new, w_mem03_new, w_mem04_new, w_mem05_new, w_mem06_new, w_mem07_new; 
    reg [31:0] w_mem08_new, w_mem09_new, w_mem10_new, w_mem11_new ,w_mem12_new, w_mem13_new, w_mem14_new, w_mem15_new;
    // New input
    reg[31:0] w_new;
    // Hash values
    reg[31:0] h0, h1, h2, h0_new, h1_new;
    
    // BEGIN
always @(posedge clk)
    begin    
        w_mem[00] <= w_mem00_new;
        w_mem[01] <= w_mem01_new;
        w_mem[02] <= w_mem02_new;
        w_mem[03] <= w_mem03_new;
        w_mem[04] <= w_mem04_new;
        w_mem[05] <= w_mem05_new;
        w_mem[06] <= w_mem06_new;
        w_mem[07] <= w_mem07_new;
        w_mem[08] <= w_mem08_new;
        w_mem[09] <= w_mem09_new;
        w_mem[10] <= w_mem10_new;
        w_mem[11] <= w_mem11_new;
        w_mem[12] <= w_mem12_new;
        w_mem[13] <= w_mem13_new;
        w_mem[14] <= w_mem14_new;
        w_mem[15] <= w_mem15_new;
        // what is this????           
        h0 <= h0_new;
        h1 <= h1_new;
    end
    // assigning the output of the message scheduler
    assign w_out = w_mem[0];
     
always @*
    begin : W_update
        // DFF to hold the memory used for calculations
        reg[31:0] w00, w01, w09, w14,sigma1, sigma0;    
        // good code pratice to initilize to zero.
        w_mem00_new = 0;
        w_mem01_new = 0;
        w_mem02_new = 0;
        w_mem03_new = 0;
        w_mem04_new = 0;
        w_mem05_new = 0;
        w_mem06_new = 0;
        w_mem07_new = 0;
        w_mem08_new = 0;
        w_mem09_new = 0;
        w_mem10_new = 0;
        w_mem11_new = 0;
        w_mem12_new = 0;
        w_mem13_new = 0;
        w_mem14_new = 0;
        w_mem15_new = 0;

        // initiale values for calculations
        w00 = w_mem[00];  //01
        w01 = w_mem[01];  //02
        w09 = w_mem[09];  //10
        w14 = w_mem[14]; // 15
        // Sigma functions defined by SHA256 algorithm
        //sigma1 = s1(w14);
        //sigma0 = s0(w1);
        // the value going into mux
        //w_new = sigma1 + w9 + sigma0 + w0;
        w_new = h0 + h1;
     
    if(load_i)
        begin
            w_mem00_new = block_i[511:480];
            w_mem01_new = block_i[479:448];
            w_mem02_new = block_i[447:416];
            w_mem03_new = block_i[415:384];
            w_mem04_new = block_i[383:352];
            w_mem05_new = block_i[351:320];
            w_mem06_new = block_i[319:288];
            w_mem07_new = block_i[287:256];
            w_mem08_new = block_i[255:224];
            w_mem09_new = block_i[223:192];
            w_mem10_new = block_i[191:160];
            w_mem11_new = block_i[159:128];
            w_mem12_new = block_i[127:96];
            w_mem13_new = block_i[95:64];
            w_mem14_new = block_i[63:32];
            w_mem15_new = block_i[31:0];
            // intermedite values
            w00 = block_i[511:480];
            w01 = block_i[479:448];
            w09 = block_i[223:192];
            w14 = block_i[63:32];
        end
        else if(busy_i)
            begin
            w_mem00_new = w_mem[01];
            w_mem01_new = w_mem[02];
            w_mem02_new = w_mem[03];
            w_mem03_new = w_mem[04];
            w_mem04_new = w_mem[05];
            w_mem05_new = w_mem[06];
            w_mem06_new = w_mem[07];
            w_mem07_new = w_mem[08];
            w_mem08_new = w_mem[09];
            w_mem09_new = w_mem[10];
            w_mem10_new = w_mem[11];
            w_mem11_new = w_mem[12];
            w_mem12_new = w_mem[13];
            w_mem13_new = w_mem[14];
            w_mem14_new = w_mem[15];
            // set to the new incomming value, we calculated above
            w_mem15_new = w_new;

         end
         
         // use the functions in function.v
         sigma0 = {w01[ 6: 0], w01[31: 7]} ^ {w01[17: 0], w01[31:18]} ^ {3'h0, w01[31: 3]};
         sigma1 = {w14[16: 0], w14[31:17]} ^ {w14[18: 0], w14[31:19]} ^ {10'h0, w14[31:10]};
         
         h0_new = sigma0 + w00;
         h1_new = sigma1 + w09;
     end

endmodule

