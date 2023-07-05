module lfsr_16_tb ();

reg clk=1'b0;
reg reset, enable;
wire [15:0] lfsr;

//Instantiate the DUT
lfsr_16 dut(.clk(clk), .reset(reset), .enable(enable), .lfsr(lfsr));


//1MHz Clock signal
always begin
    #0.5;
    clk = ~clk;
end

//Create Stimulus
initial begin
    
    $monitor($time, "Enable=%b, LFSR=%0x", enable, lfsr);
    #1; 
    reset=1'b0; enable=1'b0;
    #1.2;
    reset=1'b1;

    repeat(2) @(posedge clk);
    enable=1'b1;

    repeat(10) @(posedge clk);
    enable=1'b0;

    #10;
    $stop;

end
    
endmodule