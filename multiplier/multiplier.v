
module multiplier#(parameter n=8)(clk,reset,start,A,B,product,done);
input clk,reset,start;
input wire [n-1:0] A,B;
output reg [2*n-1:0] product;
output reg done;

reg [1:0] s [2:0];
assign s[0] = 2'b00;
assign s[1] =2'b01;
assign s[2] = 2'b10;
reg [1:0] cp_fsm_q,cp_fsm_d;
reg [2*n-1:0] A_q,A_d,prod_q,prod_d,B_q,B_d;
reg [4:0]count_q,count_d;

always @(posedge clk,posedge reset) begin
if (reset) begin
cp_fsm_q <= s[0];
end
else begin
cp_fsm_q <= cp_fsm_d;
A_q <= A_d;
B_q <= B_d;
count_q <= count_d;
prod_q <= prod_d;
end
end

always @(*) begin 
A_d = A_q;B_d = B_q;count_d = count_q;prod_d = prod_q;done = 0;cp_fsm_d = cp_fsm_q;
case(cp_fsm_q) 
s[0] : begin
done = 0;
product = 0;
cp_fsm_d = start?s[1] : s[0];
count_q = 0;count_d = 0;
A_q = {{8{A[7]}},A}; A_d = {{8{A[7]}},A};
B_q = {{8{B[7]}},B}; B_d = {{8{B[7]}},B};
prod_q = 0; prod_d = 0;
end
s[1] : begin
cp_fsm_d = (count_q==16)?s[2]:s[1];
if (~(count_q==16)) begin
if (B_q[0])
prod_d = prod_q + A_q;
A_d = A_q << 1;
B_d = B_q >> 1;
count_d = count_q + 1;
end
end
s[2]: begin
done = 1;
product = prod_q; 
cp_fsm_d = start ? s[2] : s[0];
end
endcase
end

endmodule