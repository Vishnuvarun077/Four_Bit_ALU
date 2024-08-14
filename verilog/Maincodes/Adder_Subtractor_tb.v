module Adder_Subtractor_tb;

    reg M;
    reg [3:0] A, B;
    wire [3:0] S;
    wire cout;

    // Instantiate the module under test
    Adder_Subtractor UUT (
        .M(M),
        .A(A),
        .B(B),
        .S(S),
        .cout(cout)
    );

    initial begin
        $dumpfile("Adder_Subtractor_tb.vcd");
        $dumpvars(0, Adder_Subtractor_tb);

        // Initialize inputs
        M = 0;
        A = 4'b1010;
        B = 4'b0011;

        // Apply test vectors
        #10 M = 0; A = 4'b1010; B = 4'b0011;
        #20 $display("M=0, A=1010, B=0011, S=%b, Cout=%b", S, cout);

        #30 M = 0; A = 4'b0000; B = 4'b1111;
        #40 $display("M=0, A=0000, B=1111, S=%b, Cout=%b", S, cout);

        #50 M = 0; A = 4'b1100; B = 4'b0010;
        #60 $display("M=0, A=1100, B=0010, S=%b, Cout=%b", S, cout);

        #70 M = 0; A = 4'b1111; B = 4'b1111;
        #80 $display("M=0, A=1111, B=1111, S=%b, Cout=%b", S, cout);

        #90 M = 1; A = 4'b1010; B = 4'b0011;
        #100 $display("M=1, A=1010, B=0011, S=%b, Cout=%b", S, cout);

        #110 M = 1; A = 4'b0000; B = 4'b1111;
        #120 $display("M=1, A=0000, B=1111, S=%b, Cout=%b", S, cout);

        #130 M = 1; A = 4'b1100; B = 4'b0010;
        #140 $display("M=1, A=1100, B=0010, S=%b, Cout=%b", S, cout);

        // Finish the simulation
        #150 $finish;
    end

endmodule
