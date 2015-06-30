`timescale 1ns/1ps
`include "generator.v"
`include "memory.v"

module TestMemory;
wire Clock, iWriteEnable, wReadtoa, wReadtob;
wire [7:0] oDataOuta;
wire [7:0] oDataOutb;
wire [9:0] iAddress;
wire [7:0] iDataIn;

generator g1(
	.clk(Clock),
	.validdata(iDataIn),
	.Readtoa(wReadtoa),
	.Readtob(wReadtob),
	.iWriteEnable(iWriteEnable),
	.iAddress(iAddress)
	);

MEMORY m1(
	.Clock(Clock),
	.iWriteEnable(iWriteEnable),
	.iAddress(iAddress),
	.iReadtoa(wReadtoa),
	.iReadtob(wReadtob),
	.iDataIn(iDataIn),
	.oDataOuta(oDataOuta),
	.oDataOutb(oDataOutb)

);



 initial 
  begin
    $dumpfile("signals.vcd");
    $dumpvars;
    #4000 ;
    $display ("Test finished");
    $finish;
   
  end
endmodule 
