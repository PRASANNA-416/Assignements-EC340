module adder8_tb;
reg [7:0] A,B,Ci;
wire [7:0] S;
wire Co;

adder8 ins0(A,B,Ci,S,Co);

initial begin
A = 8'b00001111;
B = 8'b11110000;
Ci = 0;
# 200
A = 8'b10101101;
B = 8'b10110101;
Ci = 1;
end
endmodule