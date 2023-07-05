module counter_nbit_tb();

parameter cnt_width = 3;
reg clk = 1'b0;
reg reset;
wire [cnt_width:0] counter;

//Instantiate the DUT
counter_nbit #(.cnt_width(cnt_width)) dut(.clk(clk), .reset(reset), .counter(counter));


//Clock signal
always begin #0.5; clk = ~clk; end

//Create Stimulus
initial begin
    
    $monitor($time, " Counter=%d", counter);
    #1;
    reset=1'b0;
    #1.2;
    reset=1'b1;
    #30;
    $stop;

end

    
endmodule