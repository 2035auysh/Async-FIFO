`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ayush Aman
// 
// Create Date: 16.08.2025 10:01:49
// Design Name: 
// Module Name: rd_ptr_empty
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


module rd_ptr_empty (output reg empty,
		     output [6:0] rd_addr,
		     output reg [7:0] rd_ptr,
		     input [7:0] rq2_wrt_ptr,
		     input rd_en, rd_clk, rd_rst_n);
	
	reg [7:0] rd_bin;
	wire [7:0] rd_gray_next, rd_bin_next;
	wire empty_val;
	
	// Gray Style 2 pointer (both gray code and binary code registers are present)
	always @(posedge rd_clk or negedge rd_rst_n)
		if (!rd_rst_n) 
			{rd_bin, rd_ptr} <= 0;
		else 
			{rd_bin, rd_ptr} <= {rd_bin_next, rd_gray_next};
	
	assign rd_bin_next = rd_bin + (rd_en & ~empty);
	assign rd_gray_next = (rd_bin_next>>1) ^ rd_bin_next;
	
	// Memory read-address pointer (binary is used to address memory)
	assign rd_addr = rd_bin[6:0];
	
	// FIFO empty when the next rd_ptr == synchronized wrt_ptr or on reset
	assign empty_val = (rd_gray_next == rq2_wrt_ptr);
	
	always @(posedge rd_clk or negedge rd_rst_n)
		if (!rd_rst_n)
			empty <= 1'b1;
		else 
			empty <= empty_val;
	
endmodule

