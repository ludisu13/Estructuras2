//`include "definitions.v"
//`include "FFD.v"


module ALU(
	input 	wire[15:0] 	wInstruction,
	input wire[7:0] iA,
	input wire [7:0] iB,
	output reg oRamEnableWrite,
	output wire[7:0] oData,
	output reg oWriteA,
	output reg oWriteB,
	output reg wCa, wCb,
	output reg [9:0] oRamAddress,
	output reg oReadA,oReadB
	
);

reg [8:0]rEx;
assign oData=rEx;
always @ ( * )
	begin
		case(wInstruction)
			`ADDA:
				begin
				rEx=iA+iB;
				wCa<=rEx[8];
				
				oRamEnableWrite<=1'b0;
				
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ADDB:
				begin
				rEx=iB+iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				wCa<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ADDCA:
				begin
				rEx=iA+iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ADDCB:
				begin
				rEx=iA+iB;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteB<=1'b1;
				oWriteA<=1'b0;
				wCa<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`SUBA:
				begin
				rEx=iA-iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`SUBB:
				begin
				rEx=iB-iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				wCa<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`SUBCA:
				begin
				rEx=iA-iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`SUBCB:
				begin
				rEx=iB-iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteB<=1'b1;
				oWriteA<=1'b0;
				wCa<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ANDA:
				begin
				rEx=iA&iB;
				wCa<=wCa;
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=wCb;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ANDB:
				begin
				rEx=iB&iA;
				wCb<=wCb;
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				wCa<=wCa;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ANDCA:
				begin
				rEx=iA&iB;
				wCa<=wCa;
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=wCb;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ANDCB:
				begin
				rEx=iB&iA;
				wCb<=wCb;
				oRamEnableWrite<=1'b0;
				oWriteB<=1'b1;
				oWriteA<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				wCa<=wCa;
				end
			`ORA:
				begin
				rEx=iA|iB;
				wCa<=wCa;
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=wCb;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ORB:
				begin
				rEx=iB|iA;
				wCb<=wCb;
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				wCa<=wCa;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ORCA:
				begin
				rEx=iA|iB;
				wCa<=wCa;
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=wCb;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ORCB:
				begin
				rEx=iB|iA;
				wCb<=wCb;
				oRamEnableWrite<=1'b0;
				oWriteB<=1'b1;
				oWriteA<=1'b0;
				wCa<=wCa;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ASLA:
				begin
				rEx=iA<<1;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=wCb;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`ASRA:
				begin
				rEx=iA>>1;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=wCb;
				oReadA<=1'b0;
				oReadB<=1'b0;
				end
			`LDA:
				begin
				rEx=rEx;
				wCa<=wCa;
				oRamAddress=wInstruction[9:0];
				oRamEnableWrite<=1'b0;
				oReadA<=1'b1;
				oReadB<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
			`LDB:
				begin
				rEx=rEx;
				wCa<=wCa;
				oRamAddress=wInstruction[9:0];
				oRamEnableWrite<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b1;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=wCb;
				
				end
			`STA:
				begin
				rEx=iA;
				wCa<=wCa;
				oRamAddress=wInstruction[9:0];
				oRamEnableWrite<=1'b1;
				oReadA<=1'b0;
				oReadB<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
			`STB:
				begin
				rEx=iB;
				wCa<=wCa;
				oRamAddress=wInstruction[9:0];
				oRamEnableWrite<=1'b1;
				oReadA<=1'b0;
				oReadB<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
			`LDCA:
				begin
				rEx=iA;
				wCa<=wCa;
				oRamAddress=wInstruction[9:0];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				wCb<=wCb;
				end
			`LDCB:
				begin
				rEx=iB;
				wCa<=wCa;
				oRamAddress=wInstruction[9:0];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				oReadA<=1'b0;
				oReadB<=1'b0;
				wCb<=wCb;
				end
			default: //Todos los Branches van a caer en este caso es un NOP
				begin
				rEx=rEx;
				wCa<=wCa;
				oRamAddress=wInstruction[9:0];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				oReadA<=1'b0;
				oReadB<=1'b0;
				wCb<=wCb;
				
				end
		

		endcase
		end
	
		
endmodule 
/*
module Banco_Registros(

	input wire Clock,
	input wire Reset,
	input wire iRamEnableWrite,
	input wire[7:0] iData,
	input wire iWriteA,
	input wire iWriteB,
	input wire iCa, iCb,
	input wire [9:0] iRamAddress,
	input wire iReadA,iReadB
	output reg oRamEnableWrite,
	output wire[7:0] oData,
	output reg oWriteA,
	output reg oWriteB,
	output reg oCa, oCb,
	output reg [9:0] oRamAddress,
	output reg oReadA,oReadB
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1) FFD1 
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iRamEnableWrite),
	.Q(oRamEnableWrite)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 8 ) FFD2
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iData),
	.Q(oData)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1 ) FFD3 
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iWriteA),
	.Q(oWriteA)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1 ) FFD4
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iWriteB),
	.Q(oWriteB)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1 ) FFD5 
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iCa),
	.Q(oCa)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1 ) FFD6 
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iCb),
	.Q(oCb)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 10 ) FFD7
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iRamAddress),
	.Q(oRamAddress)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1 ) FFD8
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iReadA),
	.Q(oReadA)
);

FFD_POSEDGE_SYNCRONOUS_RESET # ( 1 ) FFD9
(
	.Clock(Clock),
	.Reset(Reset),
	.Enable(1'b1),
	.D(iReadB),
	.Q(oReadB)
);
endmodule */
