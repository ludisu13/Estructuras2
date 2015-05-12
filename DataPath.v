module DataPath
(
	input wire b_sel,
	input wire a_sel,
	input wire add_sel,
	input wire prod_sel,
	input wire [31:0]iData_A,
	input wire [31:0]iData_B,
	input wire Shift_Enable,
	input wire Clock,
	input wire Reset,
	output reg [63:0]Prod,
	output reg oB_LSB

);

//-------------PARA B-----------------//
wire [31:0]Mux_B_Out;
wire [31:0]Reg_B_Out;
wire [31:0]Shifted_B;

always @(Reg_B_Out[0])
	oB_LSB= Reg_B_Out[0];

MUX #(32) Mux_B
(
	.Select(b_sel),
	.Data_A(Shifted_B),
	.Data_B(iData_B),
	.Out(Mux_B_Out)
);

FFD #(32) Reg_B
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1),
	.D(Mux_B_Out),
	.Q(Reg_B_Out)
	
);

Shift_Register_Right Shift_B
(	
	.Data(Reg_B_Out),
	.Enable(Shift_Enable),
	.Shifted_Data(Shifted_B)
);

//--------PARA A----------//
wire [31:0]Mux_A_Out;
wire [31:0]Reg_A_Out;
wire [31:0]Shifted_A;

MUX #(32) Mux_A
(
	.Select(a_sel),
	.Data_A(Shifted_A),
	.Data_B(iData_A),
	.Out(Mux_A_Out)
);

FFD #(32) Reg_A
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1),
	.D(Mux_A_Out),
	.Q(Reg_A_Out)
	
);

Shift_Register_Left Shift_A
(	
	.Data(Reg_A_Out),
	.Enable(Shift_Enable),
	.Shifted_Data(Shifted_A)
);

//--------PARA EL PRODUCTO------------//
wire [63:0]Mux_Prod_Out;
wire [63:0]Add_Out;
wire [63:0]Sum_Prod;

MUX #(64) Mux_Prod1
(
	.Select(prod_sel),
	.Data_A(Sum_Prod),
	.Data_B(64'b0),
	.Out(Mux_Prod_Out)
);

wire [63:0]Product;
always @ (Product)
	Prod=Product;
	
FFD #(64) Reg_Prod
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1),
	.D(Mux_Prod_Out),
	.Q(Product)
);

ADDER Adder_Prod
(

	.Data_A(Reg_A_Out),
	.Data_B(Prod),
	.Result(Add_Out)
);

MUX #(64) Mux_Prod0
(
	.Select(add_sel),
	.Data_A(Product),//Add_Out
	.Data_B(Add_Out),//Product
	.Out(Sum_Prod)
);
endmodule


///////////////////MUX//////////////////
module MUX #(parameter SIZE=32)
(
	input wire Select,
	input wire [SIZE-1:0]Data_B,
	input wire [SIZE-1:0]Data_A,
	output reg [SIZE-1:0] Out
);


always @(*)
	begin
		if(Select==0)
			Out<=Data_A;
		else if (Select==1)
			Out<=Data_B;
	end

endmodule

///////////////REGISTER///////////////
module FFD # ( parameter SIZE=32 )
(
	input wire				Clock,
	input wire				Reset,
	input wire				Enable,
	input wire [SIZE-1:0]	D,
	output reg [SIZE-1:0]	Q
);


always @ (posedge Clock) 
begin
	if ( Reset )
		Q <= 0;
	else
	begin	
		if (Enable) 
			Q <= D; 
	end	
 
end

endmodule

////////////////SHIFT REGISTER RIGHT//////////
module Shift_Register_Right
(
	input wire [31:0]Data,
	input wire Enable,
	output reg [31:0]Shifted_Data
);
	
	always @ (Data)
		begin
			Shifted_Data <= Data>>1;
		end

endmodule

////////////SHIFT REGISTER LEFT//////////////
module Shift_Register_Left
(
	input wire [31:0]Data,
	input wire Enable,
	output reg [31:0]Shifted_Data
);
	
	always @ (Enable )
		begin
			Shifted_Data <= Data<<1;
		end

endmodule

////////////ADDER///////////////////////////
module ADDER
(
	input wire [31:0]Data_A,
	input wire [63:0]Data_B,
	output reg [63:0]Result
);

	always @(*)
		begin
			Result <= Data_B + Data_A;
		end
endmodule
