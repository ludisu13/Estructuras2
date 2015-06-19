`include "Definitions.v"


module ALU(

	input 	wire[15:0] 	wInstruction;
	input wire[7:0] iA;
	input wire [7:0] iB;
	output wire oRamEnableWrite;
	output wire [7:0] oData;
	output wire oWriteA;
	output wire oWriteB;
	output wire wCa, wCb;

);
reg [8:0]rEx;
assign oData=[7:0]rEx;
always @ ( * )
	begin
		case(wInstruction)
			`ADDA:
				begin
				rEx<=iA+iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=1'b0;
				end
			`ADDB:
				begin
				rEx<=iB+iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				wCa<=1'b0;
				end
			`ADDCA:
				begin
				rEx<=iA+iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=1'b0;
				end
			`ADDCB:
				begin
				rEx<=iA+iB;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteB<=1'b1;
				oWriteA<=1'b0;
				wCa<=1'b0;
				end
			`SUBA:
				begin
				rEx<=iA-iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=1'b0;
				end
			`SUBB:
				begin
				rEx<=iB-iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				wCa<=1'b0;
				end
			`SUBCA:
				begin
				rEx<=iA-iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=1'b0;
				end
			`SUBCB:
				begin
				rEx<=iB-iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteB<=1'b1;
				oWriteA<=1'b0;
				wCa<=1'b0;
				end
			`ANDA:
				begin
				rEx<=iA&iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
			`ANDB:
				begin
				rEx<=iB&iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				wCa<=wCa;
				end
			`ANDCA:
				begin
				rEx<=iA&iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
			`ANDCB:
				begin
				rEx<=iB&iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteB<=1'b1;
				oWriteA<=1'b0;
				wCa<=wCa;
				end
			`ORA:
				begin
				rEx<=iA|iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
			`ORB:
				begin
				rEx<=iB|iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b1;
				wCa<=wCa;
				end
			`ORCA:
				begin
				rEx<=iA|iB;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteA<=1'b0;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
			`ORCB:
				begin
				rEx<=iB|iA;
				wCb<=rEx[8];
				oRamEnableWrite<=1'b0;
				oWriteB<=1'b1;
				oWriteA<=1'b0;
				wCa<=wCa;
				end
			`ASLA:
				begin
				rEx<=iA<<1;;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b1;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
			`ASRA:
				begin
				rEx<=iA>>1;;
				wCa<=rEx[8];
				oRamEnableWrite<=1'b1;
				oWriteA<=1'b1;
				oWriteB<=1'b0;
				wCb<=wCb;
				end
		
		
		
		
		
		
		
		
		
		
		
		endcase
		end
	
		
endmodule 
