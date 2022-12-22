module mux_1bit_tb ();

reg X,A,B;
wire Y;

mux_1bit dut(A,B,X,Y);

//Generate Stimulus
initial begin
    $monitor("X=%b, A=%b, B=%b, Y=%b", X,A,B,Y);

    A=0; B=0; X=0;
    #2;
    A=0; B=0; X=1;
    #2;
    A=0; B=1; X=0;
    #2;
    A=0; B=1; X=1;
    #2;
    A=1; B=0; X=0;
    #2;
    A=1; B=0; X=1;
    #2;
    A=1; B=1; X=0;
    #2;
    A=1; B=1; X=1;
    #5;
    $stop;

end
    
endmodule