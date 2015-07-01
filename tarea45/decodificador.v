//`include "definitions.v"
module decodificador(
	input 	wire[15:0] 	wInstruction,
	input 	wire 		wZa, wZb, wCa, wCb, wNa, wNb,
	output reg 		rBranch_taken,
	output reg 		rJumpTaken,
	output reg[9:0] 	rBranch_dir,
	//output reg[7:0] 	rA,
	//output reg[7:0] 	rB,
	output reg[7:0] 	rC,
	output reg 		rMux_a_sel,
	output reg 		rMux_b_sel
);

always @(*)
begin
	case(wInstruction[15:0])
	
	`LDA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`LDB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`STA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`STB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ADDA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ADDB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`SUBA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`SUBB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ANDA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ANDB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ORA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ORB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ASLA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ASRA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`LDCA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`LDCB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ADDCA:
	begin	
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;	
		rC=wInstruction[7:0];
	end
	
	
	`ADDCB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`SUBCA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`SUBCB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ANDCA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ANDCB:
	begin	
		rJumpTaken<=0;
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ORCA:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ORCB:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`JMP:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rJumpTaken<=1;
		rBranch_dir<=wInstruction[9:0];	
		rC<=6'b0;		
	end
	
	`BAEQ:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wZa==1)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];			
		end
		else
			rBranch_taken<=0;
	end
	
	`BANE:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wZa==0)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end

	`BACS:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wCa==1)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	`BACC:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wCa==0)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	`BAMI:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wNa==1)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	`BAPL:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;	
		rC<=6'b0;
		if(wNa==0)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	`BBEQ:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wZb==1)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	`BBNE:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wZb==0)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end

	`BBCS:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wCb==1)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	`BBCC:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wCb==0)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	`BBMI:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wNb==1)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	`BBPL:
	begin
		rJumpTaken<=0;
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wNb==0)
		begin
			rBranch_taken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranch_taken<=0;
	end
	
	default:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rJumpTaken<=0;
		rBranch_dir<=10'b0;
		rC=8'b0;
	end
	
	endcase
	end
endmodule

