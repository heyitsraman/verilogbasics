module nbit_adder_tb ();

parameter N = 3;
reg [N-1:0]A,B;
wire [N:0]SUM;

nbit_adder dut (.a(A), .b(B), .sum(SUM));

initial begin
    $monitor("A=%d, B=%d, SUM=%d", A,B,SUM);

    A=3'd7; B=3'd7;
    #2;

    A=3'd1; B=3'd5;
    #2;

    A=3'd2; B=3'd1;
    #2;

    A=3'd0; B=3'd7;
    #2;

    A=3'd3; B=3'd3;
    #2;

    $stop;
end
    
endmodule