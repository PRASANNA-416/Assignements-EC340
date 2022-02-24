module dff(
    input d,
    input reset,
    input clock,
    output reg q
    );
    always @(posedge clock)
        begin
          if (reset==1'b1) 
             q <=0; 
          else
            q <= d;
        end
endmodule
