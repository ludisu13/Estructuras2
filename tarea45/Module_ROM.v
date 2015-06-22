

module ROM
(
	input  wire[9:0]  		iAddress,
	output reg [15:0] 		oInstruction
);	
always @ ( iAddress )
begin
	case (iAddress)
	
	0: oInstruction = { `NOP ,24'd400   };
	1: oInstruction = { `STO ,`R1,16'd13};
	2: oInstruction = { `STO ,`R4,16'd14};
	3: oInstruction = { `NOP ,24'd400    };	
	4: oInstruction = { `gIMUL ,`R3, `R4, `R1};
	5: oInstruction = { `LED ,8'b0, `R3,8'b0 };
	6: oInstruction = { `JMP ,  8'd1,16'b0   };
	
	default:
		oInstruction = { `LED ,  24'b10101010 };		//NOP 
	endcase	
end
	
endmodule
