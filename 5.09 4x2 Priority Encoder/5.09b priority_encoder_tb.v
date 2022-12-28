module priority_encoder_tb ();

reg [3:0]D;
wire [1:0]Q;
wire V;
integer i=0;

priority_encoder dut(.v(V), .d(D), .q(Q));

initial begin
    $monitor("Time=%0t, Data=%b, Valid=%b, Output=%d", $time, D, V, Q);
    D=0;

    for (i=0;i<4;i=i+1) begin
        D = (1<<i);
        #2;
    end

    #1; D=4'b1100;
    #1; D=4'b0011;
    #2; D=4'b0110;
    #2; D=4'b0000;
    #2; $stop;
end
    
endmodule