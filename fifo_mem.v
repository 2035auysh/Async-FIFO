`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ayush Aman
// 
// Create Date: 16.08.2025 10:01:28
// Design Name: 
// Module Name: fifo_mem
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

module fifo_mem (output [15:0] rd_data,
		 input [15:0] wrt_data,
		 input [6:0] wrt_addr, rd_addr,
		 input wrt_en, full, wrt_clk);

	// RTL Verilog memory model
	reg [15:0] mem [0:127];
	
	assign rd_data = mem [rd_addr];
	
	always @(posedge wrt_clk)
	begin
		if (wrt_en & (~full)) 
			mem [wrt_addr] <= wrt_data;
	end
	
endmodule

