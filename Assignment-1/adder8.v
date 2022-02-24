module adder8(input [7:0] A, input [7:0] B, input Ci,output [7:0] S, output Co );
  
  module fulladder(input ai, bi, ci, output sum, cout);
      assign sum = ai ^ bi ^ ci;
      assign cout = (ai & bi) | (ai & ci) | (bi & ci); 
 endmodule
  wire [3:1] C;
  fulladder
      ufa1 (.ai(A[0]), .bi(B[0]), .ci(Ci), .sum(S[0]), .cout(C[1])),
      ufa2 (A[1], B[1], C[1], S[1], C[2]),
      ufa3 (A[2], B[2], C[2], S[2], C[3]),
      ufa4 (A[3], B[3], C[3], S[3], C[4]),
      ufa5 (A[4], B[4], C[4], S[4], C[5]),
      ufa6 (A[5], B[5], C[5], S[5], C[6]),
      ufa7 (A[6], B[6], C[6], S[6], Co);
endmodule
