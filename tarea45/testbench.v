`timescale 1ns/1ps
`include "definitions.v"
`include "decodificador.v"
`include "Module_ROM.v"
`include "WB.v"
`include "ALU.v"
`include "Mux.v"
`include "memory.v"
`include "FFD.v"
`include "pc_decider.v"
`include "generator.v"

module BancoPruebas;
wire Clock,Reset;
wire [9:0] wAddress;
wire [15:0] wInstruction;
wire [9:0] wBranchAddress;
wire [7:0] rConstant;
wire [7:0] wAreg;
wire [7:0] wBreg;

generator g1(Clock,Reset);

ROM r1(
.iAddress(wAddress),
.oInstruction(wInstruction)
);
wire wBranchTaken;
wire wJumpTaken;
wire wCa;
wire wCb;
pc_Decider pc1(
.Clock(Clock),
.Reset(Reset),
.wIP(wAddress),
.wBranchTaken(wBranchTaken),
.wJumpTaken(wJumpTaken),
.wBranchAddress(wBranchAddress)
);
wire a_sel;
wire b_sel;
decodificador dec1(
.wInstruction(wInstruction),
.wZa(wAreg==6'b0),
.wZb(wBreg==6'b0),
.wNa(wAreg[7]),
.wNb(wBreg[7]),
.wCa(wCa),
.wCb(wCb),
.rBranch_taken(wBranchTaken),
.rJumpTaken(wJumpTaken),
.rBranch_dir(wBranchAddress),
.rC(rConstant),
.rMux_a_sel(a_sel),
.rMux_b_sel(b_sel)
);
wire [7:0] wOut_Mux_A;
Mux2 #(8) muxa(
.wSelect(a_sel),
.wA(wAreg),
.wB(rConstant),
.rOut(wOut_Mux_A)
); 
wire[15:0] wInstructionToAlu;
 FFD_POSEDGE_SYNCRONOUS_RESET # ( 16) FFDInstruciton(

.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wInstruction),
	.Q(wInstructionToAlu)

);
wire [7:0] wOut_Mux_B;
Mux2 #(8) muxb(
.wSelect(b_sel),
.wA(wBreg),
.wB(rConstant),
.rOut(wOut_Mux_B)
); 
wire [7:0] outAlu;
wire [7:0] outAlutoRam;
wire [9:0]wRamAddress;
wire [9:0] oRamAddress;
wire wWriteA;
wire wWriteB;
wire ReadA;
wire ReadB;
wire wRamEnable;

ALU alu(
.wInstruction(wInstructionToAlu),
.iA(wOut_Mux_A),
.iB(wOut_Mux_B),
.oRamEnableWrite(wRamEnable),
.oData(outAlu),
.oWriteA(wWriteA),
.oWriteB(wWriteB),
.wCa(wCa),
.wCb(wCb),
.oRamAddress(wRamAddress),
.oReadA(ReadA),
.oReadB(ReadB)
);

///FFD de la alu a la ram y leugo al wb
FFD_POSEDGE_SYNCRONOUS_RESET # ( 8) FFDalutoram 
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(outAlu),
	.Q(outAlutoRam)
);
wire [7:0] outAlutoWB;
FFD_POSEDGE_SYNCRONOUS_RESET # ( 8) FFDalutowb
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(outAlutoRam),
	.Q(outAlutoWB)
);

//ReadA
wire ReadAtoRam;
wire ReadAtoWB;
FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDReadAtoram
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(ReadA),
	.Q(ReadAtoRam)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDReadAtowb
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(ReadAtoRam),
	.Q(ReadAtoWB)
);
//READB
wire ReadBtoRam;
wire ReadBtoWB;
FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDReadBtoram
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(ReadB),
	.Q(ReadBtoRam)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDReadBtowb
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(ReadBtoRam),
	.Q(ReadBtoWB)
);
//WRITEA
wire wWriteABUF;
wire wWriteAtoWB;
FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDWriteAtoram
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wWriteA),
	.Q(wWriteABUF)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDWriteAtowb
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wWriteABUF),
	.Q(wWriteAtoWB)
);

//WRITEB
wire wWriteBBUF;
wire wWriteBtoWB;
FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDWriteBtoram
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wWriteB),
	.Q(wWriteBBUF)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDWriteBtowb
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wWriteBBUF),
	.Q(wWriteBtoWB)
);

wire oRamEnableWrite;



///ram enable
FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFDramenable
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wRamEnable),
	.Q(oRamEnableWrite)
);
///ram address
FFD_POSEDGE_SYNCRONOUS_RESET # ( 10) FFDRamaddress
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(wRamAddress),
	.Q(oRamAddress)
);


wire [7:0] ramA;
wire [7:0] ramB;

MEMORY #(  8  ,10    ,1024    ) ram_memory(
.Clock(Clock),
.iWriteEnable(oRamEnableWrite),
.iAddress(oRamAddress),
.iReadtoa(ReadAtoRam),
.iReadtob(ReadBtoRam),
.iDataIn(outAlutoRam),
.oDataOuta(ramA),
.oDataOutb(ramB)
);
wire [7:0] A;
WBX WBA(
.iRead(ReadAtoWB),
.iWrite(wWriteAtoWB),
.iDataRAM(ramA),
.iDataALU(outAlutoWB),
.iRegister(A),
.oRegister(A)
);
wire [7:0] B;
WBX WBB(
.iRead(ReadBtoWB),
.iWrite(wWriteBtoWB),
.iDataRAM(ramB),
.iDataALU(outAlutoWB),
.iRegister(B),
.oRegister(B)
);
 FFD_POSEDGE_SYNCRONOUS_RESET # ( 8) FFDA(

.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(A),
	.Q(wAreg)

);

 FFD_POSEDGE_SYNCRONOUS_RESET # ( 8) FFDB(

.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(B),
	.Q(wBreg)

);

 initial 
  begin
    $dumpfile("signals.vcd");
    $dumpvars;
    #70000 ;
    $display ("Test finished");
    $finish;
   
  end
endmodule 
