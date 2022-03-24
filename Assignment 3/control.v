module control(opcode, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,NotBranch, AluOP);

input [5:0] opcode;

output reg RegDst;
output reg ALUSrc;
output reg MemtoReg;
output reg RegWrite;
output reg MemRead;
output reg MemWrite;
output reg Branch;
output reg NotBranch;

output reg [1:0] AluOP;

always @(opcode) begin
	case (opcode)
		6'b000000:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,NotBranch, AluOP}=10'b100100_00_10; //r
		6'b100011:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,NotBranch, AluOP}=10'b011110_00_00; //lw
		6'b101011:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,NotBranch, AluOP}=10'bx1x001_00_00; //sw
		6'b000100:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,NotBranch, AluOP}=10'bx0x000_10_01; //beq
		6'b001000:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,NotBranch, AluOP}=10'b010100_00_00; //addi
		6'b000101:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,NotBranch, AluOP}=10'bx0x000_01_01; //bne
		6'b000010:{RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,NotBranch, AluOP}=10'b      _00_01; //j
		default:
		{RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,NotBranch,AluOP}=10'bxxx_xxx_xx_xx;
	endcase
end

endmodule

//refer this for opcode bits "http://alumni.cs.ucr.edu/~vladimir/cs161/mips.html"
