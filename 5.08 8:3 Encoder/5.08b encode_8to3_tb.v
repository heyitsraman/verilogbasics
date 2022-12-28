module encoder_8to3_tb ();

reg [7:0]D;
wire [2:0]Y;
reg EN;
integer i=0;

encoder_8to3 dut(.d(D), .enable(EN), .y(Y));

initial begin
    $monitor("Time=%0t, Data=%b, Enable=%b, Y=%d", $time, D, EN, Y);
    EN=0; D=0;
    #2;
    for (i=0;i<8;i=i+1) begin
        D=(1<<i);
        EN=1;
        #1;
    end
    
    #1;
    EN=1;
    D=8'b1100_1111;
    #1;
    $stop;
end
    
endmodule