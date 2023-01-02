module pipo_tb ();

reg CLK, RESET;
reg [3:0]D;
wire [3:0]Q;
integer i=0;

pipo dut(.clk(CLK), .reset(RESET), .d(D), .q(Q));

initial begin
    CLK=0;
    forever begin
        #1;
        CLK = ~CLK;
    end
end

initial begin
    
    $monitor("CLK=%b, RESET=%b, D=%b, Q=%b", CLK, RESET, D, Q);
    RESET=0; D=0;
    #5;
    RESET=1;
    for (i=0;i<16;i=i+1) begin
        @(posedge CLK)
        D=$random;
        #2;
    end
    
    #3;
    $stop;
end
    

endmodule