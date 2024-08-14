

module testbench;

  reg [3:0] A, B; 
  wire AGB, AEB, ALB;

  comparator uut (
    .A(A),     
    .B(B),     
    .AGB(AGB),
    .AEB(AEB),
    .ALB(ALB)
  );

  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  initial begin
    $dumpfile("comparator_tb.vcd");
    $dumpvars(0, testbench);



    // A > B
    A = 4'b1010; // A = 1010
    B = 4'b0111; // B = 0111
    #10; 
    $display("Output: AGB=%b, AEB=%b, ALB=%b", AGB, AEB, ALB);
    
    // A = B
    A = 4'b1001; // A = 1001
    B = 4'b1001; // B = 1001
    #10; 
    $display("Output: AGB=%b, AEB=%b, ALB=%b", AGB, AEB, ALB);
    
    // A < B
    A = 4'b0111; // A = 0111
    B = 4'b1100; // B = 1100
    #10; 
    $display("Output: AGB=%b, AEB=%b, ALB=%b", AGB, AEB, ALB);

    $finish;
  end

  always begin
    #2 clk = ~clk;
  end

endmodule
