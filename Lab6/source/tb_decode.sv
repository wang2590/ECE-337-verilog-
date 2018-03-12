// $Id: $
// File name:   tb_decode.sv
// Created:     2/21/2018
// Author:      Shutao Wang
// Lab Section: 04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 100ps

module tb_decode();

	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY = 1;

	reg tb_clk;
    	reg tb_n_rst;
    	reg tb_d_plus;
	reg tb_shift_enable;
	reg tb_eop;
	reg tb_d_orig;

	decode DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus),
		.shift_enable(tb_shift_enable),
		.eop(tb_eop),
		.d_orig(tb_d_orig)	
	);

	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	initial
    begin
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		tb_n_rst = 1'b0;
		@(posedge tb_clk);

		//TEST CASE 1
    		tb_n_rst = 1'b0;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		
		@(posedge tb_clk);
		

		//TEST CASE 2
    	tb_n_rst = 1'b1;
    	tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		
		@(posedge tb_clk);
	
		//TEST CASE 3
    	tb_n_rst = 1'b1;
    	tb_d_plus = 1'b0;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		
		@(posedge tb_clk);
		
		
		//TEST CASE 4
    	tb_n_rst = 1'b1;
    	tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b1;
		
		@(posedge tb_clk);
		
		//TEST CASE 5
    	tb_n_rst = 1'b0;
    	tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b1;
		
		@(posedge tb_clk);
		
		
    end
endmodule












