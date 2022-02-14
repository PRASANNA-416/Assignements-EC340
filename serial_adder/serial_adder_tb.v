`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2019 22:48:14
// Design Name: 
// Module Name: serial_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module serial_adder_tb;

parameter t_PERIOD =100;
reg clk, reset_n, start;
reg [7:0] data1, data2;
wire done;
wire [7:0] sum;

serial_adder  uut (data1, data2, reset_n, clk, start, sum, done);
//clock generation

initial
 begin
    clk =0; reset_n =0; start =0; data1 = {8{1'b0}}; data2 = {8{1'b0}}; 
    #150 reset_n = 1; data1 = 8'h03; data2 = 8'h07;
    #200 start = 1;
    #400 start = 0;
  end

initial
    forever #(t_PERIOD/2) clk <= ~clk;

always @(done) 
   if (done ==1)
       $finish;
    
endmodule
