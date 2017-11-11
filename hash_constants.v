`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 04:28:34 AM
// Design Name: 
// Module Name: constants
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


module hash_constants (
    input wire  [1:0]  mode,
    output wire [31:0] H0, H1, H2, H3, H4, H5, H6, H7
);
// Temporal registers
reg [31:0] tmp_H0, tmp_H1, tmp_H2, tmp_H3, tmp_H4, tmp_H5, tmp_H6, tmp_H7;
// Assignment
assign H0 = tmp_H0;
assign H1 = tmp_H1;
assign H2 = tmp_H2;
assign H3 = tmp_H3;
assign H4 = tmp_H4;
assign H5 = tmp_H5;
assign H6 = tmp_H6;
assign H7 = tmp_H7;


always @*
    begin : mode_mux
      case(mode)
        0:
          begin
            // SHA-256
            tmp_H0 = 32'h6a09e667;
            tmp_H1 = 32'hbb67ae85;
            tmp_H2 = 32'h3c6ef372;
            tmp_H3 = 32'ha54ff53a;
            tmp_H4 = 32'h510e527f;
            tmp_H5 = 32'h9b05688c;
            tmp_H6 = 32'h1f83d9ab;
            tmp_H7 = 32'h5be0cd19;
            end
        endcase // case (addr)
    end // block: mode_mux
endmodule

