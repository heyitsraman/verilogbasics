`timescale 1us/1ns
module traffic_light_tb ();

reg clk=0;
reg reset;
reg enable;
wire red, yellow, green;
wire [3:0] state_out;

//Parameters used for testbench flow
parameter OFF=4'd0;
parameter RED=4'd1;
parameter YELLOW=4'd4;
parameter GREEN=4'd8;

//Instantiate the module
traffic_light dut(.clk(clk), .reset(reset), .enable(enable), .red(red), .yellow(yellow),
                  .green(green), .state_out(state_out));


//Clock Signal
always begin #1 clk = ~clk; end

//Create Stimulus
initial begin
    
        $monitor("Time=%0d",$time, " Enable=%b, Red=%b, Yellow=%b, Greem=%b", enable, red, yellow, green);
        reset=0;
        #4;
        reset=1;
        enable=0;
        repeat(10) @(posedge clk);
        enable=1;

        //Take two cycles
        repeat(2) begin
            wait (state_out === GREEN);
            @(state_out);                   //wait for Green to be over
        end 

        //Disable during Yellow
        wait (state_out === YELLOW);
        @(posedge clk);
        enable=0;

        //Enable again
        repeat(10) @(posedge clk);
        @(posedge clk);
        enable=1;

        #40 $stop; 
end
endmodule