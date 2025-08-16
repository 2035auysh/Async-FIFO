`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ayush Aman
// 
// Create Date: 16.08.2025 10:02:11
// Design Name: 
// Module Name: sync_rd_2_wrt
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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


module sync_rd_2_wrt (output reg [7:0] wq2_rd_ptr,
		      input [7:0] rd_ptr,
		      input wrt_clk, wrt_rst_n);
				 
	reg [7:0] temp_ptr;
	
	// 2 flop synchronizer for read point with respect to write clock
	always @(posedge wrt_clk or negedge wrt_rst_n)
		if (!wrt_rst_n) 
			{wq2_rd_ptr, temp_ptr} <= 0;
		else 
			{wq2_rd_ptr, temp_ptr} <= {temp_ptr, rd_ptr};
			
endmodule
