module AndBlock (
    input [3:0] A,
    input [3:0] B,
    output [3:0] Y
);
    wire [3:0] AndResult;

    and andgate1(AndResult[0], A[0], B[0]);
    and andgate2(AndResult[1], A[1], B[1]);
    and andgate3(AndResult[2], A[2], B[2]);
    and andgate4(AndResult[3], A[3], B[3]);

    assign Y = AndResult;
endmodule
