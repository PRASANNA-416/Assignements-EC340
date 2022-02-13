module decade(load,reset,data_in,counter_on,counter_up,clock,TC,count);
  
  input [3:0]data_in;
  input load,reset,counter_on,counter_up,clock;
  output reg [3:0]count;
  output reg TC;
  
  always @(posedge reset,posedge clock)
    if(reset)
        count <= 0;
  else if (counter_on == 1 & counter_up == 1)
      if(count == 4'b1001)
        TC <= 1;
      else
        count <= count + 1;
  else if (counter_on == 1 & counter_up == 0)
    if(count == 0)
        TC <= 1;
      else
        count <= count - 1;
  
endmodule
      
        
    
