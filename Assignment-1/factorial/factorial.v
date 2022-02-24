module factorial(clk,reset,start,xin,done,fact);
    parameter N=4;
    input clk,reset,start;
    input [N-1:0] xin;
    output reg done;
    output reg [15:0] fact;
    reg [15:0] N_q,N_d;
    reg [3:0] count_q,count_d;
    parameter [1:0] s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
    reg [1:0] nxt_st,pst_st;


always @(posedge clk or posedge reset)
    begin
    if (reset)
    begin
        pst_st <= s0;
        N_q<=0;
        count_q<=0;
    end
    else
    begin
        pst_st <= nxt_st;
        N_q<=N_d;
        count_q<=count_d;
    end
    end

always @(*)
    begin
    case(pst_st)
        s0: if(start==1'b1) nxt_st=s1;else nxt_st=s0;
        s1: nxt_st=s2;
        s2: if(count_d>0) nxt_st=s2;else nxt_st=s3;
        s3: if(start==1'b1) nxt_st=s3;else nxt_st=s0;
        default:nxt_st=s0;
    endcase
    end

always @(*)
    begin
    N_d=N_q;count_d=count_q;done=0;fact=0;
    case(pst_st)
        s1:begin N_d=xin;count_d= xin - 1;end
        s2: begin N_d=N_q * count_q;count_d = count_q - 1;end
        s3: begin done=1; fact=N_q;end
    endcase
    end
endmodule
