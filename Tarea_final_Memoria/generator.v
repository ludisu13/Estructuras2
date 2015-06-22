module generator(clk, validdata, Readtoa, Readtob, iWriteEnable, iAddress);
output clk,validdata, Readtoa, Readtob, iWriteEnable, iAddress;

reloj r1(clk);
inputs d1(validdata, Readtoa, Readtob, iWriteEnable, iAddress);

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
module inputs (validdata, Readtoa, Readtob, iWriteEnable, iAddress);
output reg Readtoa, Readtob, iWriteEnable ;
output reg [7:0] validdata;
output reg [9:0] iAddress;
initial
	begin
	
	#10 validdata = 8'd8; Readtoa = 0; Readtob = 0; iWriteEnable = 1; iAddress =10'd0; 
	#500 validdata = 8'd8; Readtoa = 1; Readtob = 0; iWriteEnable = 0; iAddress =10'd0; 
	#1000 validdata = 8'd16; Readtoa = 0; Readtob = 0; iWriteEnable = 1; iAddress =10'd10;
	#1500 validdata = 8'd16; Readtoa = 0; Readtob = 1; iWriteEnable = 0; iAddress =10'd10; 
	#2000 validdata = 8'd32; Readtoa = 0; Readtob = 0; iWriteEnable = 1; iAddress =10'b0000011111;
	#2500 validdata = 8'd32;  Readtoa = 1; Readtob = 0; iWriteEnable = 0; iAddress =10'b0000011111;
	#3000 validdata = 8'd64;  Readtoa = 0; Readtob = 0; iWriteEnable = 1; iAddress =10'b1111111111;
	#3500 validdata = 8'd64;  Readtoa = 0; Readtob = 1; iWriteEnable = 0; iAddress =10'b1111111111;
	end
endmodule

