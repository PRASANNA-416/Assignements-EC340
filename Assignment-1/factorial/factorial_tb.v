		module factorial_tb;

parameter t_PERIOD =100;
reg clk, reset_n, start;
reg [3:0] data1;
wire done;
wire [15:0] fact;

  factorial  uut (clk,reset_n,start,data1,done,fact);
//clock generation

initial
 begin
   clk =0; reset_n =1; start =0; data1 = 4'b0000; 
    #150 reset_n = 0;start = 1; data1 = 4'b0110; 
    #800 start = 0;reset_n = 1;
    #100 data1 = 4'b0100;start = 1;reset_n = 0;
    #800 start = 0;reset_n = 1;
    #100 data1 = 4'b1000;start = 1;reset_n = 0;
  end

initial
    forever #(t_PERIOD/2) clk <= ~clk;

endmodule
