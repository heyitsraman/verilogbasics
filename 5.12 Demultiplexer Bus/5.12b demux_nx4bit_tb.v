module demux_nx4bit_tb ();

parameter n = 8;
reg [n-1:0]Y;
reg [1:0]SEL;
wire [n-1:0]A,B,C,D;
integer i=0;

demux_4xnbit dut(.a(A), .b(B), .c(C), .d(D), .sel(SEL), .y(Y));

initial begin
    
    $monitor("Time=%0t, Sel=%b, Y=%d, A=%d, B=%d, C=%d, D=%d", $time,SEL,Y,A,B,C,D);
    SEL=0; Y=0;
    
    for (i=0;i<12;i=i+1) begin
        SEL=$urandom(); Y=$urandom();
        #2;
    end

end
endmodule