<<<<<<< HEAD

//READ oNLY MEMORY, almacena el programa por ejecutar (para el procesador)  
=======
/*
Esta es la rom que se carga de un archivo de texto
*/

>>>>>>> d62fd6ba01a2a5946b75c5d3b76086502d070e63
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
