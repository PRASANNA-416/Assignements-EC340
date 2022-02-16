module decade_tb;

reg clk,reset,counter_on,count_up,load;
reg [3:0]data_in;
wire [3:0]count;
wire TC;

decade ins0(load,reset,data_in,counter_on,count_up,clk,TC,count);

initial
 begin
    clk =0; reset =1; data_in = 4'b0110;
    #150 reset = 0;load = 1;data_in = 4'b1000;
    #400 counter_on = 1;count_up = 1;
    #200 load = 1;data_in = 4'b1001;
    #400 counter_on = 1;count_up = 0;
  end

initial
    forever #(50) clk <= ~clk;

endmodule
