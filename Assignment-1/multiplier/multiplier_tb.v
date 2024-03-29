	module multiplier_tb;

parameter t_PERIOD =100;
reg clk, reset_n, start;
reg [7:0] data1;
reg [7:0] data2;
wire done;
wire [15:0] product;

multiplier  uut (clk,reset_n,start,data1,data2,product,done);
//clock generation

initial
 begin
   clk =0; reset_n =1; start =0; data1 = 8'b00000000;data2 = 8'b00000000; 
    #150 reset_n = 0;start = 1;data1 = 8'b00011010; data2 = 8'b00101101;  
    #1500 start = 0;reset_n = 1;
    #100 reset_n = 0;start = 1;data1 = 8'b01100100; data2 = 8'b10110011;
    #1500 start = 0;reset_n = 1;
    #100 reset_n = 0;start = 1;data1 = 8'b11000111; data2 = 8'b00110001;
    #1500 start = 0;reset_n = 1;
    #100 reset_n = 0;start = 1;data1 = 8'b10100111; data2 = 8'b10111001;
    


  end

initial
    forever #(t_PERIOD/2) clk <= ~clk;

endmodule
