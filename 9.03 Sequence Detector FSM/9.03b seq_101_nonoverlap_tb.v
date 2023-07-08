`timescale 1us/1ns
module seq_101_nonoverlap_tb ();

reg clk=0, reset;
reg seq_in=1'b0;
wire seq_detected;
wire [1:0] state_out;

reg [0:13] test_vect = 14'b00_1100_0101_0101;
integer i;

//Instantiate the Module
seq_101_nonoverlap dut (.clk(clk), .reset(reset), .seq_in(seq_in), .seq_detected(seq_detected),
                                                                   .state_out(state_out));


always begin #1 clk = ~clk; end

initial begin

        $monitor("Time=%0d", $time, " i=%0d, Seq_In=%b, Seq_detected=%b",i, seq_in, seq_detected);
        reset = 0;
        #1;
        reset = 1;     

        for (i=0; i<14; i=i+1) begin
                seq_in = test_vect[i];
                #2;
        end

        for (i =0;i<15 ;i=i+1) begin
                seq_in = $random;
                @(posedge clk);
       
        end

         //Enable the semaphore again 
        repeat(10) @(posedge clk);
        @(posedge clk);
        #40 $stop;
end
endmodule