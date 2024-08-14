 `include "fulladder.v"


module Adder_Subtractor(
    input M,
    input [3:0] A,
    input [3:0] B,
    output [3:0] S,
    output cout
);
wire W0,W1,W2,W3,C0,C1,C2;
xor xorgate1(W0,M,B[0]);
xor xorgate2(W1,M,B[1]);
xor xorgate3(W2,M,B[2]);
xor xorgate4(W3,M,B[3]);

fulladder fulladderblock1(.A(W0), .B(A[0]), .Cin(M), .S(S[0]), .Cout(C0));
fulladder fulladderblock2(.A(W1), .B(A[1]), .Cin(C0), .S(S[1]), .Cout(C1));
fulladder fulladderblock3(.A(W2), .B(A[2]), .Cin(C1), .S(S[2]), .Cout(C2));
fulladder fulladderblock4(.A(W3), .B(A[3]), .Cin(C2), .S(S[3]), .Cout(cout));

// Invert cout when M is 1
// assign cout = (M == 1) ? ~Cout : Cout;
endmodule
