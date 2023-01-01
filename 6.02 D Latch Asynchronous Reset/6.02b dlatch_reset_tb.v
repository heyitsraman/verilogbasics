module dlatch_reset_tb();

reg D, ENABLE, RESET;
wire Q, Q_NOT;


dlatch_reset dut(.d(D), .enable(ENABLE), .reset(RESET), .q(Q), .q_not(Q_NOT));

initial begin
    $monitor("Time=%0t, ENABLE=%b, RESET=%b, D=%b, Q=%b, Q_NOT=%b", $time, ENABLE, RESET, D, Q, Q_NOT);
    ENABLE=0; RESET=0; D=0; #4;
    ENABLE=0; RESET=0; D=1; #3;
    ENABLE=0; RESET=1; D=0; #2;
    ENABLE=0; RESET=1; D=1; #3;
    ENABLE=1; RESET=0; D=0; #3;
    ENABLE=1; RESET=0; D=1; #2;
    ENABLE=1; RESET=1; D=0; #2;
    ENABLE=1; RESET=1; D=1; #3;

    $stop;
end
    
endmodule