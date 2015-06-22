

module ROM
(
	input  wire[9:0]  		iAddress,
	output reg [15:0] 		oInstruction
);	
reg [15:0] Memory [10:0];
initial $readmemh("instructions.txt",Memory);
always @ ( iAddress )
begin
	oInstruction=Memory[iAddress];
end
	
endmodule
