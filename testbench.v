`timescale 1ns/1ps
`include "controlMachine.v"
`include "generator.v"
`include "DataPath.v"
module BancoPruebas;
wire Clock,Reset,wAck,wValidData;
wire oShift,oA_Sel,oB_Sel, oProduct_Sel,oAdd_Sel, wiLSB;
reg [31:0] dataA=32'd10;
reg [31:0] dataB=32'd349525;
wire [63:0] product;

control_Machine control1(.Clock(Clock),.Reset(Reset),.iLSB(wiLSB),.iValid_Data(wValidData),.iAck(wAck),.oShift(oShift),.oA_Sel(oA_Sel),.oB_Sel(oB_Sel),.oProduct_Sel(oProduct_Sel),.oAdd_Sel(oAdd_Sel));
probador p1(.clk(Clock),.rst(Reset),.acknowledge(wAck),.validdata(wValidData));

DataPath data1(
	.b_sel(oB_Sel), .a_sel(oA_Sel), .add_sel(oAdd_Sel),.prod_sel(oProduct_Sel), .iData_A(dataA), .iData_B(dataB), .Shift_Enable(oShift), .Clock(Clock), .Reset(Reset), .Prod(product), .oB_LSB(wiLSB));



 initial 
  begin
    $dumpfile("signals.vcd");
    $dumpvars;
    #35000 ;
    $display ("Test finished");
    $finish;
   
  end
endmodule 

 
