module fulladder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
    
    assign sum = a^b^cin;
    assign cout = (a & cin) | (a & b) | (b & cin);
endmodule
