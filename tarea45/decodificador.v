module decodificador_senales(

	input 	wire[15:0] 	wInstruction;
	input wire 		wZa, wZb, wCa, wCb, wNa, wNb;
	output wire 		rBranch_taken;
	output wire[6:0] 	rBranch_dir;
	//output wire[7:0] 	rA;
	//output wire[7:0] 	rB;
	output wire[7:0] 	rC;
	output wire 		rMux_a_sel;
	output wire 		rMux_b_sel;
	

);

always @(*)
begin
	case(wInstruction[15:0])
	
	`LDA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`LDB:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`STA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`STB:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ADDA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ADDB:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`SUBA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`SUBB:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ANDA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ANDB:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ORA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ORB:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ASLA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`ASRA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranch_taken<=0;
		rBranch_dir<=10'b0;
		rC<=6'b0;
	end
	
	`LDCA:
	begin
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`LDCB:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ADDCA:
	begin	
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;	
		rC=wInstruction[7:0];
	end
	
	
	`ADDCB:
	begin
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`SUBCA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`SUBCB:
	begin
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ANDCA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ANDCB:
	begin	
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ORCA:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=1;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`ORCB:
	begin
		rMux_a_sel<=1;
		rMux_b_sel<=0;
		rBranch_Taken<=0;
		rBranch_dir<=10'b0;
		rC=wInstruction[7:0];
	end
	
	`JMP:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranchTaken<=1;
		rBranch_dir<=wInstruction[9:0];	
		rC<=6'b0;		
	end
	
	`BAEQ:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wZa==1)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];			
		end
		else
			rBranchTaken<=0;
	end
	
	`BANE:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wZa==0)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end

	`BACS:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wCa==1)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
			
			else
			
		end
		else
			rBranchTaken<=0;
	end
	
	`BACC:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wCa==0)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end
	
	`BAMI:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wNa==1)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end
	
	`BAPL:
		rMux_a_sel<=0;
		rMux_b_sel<=0;	
		rC<=6'b0;
	begin
		if(wNa==0)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end
	
	`BBEQ:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wZb==1)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end
	
	`BBNE:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wZb==0)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end

	`BBCS:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wCb==1)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end
	
	`BBCC:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wCb==0)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end
	
	`BBMI:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wNb==1)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end
	
	`BBPL:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rC<=6'b0;
		if(wNb==0)
		begin
			rBranchTaken<=1;
			rBranch_dir<=wInstruction[6:0];
		end
		else
			rBranchTaken<=0;
	end
	
	default:
	begin
		rMux_a_sel<=0;
		rMux_b_sel<=0;
		rBranchTaken<=0;
		rBranch_dir<=10'b0;
		rC=8'b0;
	end
	
	endcase
	end
endmodule
