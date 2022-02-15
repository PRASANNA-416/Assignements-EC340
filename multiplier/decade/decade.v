module decade(
input clk,
reset,
counter_on,
count_up,
load,[3:0] data_in,
output reg [3:0]count,
output reg TC
);
initial
count = 0;
always @(posedge clk,posedge reset) begin
//given highest precedence
if (reset) 
count <= 0;
//second highest precedence
else if (load)
count <= data_in;
//if counting enabled and to count upwards
else if (counter_on && count_up)
count <= (count+1)%10; //%10 to keep it modulo 10

//counting enabled and to count downwards
else if (counter_on && ~count_up) begin
//to make mod 10, down counting 0 gives 9
if (count==4'b0000)
count <= 4'b1001;
else//normal flow
count <= count-1;
end
//all other unexpected cases remain same
else
count <= count;


end
//combinational logic block , as described in question
always@(*)
assign TC = (count==0 && ~count_up) || (count==9 && count_up);
endmodule