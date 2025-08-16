`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ayush Aman
// 
// Create Date: 16.08.2025 10:02:35
// Design Name: 
// Module Name: sync_wrt_2_rd
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


module sync_wrt_2_rd (output reg [7:0] rq2_wrt_ptr,
		      input [7:0] wrt_ptr,
		      input rd_clk, rd_rst_n);
				 
	reg [7:0] temp_ptr;
	
	// 2 flop synchronizer for write point with respect to read clock
	always @(posedge rd_clk or negedge rd_rst_n)
		if (!rd_rst_n) 
			{rq2_wrt_ptr, temp_ptr} <= 0;
		else 
			{rq2_wrt_ptr, temp_ptr} <= {temp_ptr, wrt_ptr};
			
endmodule
