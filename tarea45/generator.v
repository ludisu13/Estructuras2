module generator(clock,reset);
output wire clock;
output reg reset;
clk reloj(clock);
initial
	begin
	reset=1;
	#1000;
	reset=0;
	
	end
endmodule

module clk(clk);
output reg clk;  
/*initial
  begin 
 
  clk = 0;
  #900;
  
  end*/
  always
	begin
	
   #250 clk = 0;
   #250 clk = 1;
   
	end
endmodule

