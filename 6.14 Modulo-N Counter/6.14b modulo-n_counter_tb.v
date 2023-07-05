module modulo_n_counter_tb ();

parameter N = 13;
parameter cnt_width = 4;

reg clk, reset, enable;
wire [cnt_width-1:0]counter_out;

//Instantiate the dut
modulo_n_counter #(.N(N), .cnt_width(cnt_width)) dut(.clk(clk), .reset(reset), .enable(enable),
                            .counter_out(counter_out));

initial begin
    clk = 1'b0;
    forever begin
        #1;
        clk = ~clk;
    end
end


initial begin
    
        $monitor($time, " Enable=%b, Counter=%d", enable, counter_out);
        #1;
        reset=1'b0;
        enable=0;
        #1;
        reset=1'b1;
        repeat(3) @(posedge clk);   enable=1;
        repeat(14) @(posedge clk);

        $stop;
end
    
endmodule