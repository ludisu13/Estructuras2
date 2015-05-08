module probador(clk,rst,acknowledge,validdata);
output clk,rst,acknowledge,validdata;

reloj r1(clk);
reset rs(rst);
ack a1(acknowledge);
valid d1(validdata);
endmodule
//generacion del reloj
module reloj(clk);
output clk;
reg clk;  
initial
  begin 
 
  clk =0;
  end
  always
	begin
   #250 clk =1;
   #250 clk =0;
   
	end
endmodule
//generacion del reset
module reset (rst);
output rst;
reg rst;
initial
	begin
	 rst=0;
	#2 rst=~rst;
	#600 rst=~rst;
	end
endmodule

module ack (acknowledge);
output acknowledge;
reg acknowledge;
initial
	begin
	
	 acknowledge=0;
	#20000 acknowledge=~acknowledge;
	#400 acknowledge=~acknowledge;
	end
endmodule

module valid (validdata);
output validdata;
reg validdata;
initial
	begin
	
	validdata=0;
	#1000 validdata=~validdata;
	#500 validdata=~validdata;
	end
endmodule

