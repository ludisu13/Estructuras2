/*
	 Este bloque esta encargado de actualizar en la última etapa del pipeline los registros de uso general.
*/

module WBX(

input wire iRead,//viene de la ram
input wire iWrite,//directo al reg
input wire[7:0]iDataRAM,

input wire[7:0]iDataALU,
input wire [7:0]iRegister,
output wire [7:0]oRegister

) ;





assign oRegister= (iRead||iWrite) ? ( iRead ? iDataRAM:iDataALU)  :iRegister;






endmodule
