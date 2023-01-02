module shift_lr_tb ();

reg CLK, RESET, LOAD_ENABLE, SEL;
reg [7:0]IN;
wire [7:0]Q;

shift_lr dut(.clk(CLK), .reset(RESET), .load_enable(LOAD_ENABLE), .sel(SEL), .in(IN), .q(Q));

initial begin
    CLK=0;
    forever begin
        #1;
        CLK = ~CLK;
    end
end

initial begin
    
    $monitor("CLK=%b, RESET=%b, LOAD_ENABLE=%b, IN=%b, SEL=%b, Q=%b", CLK, RESET, LOAD_ENABLE, IN,
                    SEL, Q);
    
    RESET=0; LOAD_ENABLE=0; IN=8'd45; SEL=0; 
    #1;
    RESET=1;
    @(posedge CLK); LOAD_ENABLE=0; IN=8'd144; SEL=0;
    @(posedge CLK); LOAD_ENABLE=1; IN=8'd54; SEL=0;
    @(posedge CLK); LOAD_ENABLE=1; IN=8'd95; SEL=1;
    @(posedge CLK); LOAD_ENABLE=0; IN=8'd47; SEL=1;  
    @(posedge CLK); LOAD_ENABLE=1; IN=8'd124; SEL=0;
    @(posedge CLK); LOAD_ENABLE=0; IN=8'd163; SEL=1;
    @(posedge CLK); LOAD_ENABLE=0; IN=8'd244; SEL=0;
    @(posedge CLK); LOAD_ENABLE=1; IN=8'd123; SEL=1;
    @(posedge CLK); LOAD_ENABLE=1; IN=8'd7; SEL=0;

    #3;
    $stop;
    
end
    
endmodule