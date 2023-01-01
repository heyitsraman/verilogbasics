`timescale 1us/1ns
module dff_syncreset_tb ();

reg CLK=0,D,RESET;
wire Q,Qnot;

dff_syncreset dut(.d(D), .clk(CLK), .reset(RESET), .q(Q), .qnot(Qnot));

always begin
    #0.5;
    CLK = ~CLK;
end

initial begin
    
    $monitor("CLK=%b, RESET=%b, D=%b, Q=%b, Qnot=%b", CLK, RESET, D, Q, Qnot);
    RESET=0; D=0; #3;
    RESET=0; D=1; #2;
    RESET=1; D=0; #3;
    RESET=1; D=1; #2;
    $stop;

end

endmodule