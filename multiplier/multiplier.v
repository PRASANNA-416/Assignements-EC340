module multiplier(input clock, reset_n, start,
                  input [7:0] DataA, DataB,
                  output reg [15:0] product, 
output reg done);

reg [1:0] Comp_d ,Comp_q;

parameter [1:0] S0=2'b00, S1=2'b01, S2=2'b10;
  reg [1:0] cp_fsm_d, cp_fsm_q;
  reg [7:0] N_zeros, B_d, B_q;
  reg [15:0] A_d, A_q,pdt_d, pdt_q;

always @(posedge clock or posedge reset_n)
begin
    if (reset_n == 0) cp_fsm_q <= S0;
    else 
    begin
        cp_fsm_q <= cp_fsm_d;
        pdt_q <= pdt_d;
        A_q <= A_d;
        B_q <= B_d;
        Comp_q <= Comp_d;
    end
end

always @(*)
begin
    pdt_d = pdt_q; A_d = A_q; B_d = B_q;Comp_d = Comp_q;cp_fsm_d = cp_fsm_q; done = 1'b0;
    case (cp_fsm_q)
    S0: begin
      if (start == 1) cp_fsm_d = S1;
      pdt_d = 16'b0;
      if (DataA[7] == 1'b1)
        begin
          A_d[7:0] = DataA;
          A_d[15:8] = 8'b1111;
        end
        else 
            A_d = DataA;
        B_d = DataB;
        Comp_d = 2'b11;
      pdt_d = 0;pdt_q = 0;
    end
    S1: begin
        if (B_q == 0) cp_fsm_d = S2;
        A_d = A_q << 1;
        B_d = B_q >> 1;
        if ((B_q[0] == 1'b1) && Comp_q != 0)
            pdt_d = A_q + pdt_q ;
        else if ((B_q[0] == 1'b1) && Comp_q == 0)
            pdt_d = (~A_q + 1) + pdt_q;
       Comp_d = Comp_q - 1;
    end
      S2: begin done = 1'b1; if (start == 0) cp_fsm_d = S0;product = pdt_q;end
      default: begin pdt_d = pdt_q;cp_fsm_d = S0;end
    endcase
end
endmodule
