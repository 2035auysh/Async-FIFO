`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ayush Aman
// 
// Create Date: 16.08.2025 10:03:22
// Design Name: 
// Module Name: testbench
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


`timescale 1ns/1ns

module testbench;

	reg [15:0] wrt_data;
	reg wrt_en, wrt_clk, wrt_rst_n;
	reg rd_en, rd_clk, rd_rst_n;
	wire [15:0] rd_data;
	wire full, empty;
	
	integer i;
	
	asynchronous_fifo fifo (rd_data,
				full,
				empty,
			        wrt_data,
			   	wrt_en,
				wrt_clk,
				wrt_rst_n,
			   	rd_en,
				rd_clk,
				rd_rst_n);
	
	always
	begin
		rd_clk = ~rd_clk; 
		#25;
	end
	
	always
	begin
		wrt_clk = ~wrt_clk;
		#10;
	end
	
	initial
	begin
		rd_clk = 0;
		wrt_clk = 0;
		rd_rst_n = 0;
		wrt_rst_n = 0;
		wrt_en = 0;
		rd_en = 0;
		#120;
		
		rd_rst_n = 1;
		wrt_rst_n = 1;
		#30;
		
		//wrt_data = 420;
		wrt_en = 1;
		rd_en = 1;
		//#20;
		for (i=1; i<207; i=i+1)
		begin
			wrt_data = i;
			#20;
		end
		wrt_en = 0;
		
		#6200;
		
		//wrt_data = 619;
		wrt_en = 1;
		//#20;
		for (i=1; i<207; i=i+1)
		begin
			wrt_data = 2*i + 3*i*i + 5;
			#20;
		end
		wrt_en = 0;
		
		#6200;
		
		//wrt_data = 2035;
		wrt_en = 1;
		//#20;
		for (i=1; i<207; i=i+1)
		begin
			wrt_data = i;
			#20;
		end
		wrt_en = 0;
		
		#6200;
		$stop;
	end
endmodule
