module hex_7seg_tb ();

reg [3:0]DATA;
wire A,B,C,D,E,F,G;
integer i=0;

hex_7seg dut(.datain(DATA), .a(A), .b(B), .c(C), .d(D), .e(E), .f(F), .g(G));

initial begin
    
    $monitor("Time=%0t, DATA=%d, A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b", 
                                         $time, DATA, A, B, C, D, E, F, G);

    DATA=0;
    #3;
    
    for (i=0;i<16;i=i+1 ) begin
        DATA = i;
        #2;
    end

end
    
endmodule