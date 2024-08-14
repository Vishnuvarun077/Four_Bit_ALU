module comparator(
    input [3:0] A,
    input [3:0] B,
    output AGB,
    output AEB,
    output ALB
);

// Internal wires
wire D0, D1, D2, D3, D4, D5, D6, D7;

xnor xnorgate1(D0, A[3], B[3]);
xnor xnorgate2(D1, A[2], B[2]);
xnor xnorgate3(D2, A[1], B[1]);
xnor xnorgate4(D3, A[0], B[0]);

and andgate5(AEB, D0, D1, D2, D3);

and andgate6(D4, A[3], ~B[3]);
and andgate7(D5, D3, A[2], ~B[2]);
and andgate8(D6, D3, D2, A[1], ~B[1]);
and andgate9(D7, D3, D2, D1, A[0], ~B[0]);

or orgate1(AGB, D4, D5, D6, D7);

and andgate10(ALB, ~AGB, ~AEB);

endmodule
