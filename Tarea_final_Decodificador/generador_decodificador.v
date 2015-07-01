module generator(
	output clk, wZa, wZb, wCa, wCb, wNa, wNb;
	output [7:0] validdata;
	output [15:0] wInstruction;
);


reloj r1(clk);
inputs d1(validdata, wZa, wZb, wCa, wCb, wNa, wNb, wInstruction);

endmodule

//Generacion del reloj
module reloj(clk);
output reg clk;  
initial
  begin 
 
  clk = 0;
  end
  always
	begin
   #250 clk = 1;
   #250 clk = 0;
   
	end
endmodule

//Generación de entradas a la memoria
module inputs (validdata, wZa, wZb, wCa, wCb, wNa, wNb, wInstruction);
output reg wZa, wZb, wCa, wCb, wNa, wNb;
output reg [7:0] validdata;
output reg [15:0] wInstruction;
initial
	begin
	
	#10 validdata = 8'd8; wZa = 0; wZb = 0; wCa = 1; wCb = 0; wNa = 0; wNb = 0; wInstruction = 15'd0;
	#500 validdata = 8'd8; wZa = 1; wZb = 0; wCa = 0; wCb = 0; wNa = 0; wNb = 0; wInstruction = 15'd0;
	#1000 validdata = 8'd16; wZa = 0; wZb = 0; wCa = 1; wC = b0; wNa = 0; wNb = 0; wInstruction = 15'd0;
	#1500 validdata = 8'd16; wZa = 0; wZb = 1; wCa = 0; wCb = 0; wNa = 0; wNb = 0; wInstruction = 15'd0;
	#2000 validdata = 8'd32; wZa = 0; wZb = 0; wCa = 1; wCb = 1; wNa = 1; wNb = 0; wInstruction = 15'd0;
	#2500 validdata = 8'd32;  wZa = 1; wZb = 0; wCa = 0; wCb = 1;wNa = 1; wNb = 0; wInstruction = 15'd0;
	#3000 validdata = 8'd64;  wZa = 0; wZb = 0; wCa = 1; wCb = 1; wNa = 1; wNb = 0; wInstruction = 15'd0;
	#3500 validdata = 8'd64;  wZa = 0; wZb = 1; wCa = 0; wCb = 1; wNa = 1; wNb = 0; wInstruction = 15'd0;
	end
endmodule
