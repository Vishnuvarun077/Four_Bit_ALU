

module And_testbench;
    reg [3:0] A, B;
    wire [3:0] Y;

    AndBlock UUT (
        .A(A), .B(B), .Y(Y)
    );

    initial begin
        $dumpfile("testand.vcd");
        $dumpvars(0, And_testbench);

        // Initialize inputs
        A = 4'b0000; B = 4'b0000;

        // Apply test vectors
        #10 A = 4'b1010; B = 4'b0110;
        #10 A = 4'b1111; B = 4'b0000;
        #10 A = 4'b1010; B = 4'b1010;

        // Finish the simulation
        #10 $finish;
    end
endmodule
