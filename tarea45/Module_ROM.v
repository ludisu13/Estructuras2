
//READ oNLY MEMORY, almacena el programa por ejecutar (para el procesador)  
module ROM
(
	input  wire[9:0]  		iAddress,
	output reg [15:0] 		oInstruction
);	
reg [15:0] Memory [9:0];
initial $readmemh("test.txt",Memory);
always @ ( iAddress )
begin
	oInstruction=Memory[iAddress];
end
	
endmodule
