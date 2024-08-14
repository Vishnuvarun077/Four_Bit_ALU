module Add_testbench;
    reg M;
    reg [3:0] A, B;
    wire [3:0] S;
    wire cout;

    Adder_Subtractor UUT (
        .M(M), .A(A), .B(B), .S(S), .cout(cout)
    );

    initial begin
        $dumpfile("Adder_subtractertest.vcd");
        $dumpvars(0, Add_testbench);

        // Initialize inputs
        M = 0; A = 4'b0000; B = 4'b0000;

        // Apply test vectors
        #10 M = 0; A = 4'b1010; B = 4'b0011;
        #10 M = 0; A = 4'b0000; B = 4'b1111;
        #10 M = 0; A = 4'b0000; B = 4'b1111;
         #10 M = 1; A = 4'b1111; B = 4'b1111;
        #10 M = 1; A = 4'b1111; B = 4'b0000;
        #10 M=1; A=4'b1010; B = 4'b0010;
        // Finish the simulation
        #10 $finish;
    end
endmodule
