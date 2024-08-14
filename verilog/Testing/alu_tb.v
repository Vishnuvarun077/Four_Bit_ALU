`timescale 1ns/1ps

module alu_tb;

    reg [1:0] S;
    reg enable;
    reg [3:0] A, B;
    wire [4:0] Y; // Update the width to 5 bits
    wire AGB, AEB, ALB;

    // Instantiate the ALU module
    alu uut (
        .S(S),
        .enable(enable),
        .A(A),
        .B(B),
        .Y(Y),
        .AGB(AGB),
        .AEB(AEB),
        .ALB(ALB)
    );

    // Define a clock signal for simulation
    reg clk = 0;

    // Toggle the clock signal
    always #5 clk = ~clk;

    // Initial block
    initial begin
        // Open VCD file for waveform dump
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        // Initialize inputs
        S = 2'b00;
        enable = 1;
        A = 4'b1100;
        B = 4'b0011;

        // Apply test cases
        #10;
        S = 2'b01; // Subtraction
        #10;
        S = 2'b10; // Comparison
        #10;
        S = 2'b11; // AND operation
        #10;

        // Display results
        $display("Y = %b", Y);
        $display("AGB = %b, AEB = %b, ALB = %b", AGB, AEB, ALB);

        // Finish simulation
        $finish;
    end

    // Always block for clock generation
    always begin
        #2 clk = ~clk;
    end

endmodule
