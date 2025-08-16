`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ayush Aman
// 
// Create Date: 16.08.2025 10:01:01
// Design Name: 
// Module Name: asynchronous_fifo
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


module asynchronous_fifo (output [15:0] rd_data,
			  output full,
			  output empty,
			  input [15:0] wrt_data,
			  input wrt_en, wrt_clk, wrt_rst_n,
			  input rd_en, rd_clk, rd_rst_n);
	
	wire [6:0] wrt_addr, rd_addr;
	wire [7:0] wrt_ptr, rd_ptr, wq2_rd_ptr, rq2_wrt_ptr;

	sync_rd_2_wrt srw (wq2_rd_ptr, rd_ptr, wrt_clk, wrt_rst_n);

	sync_wrt_2_rd swr (rq2_wrt_ptr, wrt_ptr, rd_clk, rd_rst_n);

	fifo_mem fm (rd_data, wrt_data, wrt_addr, rd_addr, wrt_en, full, wrt_clk);

	rd_ptr_empty re (empty, rd_addr, rd_ptr, rq2_wrt_ptr, rd_en, rd_clk, rd_rst_n);

	wrt_ptr_full wf (full, wrt_addr, wrt_ptr, wq2_rd_ptr, wrt_en, wrt_clk, wrt_rst_n);

endmodule

