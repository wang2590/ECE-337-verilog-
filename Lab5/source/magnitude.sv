// $Id: $
// File name:   magnitude.sv
// Created:     2/15/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
module magnitude
(
	input wire [16:0] in,
	output wire [15:0] out
);

wire msb;
wire [16:0] compliment;


assign msb = in[16];
assign compliment = ~(in - 1'b1);
assign out = (msb == 1'b0) ? in[15:0] : compliment[15:0]; 

endmodule
