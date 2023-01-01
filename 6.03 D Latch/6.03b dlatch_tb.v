module dlatch_tb();

reg D, ENABLE;
wire Q, Q_NOT;


dlatch dut(.d(D), .enable(ENABLE), .q(Q), .q_not(Q_NOT));

initial begin
    $monitor("Time=%0t, ENABLE=%b, D=%b, Q=%b, Q_NOT=%b", $time, ENABLE, D, Q, Q_NOT);
    ENABLE=0; D=0; #4;
    ENABLE=0; D=1; #3;
    ENABLE=1; D=0; #2;
    ENABLE=1; D=1; #3;
    $stop;
end
    
endmodule