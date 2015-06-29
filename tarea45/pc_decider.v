module pc_Decider(
input wire Clock,
input wire Reset,
output wire [9:0]wIP,
input wire wBranchTaken,
input wire wJumpTaken,
input wire [9:0] wBranchAddress
);

wire [9:0]wInitialIP;
reg [9:0]wDestination;
assign wInitialIP = (Reset) ? 10'b0 : wDestination;
assign wIP = (wBranchTaken|wJumpTaken) ? wInitialIP : wIP_temp;
assign concatenation1 = {5'b00000,wBranchAddress[4],wBranchAddress[3],wBranchAddress[2],wBranchAddress[1],wBranchAddress[0]};
assign concatenation2 = {5'b00000,wBranchAddress[4],wBranchAddress[3],wBranchAddress[2],wBranchAddress[1],wBranchAddress[0]};
	
	UPCOUNTER_POSEDGE IP(
	.Clock(Clock), 
	.Reset(Reset | wBranchTaken ),
	.Initial(wInitialIP + 1),
	.Enable(1'b1),
	.Q(wIP_temp)
	);
	
	
	always @(posedge Clock )
	begin
	if(wJumpTaken)
		wDestination = wBranchAddress;
	else if(wBranchTaken)
		if( wBranchAddress[5])
			wDestination = wIP - concatenation1;
			
		if( ~wBranchAddress[5]) 
			wDestination = wIP + concatenation2;
			
	
	end
endmodule


module UPCOUNTER_POSEDGE 
(
input wire Clock, Reset,
input wire [9:0] Initial,
input wire Enable,
output reg [ 9:0] Q
);

  always @(posedge Clock )
  begin
      if (Reset)
        Q = Initial;
      else
		begin
		if (Enable)
			Q = Q + 1;
			
		end			
  end
endmodule













