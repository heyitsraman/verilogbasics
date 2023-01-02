module siso_tb ();

reg CLK, RESET;
reg DATA_IN;
wire DATA_OUT;
wire [3:0]Q;

siso dut(.clk(CLK), .reset(RESET), .data_in(DATA_IN), .data_out(DATA_OUT), .q(Q));

initial begin
    CLK=0;
    forever begin
        #0.5;
        CLK = ~CLK;
    end
end

initial begin
    
    $monitor("CLK=%b, RESET=%b, DATA_IN=%b, Q=%b, DATA_OUT=%b", CLK, RESET, DATA_IN, Q, DATA_OUT);
    RESET=0; DATA_IN=0;
    #1;
    RESET=1;
    @(posedge CLK); DATA_IN=1'b0;
    @(posedge CLK); DATA_IN=1'b1;
    @(posedge CLK); DATA_IN=1'b1;
    @(posedge CLK); DATA_IN=1'b0;
    @(posedge CLK); DATA_IN=1'b1;
    @(posedge CLK); DATA_IN=1'b1;
    @(posedge CLK); DATA_IN=1'b0;
    @(posedge CLK); DATA_IN=1'b1;
    @(posedge CLK); DATA_IN=1'b0;
    @(posedge CLK); DATA_IN=1'b1;
    
    #3;
    $stop;
end
    

endmodule