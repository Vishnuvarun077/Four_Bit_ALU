module enable(
    input E,
    input [3:0] A,
    input [3:0] B,
    output [3:0] C,
    output [3:0] D
);

and andgate1(C[0], E, A[0]);
and andgate2(C[1], E, A[1]);
and andgate3(C[2], E, A[2]);
and andgate4(C[3], E, A[3]);

and andgate5(D[0], E, B[0]);
and andgate6(D[1], E, B[1]);
and andgate7(D[2], E, B[2]);
and andgate8(D[3], E, B[3]);

endmodule
