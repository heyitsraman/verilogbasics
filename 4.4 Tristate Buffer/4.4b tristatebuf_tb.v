module tristatebuf_tb();

reg DIN,SEL;
wire DHIGH, DLOW;

tristatebuf dut(DIN,DHIGH,DLOW,SEL);

//Monitor and Generate Stimulus
initial begin
    $monitor("SEL=%b, DIN=%b, DHIGH=%b, DLOW=%b", SEL, DIN, DHIGH, DLOW);

    SEL=0; DIN=0; 
    #2;

    SEL=0; DIN=1; 
    #3;

    SEL=1; DIN=0; 
    #4;

    SEL=1; DIN=1; 
    #3;

    $stop;
    
end

    
endmodule