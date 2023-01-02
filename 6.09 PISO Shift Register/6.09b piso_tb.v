module piso_tb ();

reg CLK, RESET, PRELOAD, DATA_IN;
reg [3:0]D;
wire DATA_OUT;
wire [3:0]Q;

piso dut (.clk(CLK), .reset(RESET), .pl(PRELOAD), .data_in(DATA_IN), .d(D), .data_out(DATA_OUT), .q(Q));

initial begin
    CLK=0;
    forever begin
        #1;
        CLK = ~CLK;
    end
end

initial begin
    
    $monitor("CLK=%b, RESET=%b, PRELOAD=%b, D=%b, DATA_IN=%b, Q=%b, DATA_OUT=%b",
                CLK, RESET, PRELOAD, D, DATA_IN, Q, DATA_OUT);

    RESET=0; D=4'b1101; DATA_IN=0; PRELOAD=0;
    #2;
    RESET=1;
    @(posedge CLK); PRELOAD=0; D=4'b0001; DATA_IN=1'b0;
    @(posedge CLK); PRELOAD=0; D=4'b1001; DATA_IN=1'b1;
    @(posedge CLK); PRELOAD=1; D=4'b0111; DATA_IN=1'b0;
    @(posedge CLK); PRELOAD=1; D=4'b1001; DATA_IN=1'b1;
    @(posedge CLK); PRELOAD=0; D=4'b1101; DATA_IN=1'b1;
    @(posedge CLK); PRELOAD=1; D=4'b1011; DATA_IN=1'b0;
    @(posedge CLK); PRELOAD=0; D=4'b0101; DATA_IN=1'b1;
    
    #3;
    $stop;

end
    
endmodule