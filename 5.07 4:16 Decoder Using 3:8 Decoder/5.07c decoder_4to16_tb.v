module decoder_4to16_tb();

reg [3:0]A;
wire [15:0]Y;
integer i;

decoder_4to16 dut(.a(A), .Y(Y));

initial begin
    $monitor("Time=%0t, A=%d, Y=%b", $time, A, Y);
    A=0;
    for (i=0;i<16;i=i+1) begin
        A=i;
        #2.75;
    end
end
    
endmodule