`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 12:20:42 AM
// Design Name: 
// Module Name: w_mem
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

//module w_mem(
//    input clk,
//    input rst,
//    input [2:0] w_in,
//    output [2:0] w_out
//    );
//endmodule
//////////////////////////////////////////////////////////////////////////////////
//
// ROMs Using Block RAM Resources.
// Verilog code for a ROM with registered output (template 1)
// page 320 of XST HDL Coding techniques
//module v_rams_21a (clk, en, addr, data);
module k_constants (clk, en, addr, data);
    input clk;
    input en; 
    input [5:0] addr;
    output reg [31:0] data;
    
  always @(posedge clk) begin
    if (en)
     case(addr)
        6'b000000: data <= 32'h428a2f98;   6'b100000: data <= 32'h27b70a85;
        6'b000001: data <= 32'h71374491;   6'b100001: data <= 32'h2e1b2138;
        6'b000010: data <= 32'hb5c0fbcf;   6'b100010: data <= 32'h4d2c6dfc;
        6'b000011: data <= 32'he9b5dba5;   6'b100011: data <= 32'h53380d13;
        6'b000100: data <= 32'h3956c25b;   6'b100100: data <= 32'h650a7354;
        6'b000101: data <= 32'h59f111f1;   6'b100101: data <= 32'h766a0abb;
        6'b000110: data <= 32'h923f82a4;   6'b100110: data <= 32'h81c2c92e;
        6'b000111: data <= 32'hab1c5ed5;   6'b100111: data <= 32'h92722c85;
        6'b001000: data <= 32'hd807aa98;   6'b101000: data <= 32'ha2bfe8a1;
        6'b001001: data <= 32'h12835b01;   6'b101001: data <= 32'ha81a664b;
        6'b001010: data <= 32'h243185be;   6'b101010: data <= 32'hc24b8b70;
        6'b001011: data <= 32'h550c7dc3;   6'b101011: data <= 32'hc76c51a3;
        6'b001100: data <= 32'h72be5d74;   6'b101100: data <= 32'hd192e819;
        6'b001101: data <= 32'h80deb1fe;   6'b101101: data <= 32'hd6990624;
        6'b001110: data <= 32'h9bdc06a7;   6'b101110: data <= 32'hf40e3585;
        6'b001111: data <= 32'hc19bf174;   6'b101111: data <= 32'h106aa070;
        6'b010000: data <= 32'he49b69c1;   6'b110000: data <= 32'h19a4c116;
        6'b010001: data <= 32'hefbe4786;   6'b110001: data <= 32'h1e376c08;
        6'b010010: data <= 32'h0fc19dc6;   6'b110010: data <= 32'h2748774c;
        6'b010011: data <= 32'h240ca1cc;   6'b110011: data <= 32'h34b0bcb5;
        6'b010100: data <= 32'h2de92c6f;   6'b110100: data <= 32'h391c0cb3;
        6'b010101: data <= 32'h4a7484aa;   6'b110101: data <= 32'h4ed8aa4a;
        6'b010110: data <= 32'h5cb0a9dc;   6'b110110: data <= 32'h5b9cca4f;
        6'b010111: data <= 32'h76f988da;   6'b110111: data <= 32'h682e6ff3;
        6'b011000: data <= 32'h983e5152;   6'b111000: data <= 32'h748f82ee;
        6'b011001: data <= 32'ha831c66d;   6'b111001: data <= 32'h78a5636f;
        6'b011010: data <= 32'hb00327c8;   6'b111010: data <= 32'h84c87814;
        6'b011011: data <= 32'hbf597fc7;   6'b111011: data <= 32'h8cc70208;
        6'b011100: data <= 32'hc6e00bf3;   6'b111100: data <= 32'h90befffa;
        6'b011101: data <= 32'hd5a79147;   6'b111101: data <= 32'ha4506ceb;
        6'b011110: data <= 32'h06ca6351;   6'b111110: data <= 32'hbef9a3f7;
        6'b011111: data <= 32'h14292967;   6'b111111: data <= 32'hc67178f2;
    endcase
  end
 endmodule 