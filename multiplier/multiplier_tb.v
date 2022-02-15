module multiplier_tb();

reg clock,reset,start;
reg[7:0] A;
reg [7:0] B;
wire [15:0] product;
wire done;
multiplier ins0(clock,reset,start,A,B,product,done);

always
#100 clock <= ~clock;

initial begin
clock = 0;
reset = 1;
#200 reset = 0;
A = 8'b10000000;
B = 8'b00000010;
start = 1;
#200 start = 0;
#3600 A = 8'b11111010;
B = 8'b11111101;
start = 1;
end
endmodule