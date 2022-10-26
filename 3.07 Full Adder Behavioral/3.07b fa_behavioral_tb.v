module fa_behavioral_tb ();

reg A, B, Cin;
wire SUM, Cout;

//Instantiate the full adder module
    fa_behavioral FA3(.a(A), .b(B), .cin(Cin), .sum(SUM), .cout(Cout));

//Generate stimulus and monitor output
initial begin
    
    $monitor("A=%b, B=%b, Cin=%b, SUM=%b, CARRY=%b", A, B, Cin, SUM, Cout);

    A=0; B=0; Cin=0;
    #1;
    A=0; B=0; Cin=1;
    #1;
    A=0; B=1; Cin=0;
    #1;
    A=0; B=1; Cin=1;
    #1;
    A=1; B=0; Cin=0;
    #1;
    A=1; B=0; Cin=1;
    #1;
    A=1; B=1; Cin=0;
    #1;
    A=1; B=1; Cin=1;
    #1;
    $finish;

end
    
endmodule

