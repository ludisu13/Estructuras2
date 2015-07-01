`timescale 1ns / 1ps

module MEMORY	 # ( parameter DATA_WIDTH= 8, parameter ADDR_WIDTH=10, parameter MEM_SIZE=10 )
(
	input wire						Clock,
	input wire						iWriteEnable,
	input wire[ADDR_WIDTH-1:0]		iAddress,
	input wire[ADDR_WIDTH-1:0]	iReadAddress,
	input wire						iReadtoa,
	input wire						iReadtob,
	input wire[DATA_WIDTH-1:0]		 iDataIn,
	output reg [DATA_WIDTH-1:0] 	oDataOuta,
	output reg [DATA_WIDTH-1:0] 	oDataOutb
);

reg [DATA_WIDTH-1:0] Memory [MEM_SIZE:0];		

always @(posedge Clock) 
begin 
	
		if (iWriteEnable && !iReadtoa && !iReadtob) 
			Memory[iAddress] <= iDataIn; 
		else if (!iWriteEnable && iReadtoa && !iReadtob)	
			oDataOuta <= Memory[iReadAddress]; 
		else if (!iWriteEnable && !iReadtoa && iReadtob)	
			oDataOutb <= Memory[iReadAddress];  
		else
			oDataOuta <= 8'b0;
			oDataOutb <= 8'b0;
		
end 
endmodule

