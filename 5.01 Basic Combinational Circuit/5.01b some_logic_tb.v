module some_logic_tb();

reg A,B;
wire C;

some_logic dut(.a(A), .b(B), .c(C));

initial begin
    
    $monitor("A=%b, B=%b, C=%b", A,B,C);

    A=0; B=0; 
    #2;

    A=0; B=1; 
    #2;

    A=1; B=0; 
    #2;

    A=1; B=1; 
    #2;

end
    
endmodule