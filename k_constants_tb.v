`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2017 01:51:10 AM
// Design Name: 
// Module Name: w_mem_tb
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

module k_constants_tb ();
//---------------------------------------------------------
 // inputs to the DUT are reg type
 reg clk_50;
 reg en_l; 
 reg [5:0] addr_in;
 // outputs from the DUT are wire type
 wire [31:0] addr_out;
 integer i;
 //---------------------------------------------------------
 // instantiate the Device Under Test (DUT)
 // using named instantiation
 k_constants U1 ( 
 .clk(clk_50),
 .en(en_l),
 .addr(addr_in),
 .data(addr_out)
 );
 //----------------------------------------------------------
 // create a 50Mhz clock
 always
 #10 clk_50 = ~clk_50; // every ten nanoseconds invert
 //-----------------------------------------------------------
 // initial blocks are sequential and start at time 0
 initial
 begin
 $display($time, " << Starting the Simulation >>");
 clk_50 = 1'b0; // at time 0
 //rst_l = 0; // reset is active
 en_l = 1'b1;
// #20 rst_l = 1'b1; // at time 20 release reset

 $display($time, " << Coming out of reset >>");

for (i=0; i<=64; i=i+1) begin
      @(posedge clk_50); 
      addr_in = i;
end
         
 //@(posedge clk_50); // wait till the negedge of clk_50 then continue
 //addr_in =  6'b000000;
 //@(posedge clk_50); // wait till the negedge of clk_50 then continue
 // addr_in =  6'b000001;
 //@(posedge clk_50); // wait till the negedge of clk_50 then continue
 // addr_in =  6'b000010;
 //@(posedge clk_50); // wait till the negedge of clk_50 then continue
 
 $display($time, " << Simulation Complete >>");
 $stop;
// stop the simulation after 1290 ns to read the full memory.
 end


 initial begin
 // $monitor will print whenever a signal changes
 // in the design
 $monitor($time, " clk_50=%b, en_l=%b, addr_in=%b, addr_out=%h,", clk_50, en_l,
addr_in, addr_out);
 end
endmodule //of w_mem_tb
