module demux_1bit_tb ();

reg X,S;
wire Y0,Y1;

demux_1bit dut(S,X,Y0,Y1);

//Generate Stimulus
initial begin
    $monitor("S=%b, X=%b, Y0=%b, Y1=%b", S,X,Y0,Y1);

    S=0; X=0;
    #2;
    S=0; X=1;
    #2;
    S=1; X=0;
    #2;
    S=1; X=1;
    #5;
    $stop;

end
    
endmodule