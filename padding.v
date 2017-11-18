// Code your design here

module test(valid_digits,chars, data_block);
  parameter MAX_CHAR_CNT = 8; // max number of charaters for input, can be editted
  input [MAX_CHAR_CNT-1:0] valid_digits; 
  input [8*MAX_CHAR_CNT-1:0] chars;
  output reg [511:0] data_block; //output - padded message, 512 for sha-256
  
  wire [511:0] data_lines [MAX_CHAR_CNT-1:0];
  
  genvar i;
  integer x;
  
  generate
	for (i=0; i<MAX_CHAR_CNT; i=i+1) begin:DATA
      assign data_lines[i] = {chars[8*(i+1)-1:0], 8'h1, {(512-8*(2+i)){1'b0}}};
	end
  endgenerate
 
  always @(*) begin:CONN
    data_block = 0;
    for (x=0; x<MAX_CHAR_CNT; x=x+1) begin
		if (valid_digits == (9'b1<<(x+1))-1) data_block = data_lines[x];
//Data_block should be the input for the message scheduler
    end
  end
endmodule