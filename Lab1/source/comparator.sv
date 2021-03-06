// Verilog for ECE337 Lab 1
// The Following code is used to compare 2 16-bit quantites, a and b. The code 
// determines whether or not:
// a is greater than b, gt = 1, lt = 0, eq = 0
// a is less than b, gt = 0, lt = 1, eq = 0
// a is equal to b, gt = 0, lt = 0, eq = 1

// Use a tab size of 2 spaces for best viewing results


module comparator
(
	input wire [15:0] a,
	input wire [15:0] b,
	output reg gt,
	output reg lt,
	output reg eq
);

	//reg gte;
	///reg lte;
	//reg GT, LT, EQ;

	always @ (a, b) begin: COM
		gt = 0;
		lt = 0;
		eq = 0;
		if (a > b) begin
			gt = 1'b1;
			lt = 1'b0;
			eq = 1'b0;
		end
		if(a < b) begin
			gt = 1'b0;
			lt = 1'b1;
			eq = 1'b0;
		end
		if(a == b) begin
			gt = 1'b0;
			lt = 1'b0;
			eq = 1'b1;
		end
	end
//assign gt = GT;
//assign lt = LT;
//assign eq = EQ;
endmodule