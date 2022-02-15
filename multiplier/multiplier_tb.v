	
module multiplier_tb;

parameter t_PERIOD =100;
reg clk, reset_n, start;
reg [7:0] data1, data2;
wire done;
wire [15:0] product;

  multiplier  uut (clk,reset_n,start,data1,data2,product,done);
//clock generation

initial
 begin
    clk =0; reset_n =0; start =0; data1 = {8{1'b0}}; data2 = {8{1'b0}}; 
    #150 reset_n = 1; data1 = 8'b00011010; data2 = 8'b00101101;
    #200 reset_n = 1; data1 = 8'b01100100; data2 = 8'b10110011;
    #250 reset_n = 1; data1 = 8'b11000111; data2 = 8'b00111001;
    #300 reset_n = 1; data1 = 8'b11001100; data2 = 8'b10001110;
    #350 start = 1;
    #550 start = 0;
  end

initial
    forever #(t_PERIOD/2) clk <= ~clk;

always @(done) 
   if (done ==1)
       $finish;
    
endmodule
