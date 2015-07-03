/*
	Multiplexor de 2x1 con tama;o parametrizable de las entradas
*/
module Mux2 # ( parameter SIZE=6 )
(
	input wire				wSelect,
	input wire	[SIZE-1:0]	wA,
	input wire	[SIZE-1:0]	wB,
	output reg  [SIZE-1:0]	rOut
);

always @(wSelect)
	begin
		if(wSelect)
			rOut<=wB;
		else
			rOut<=wA;
	end
endmodule
