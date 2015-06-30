`include "decodificador.v"
module Mux2 # ( parameter SIZE=6 )
(
	input wire				wSelect,
	input wire	[SIZE-1:0]	wA,
	input wire	[SIZE-1:0]	wB,
	output reg  [SIZE-1:0]	rOut
);

always @(wSelect)
	begin
		if(Select)
			rOut<=wB;
		else
			rOut<=wA;
	end
endmodule



Mux2 #(8) Mux_A
(
	.wSelect(rMux_a_sel),
	.wA(),
	.wB(rC),
	.rOut()
);

Mux2 #(8) Mux_B
(
	.wSelect(rMux_b_sel),
	.wA(),
	.wB(rC),
	.rOut()
);
