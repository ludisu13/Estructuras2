module WBX(

input wire iReadA,//viene de la ram
input wire iWriteA,//directo al reg
input wire[7:0]iDataRAM,

input wire[7:0]iDataALU,
input wire [7:0]iRegister,
output wire [7:0]oRegister

) ;





assign oRegister= (iReadA||iWriteA) ? ( iReadA ? iDataRam:iDataALU)  :iRegister;






endmodule
