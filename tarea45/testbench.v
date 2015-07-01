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

ROM r1(
.iAddress(wAddress),
.oInstruction(wInstruction),
);

pc_Decider pc1(
.Clock(Clock),
.Reset(Reset),
.wIP(wAddress),
.wBranchTaken(wBranchTaken),
.wJumpTaken(wJumpTaken),
.wBranchAddress(wBranchAddress)
);

decodificador dec1(
.wInstruction(wInstruction),
.wZa(),
.wZb().
.wNa(),
.wNb(),
.wCa(wCa),
.wCb(wCb),
.rBranchTaken(wBranchTaken),
.rJumpTaken(wJumpTaken),
.rBranch_dir(wBranchAddress),
.rC(rConstant),
.rMux_a_sel(a_sel),
.rMux_b_sel(b_sel)
);
wire [7:0] wOut_Mux_A;
Mux2 #(8) muxa(
.wSelect(a_sel),
.wA(),
.wB(rConstant),
.rOut(wOut_Mux_A)
); 

wire [7:0] wOut_Mux_B;
Mux2 #(8) muxa(
.wSelect(b_sel),
.wA(),
.wB(rConstant),
.rOut(wOut_Mux_B)
); 
wire [7:0] outAlu;
wire [9:0]wRamAddress;
ALU alu(
.wInstruction(wInstruction),
.iA(wOut_Mux_A),
.iB(wOut_Mux_B),
.RamEnableWrite(wRamEnable),
.oData(outAlu),
.oWriteA(wWriteA),
.oWriteB(wWriteB),
.wCa(wCa),
.wCb(wCb),
.oRamAddress(wRamAddress),
.oReadA(ReadA),
.oReadB(ReadB),
);


wire [7:0] ramA;
wire [7:0] ramB;

MEMORY #(  8  ,10    ,1024    ) ram_memory(
.Clock(Clock),
.iWriteEnable(wRamEnable),
.iAddress(wRamAddress),
.iReadtoa(ReadA),
.iReadtob(ReadB),
.iDataIn(outAlu),
.oDataOutA(ramA),
.oDataoutB(ramB)
);

WBX WBA(





)


 initial 
  begin
    $dumpfile("signals.vcd");
    $dumpvars;
    #70000 ;
    $display ("Test finished");
    $finish;
   
  end
endmodule 
