module mux_4xnbit_tb ();

parameter n = 8;
reg [n-1:0]A,B,C,D;
reg [1:0] SEL;
wire [n-1:0]Y;
integer i=0;

mux_4xnbit dut(.a(A), .b(B), .c(C), .d(D), .sel(SEL), .y(Y));

initial begin
    $monitor("Time=%0t, A=%d, B=%d, C=%d, D=%d, SEL=%b, Y=%d", $time, A,B,C,D,SEL,Y);

    SEL=0; A=0; B=0; C=0; D=0;
    #1;

    for (i=0;i<8;i=i+1) begin
        
        SEL=$urandom() &3; A=$urandom() &255; 
        B=$urandom() &255; C=$urandom() &255; D=$urandom() &255; 
        #2;
    
    end
end
    
endmodule
