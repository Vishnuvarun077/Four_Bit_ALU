`include "TwoToFourDecoder.v"
`include "enable.v"
`include "Adder_Subtractor.v"
`include "comparator.v"
`include "AndBlock.v"

module alu (
    input [1:0] S,
    input [3:0] A,
    input [3:0] B,
    output [3:0] Y_add,
    output [3:0] Y_sub,
    output carry_add,
    output carry_sub,
    output [3:0] Y_and,
    output  AGB,
    output  AEB,
    output  ALB
);

    wire [3:0] A_add, B_add, A_sub, B_sub;
    wire [3:0] A_comp, B_comp, A_and, B_and;
    wire [3:0] AddSubResult; 
    wire [3:0] MuxSelect;

    // 2-to-4 Decoder
    TwoToFourDecoder Decoder (
        .A0(S[0]),
        .A1(S[1]),
        .D0(MuxSelect[0]),
        .D1(MuxSelect[1]),
        .D2(MuxSelect[2]),
        .D3(MuxSelect[3])
    );

    // Enable Block for Addition
    enable EnableAdd (
        .E(MuxSelect[0]),
        .A(A),
        .B(B),
        .C(A_add),
        .D(B_add)
    );

    // Enable Block for Subtraction
    enable EnableSub (
        .E(MuxSelect[1]),
        .A(A),
        .B(B),
        .C(A_sub),
        .D(B_sub)
    );

    // Enable Block for Comparison
    enable EnableComp (
        .E(MuxSelect[2]),
        .A(A),
        .B(B),
        .C(A_comp),
        .D(B_comp)
    );

    // Enable Block for AND operation
    enable EnableAnd (
        .E(MuxSelect[3]),
        .A(A),
        .B(B),
        .C(A_and),
        .D(B_and)
    );

    // Adder/Subtractor for addition
    Adder_Subtractor Add (
        .M(MuxSelect[1]),
        .A(A_add),
        .B(B_add),
        .S(Y_add),
        .cout(carry_add)
    );

    // Adder/Subtractor for subtraction
    Adder_Subtractor Sub (
        .M(MuxSelect[1]),
        .A(A_sub),
        .B(B_sub),
        .S(Y_sub),
        .cout(carry_sub)
    );
    
    // Comparator
    comparator Comparator (
        .A(A_comp),
        .B(B_comp),
        .AGB(AGB),
        .AEB(AEB),
        .ALB(ALB)
    );

    // AND Block
    AndBlock And (
        .A(A_and),
        .B(B_and),
        .Y(Y_and)
    );

endmodule
