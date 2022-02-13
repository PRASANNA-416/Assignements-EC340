module addern (X, Y, carryin, S, carryout,sig);
  
  input carryin;
  intput sig;
  input [7:0] X, Y;
  output reg [8:0] S;
  output reg carryout;
  reg [8:0] C;
  integer k;
  always @(X, Y, carryin)
    if(sig == 1)
    begin
        C[0] = carryin;
      for (k = 0; k < 8; k = k+1)
        begin
              S[k] = X[k] ^ Y[k] ^ C[k];
              C[k+1] = (X[k] & Y[k]) | (X[k] & C[k]) | (Y[k] & C[k]);
        end
      carryout = C[8];
    end
    else 
        S = X - Y;
endmodule
