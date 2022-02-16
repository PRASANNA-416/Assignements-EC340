module multiplier(input clock, reset_n, start,input [3:0] DataA, DataB,output reg [7:0] product, output reg done);

    reg [1:0] Comp_d ,Comp_q;

    parameter [1:0] S0=2'b00, S1=2'b01, S2=2'b10;
    reg [1:0] cp_fsm_d, cp_fsm_q;
    reg [3:0] N_zeros, B_d, B_q;
    reg [7:0] A_d, A_q,pdt_d, pdt_q;

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
        cp_fsm_d = cp_fsm_q; done = 1'b0;
        case (cp_fsm_q)
            S0: if (start == 1) cp_fsm_d = S1;
            S1: if (B_q == 0) cp_fsm_d = S2;
            S2: begin done = 1'b1; if (start == 0) cp_fsm_d = S0; end
            default: cp_fsm_d = S0;
        endcase
    end

    always @(*)
    begin
        pdt_d = pdt_q; A_d = A_q; B_d = B_q;Comp_d = Comp_q;
        case (cp_fsm_q)
        S0: begin
            pdt_d = 8'b0;            
            B_d = DataB;
            Comp_d = 2'b11;
            if (DataA[3] == 1'b1)
            begin
                A_d[3:0] = DataA;
                A_d[7:4] = 4'b1111;
            end
            else 
                A_d = DataA;
            end
        S1: begin
            A_d = A_q << 1;
            B_d = B_q >> 1;
            if ((B_q[0] == 1'b1) && Comp_q != 0)
                pdt_d = A_q + pdt_q ;
            else if ((B_q[0] == 1'b1) && Comp_q == 0)
                pdt_d = (~A_q + 1) + pdt_q;
            Comp_d = Comp_q - 1;
            end
            S2: product = pdt_q;
            default: pdt_d = pdt_q;
        endcase
    end
endmodule
