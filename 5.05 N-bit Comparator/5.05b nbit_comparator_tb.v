module nbit_comparator_tb ();

parameter N = 7;
reg [N-1:0]A,B;
wire S,E,G;

nbit_comparator dut(.a(A), .b(B), .smaller(S), .equal(E), .greater(G));

initial begin
    $monitor("A=%d, B=%d, Smaller=%d, Equal=%d, Greater=%d", A,B,S,E,G);

    A=39; B=43;
    #3;

    A=65; B=56;
    #3;

    A=70; B=70;
    #3;

    A=32; B=23;
    #3;

    $stop;
end
    
endmodule