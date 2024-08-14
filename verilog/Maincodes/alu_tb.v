module alu_tb;

    reg [1:0] S;
    reg [3:0] A, B;
    wire [3:0] Y_add, Y_sub, Y_and;
    wire carry_add, carry_sub;
    wire AGB, AEB, ALB;

    alu UUT (
        .S(S),
        .A(A),
        .B(B),
        .Y_add(Y_add),
        .Y_sub(Y_sub),
        .carry_add(carry_add),
        .carry_sub(carry_sub),
        .Y_and(Y_and),
        .AGB(AGB),
        .AEB(AEB),
        .ALB(ALB)
    );

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        // Test case 1: S = 00 (Addition)
        S = 2'b00;
        A = 4'b1110;
        B = 4'b0001;
        #10 $display("Test Case 1: S=00, A=1010, B=0011 (Addition)");
        #50 $display("Y_add=%b, carry_add=%b", Y_add, carry_add);

        // Test case 2: S = 01 (Subtraction)
        S = 2'b01;
        A = 4'b1010;
        B = 4'b0011;
        #60 $display("Test Case 2: S=01, A=1010, B=0011 (Subtraction)");
        #110 $display("Y_sub=%b, carry_sub=%b", Y_sub, carry_sub);

        // Test case 3: S = 10 (Comparison)
        S = 2'b10;
        A = 4'b1010;
        B = 4'b0011;
        #120 $display("Test Case 3: S=10, A=1010, B=0011 (Comparison)");
        #170 $display("AGB=%b, AEB=%b, ALB=%b", AGB, AEB, ALB);

        // Test case 4: S = 11 (AND)
        S = 2'b11;
        A = 4'b1010;
        B = 4'b0011;
        #180 $display("Test Case 4: S=11, A=1010, B=0011 (AND)");
        #230 $display("Y_and=%b", Y_and);

        $finish;
    end

endmodule
