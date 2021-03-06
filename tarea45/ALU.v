/*
	Este modulo esta encargado de ejecutar las operaciones principales que cada instruccion debe realizar
	ademas es el que envia los datos y la direccion a la memoria de datos para ser almacenados.
	
*/

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
		case(wInstruction[15:10])
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
				rEx=iA[7:0];
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
				rEx=iB[7:0];
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
