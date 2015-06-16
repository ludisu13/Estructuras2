`timescale 1ns/1ps
`include "controlMachine.v"
`include "generator.v"
`include "DataPath.v"
module BancoPruebas;
wire Clock,Reset,wAck,wValidData;
wire oShift,oA_Sel,oB_Sel, oProduct_Sel,oAdd_Sel, wiLSB;
reg [31:0] dataA=32'd4294967295;
reg [31:0] dataB=32'd4294967295;
wire [63:0] product;

control_Machine control1(.Clock(Clock),.Reset(Reset),.iLSB(wiLSB),.iValid_Data(wValidData),.iAck(wAck),.oShift(oShift),.oA_Sel(oA_Sel),.oB_Sel(oB_Sel),.oProduct_Sel(oProduct_Sel),.oAdd_Sel(oAdd_Sel));
probador p1(.clk(Clock),.rst(Reset),.acknowledge(wAck),.validdata(wValidData));

DataPath data1(.add_sel(oAdd_Sel),
	.b_sel(oB_Sel), .a_sel(oA_Sel), .prod_sel(oProduct_Sel), .Data_A(dataA), .Data_B(dataB), .Shift_Enable(oShift), .Clock(Clock), .Reset(Reset), .Prod(product), .oB_LSB(wiLSB));



 initial 
  begin
    $dumpfile("signals.vcd");
    $dumpvars;
	#27000;
	dataA=32'd0; dataB=32'd4294967295;
	#27000;
	dataA=32'd10000; dataB=32'd4500;
    #70000 ;
    $display ("Test finished");
    $finish;
   
  end
endmodule 

 
