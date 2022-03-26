module pclogic(clk, reset, ain, aout, pcsel,jump,Instruction);  //changes made here 

input reset;
input clk;
input [31:0] ain;
//pecsel = branch & zero
input pcsel;
input [25:0]Instruction;  //changes made here 
input jump;

output reg [31:0] aout;

always @(posedge clk) begin
	if (reset==1)
		aout<=32'b0;
	else
		if (pcsel==0 and jump==0) begin  //changes made here 
			aout<=aout+1;
		end
		if (pcsel==1 and jump==0) begin            //changes made here 
			aout<=ain+aout+1; //branch
		end
		if(jump==1) begin      //changes made here 
			aout<= {aout[31:28],Instruction};
		end
end


endmodule
