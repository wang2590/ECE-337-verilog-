// $Id: $
// File name:   flex_counter.sv
// Created:     1/31/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: ls

module flex_counter
#(
	NUM_CNT_BITS = 4
)
(
	input wire clk, n_rst, clear, count_enable, [NUM_CNT_BITS-1:0] rollover_val,
	output wire [NUM_CNT_BITS-1:0] count_out,
	output reg rollover_flag
);
	reg [NUM_CNT_BITS-1:0]input_count;
	reg [NUM_CNT_BITS-1:0]output_count;
	reg input_flag;
	reg output_flag;
	
	assign count_out = output_count;
	assign rollover_flag = output_flag;	

	always_ff @ (posedge clk, negedge n_rst)
	begin
	  if(n_rst == 0)
	  begin
	    output_count <= '0;
	    output_flag <= '0;
	  end

	  else
	  begin
	    output_count <= input_count;
	    output_flag <= input_flag;
	  end
	end


	always_comb
	begin
 		input_flag = 1'b0;
	      	input_count = output_count;

	  if(clear == 1)
	  begin
	 	input_count = '0;
	  	input_flag = '0;
	  end

	  else
	  begin
	  	if(count_enable == 1)
	    	  begin
		     input_flag = 1'b0;
    		        if(input_count == rollover_val)	
	 		     input_count = 4'b0001;
	   		else
		  	input_count = output_count + 1;
	   
		  	if(input_count == rollover_val)
	      		begin	
	      			input_flag = 1'b1;
	    	  	end
          	end


	end
  end
endmodule
