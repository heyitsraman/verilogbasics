module sipo_tb ();

reg CLK, RESET;
reg SERIAL_DATA;
wire [3:0]Q;

sipo dut(.clk(CLK), .reset(RESET), .serial_data(SERIAL_DATA), .q(Q));

initial begin
    CLK=0;
    forever begin
        #1;
        CLK = ~CLK;
    end
end

initial begin
    
    $monitor("CLK=%b, RESET=%b, SERIAL DATA=%b, Q=%b", CLK, RESET, SERIAL_DATA, Q);
    RESET=0; SERIAL_DATA=0;
    #5;
    RESET=1;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b0;
    @(posedge CLK); SERIAL_DATA=1'b1;
    @(posedge CLK); SERIAL_DATA=1'b0;

    
    #3;
    $stop;
end
    

endmodule