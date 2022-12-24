module comparator_1bit_tb ();

reg A,B;
wire SMALLER, EQUAL, GREATER;

comparator_1bit dut(.a(A), .b(B), .smaller(SMALLER), .equal(EQUAL), .greater(GREATER));

initial begin
    $monitor("A=%b, B=%b, SMALLER=%b, EQUAL=%b, GREATER=%b", A,B,SMALLER,EQUAL,GREATER);

    A=0; B=0; 
    #2;
    
    A=0; B=1;
    #3;

    A=1; B=0;
    #1;

    A=1; B=1;
    #4;

    $stop;
    
end
    
endmodule