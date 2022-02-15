module decade_tb;

reg clk,reset,counter_on,count_up,load;
reg [3:0]data_in;
wire [3:0]count;
wire TC;

decade ins0(clk,reset,counter_on,count_up,load,data_in,count,TC);
//making clock to run always
always 
#100 clk = ~clk;
//input waveforms given once
initial begin
clk = 0;
reset = 0;
data_in = 4'b0000;
load = 0;
counter_on=1;
count_up = 0;
//initially we do down counting and now we will do up counitng
#2000 count_up = 1;
//now let's test if load works as expected for 3 data  values
#2000 repeat(3) begin
load = 1;
#100 data_in = data_in + 4;
end
//finally testing reset
#100 reset = 1;
end
endmodule