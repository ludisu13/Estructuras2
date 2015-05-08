`timescale 1ns/1ps
`include "controlMachine.v"
`include "generator.v"
module BancoPruebas;
wire Clock,Reset,wAck,wValidData;
wire oShift,oA_Sel,oB_Sel, oProduct_Sel,oAdd_Sel;
control_Machine control1(.Clock(Clock),.Reset(Reset),.iLSB(1'b1),.iValid_Data(wValidData),.iAck(wAck),.oShift(oShift),.oA_Sel(oA_Sel),.oB_Sel(oB_Sel),.oProduct_Sel(oProduct_Sel),.oAdd_Sel(oAdd_Sel));
probador p1(.clk(Clock),.rst(Reset),.acknowledge(wAck),.validdata(wValidData));
 initial 
  begin
    $dumpfile("signals.vcd");
    $dumpvars;
    #67000 ;
    $display ("Test finished");
    $finish;
   
  end
endmodule 

 
