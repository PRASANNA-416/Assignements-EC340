module pclogic(clk, reset, ain, aout, pcsel,jump,Instruction);

input reset;
input clk;
input [31:0] ain;
//pecsel = branch & zero
input pcsel;
intput [25:0]Instruction;

output reg [31:0] aout;

always @(posedge clk) begin
	if (reset==1)
		aout<=32'b0;
	else
		if (pcsel==0 and jump==0) begin
			aout<=aout+1;
		end
		if (pcsel==1 and jump==0) begin
			aout<=ain+aout+1; //branch
		end
		if(jump==1) begin
			Instruction<= Instruction<<2;
			aout<= {aout[31:28],Instruction};
		end
end


endmodule
