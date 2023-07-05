module clk_div3_tb  ();

reg clk, reset;
wire clk_out;

//Instantiate the dut
clk_div3 dut(clk, reset, clk_out);

//Clock Signal
initial begin
    clk=1'b0;
    forever begin
        #1;
        clk = ~clk;
    end
end

//Create Stimulus
initial begin
    
    #1;
    reset=1'b0;
    @(posedge clk);
    reset=1'b1;
    repeat(5) @(posedge clk);
    #5;
    $stop;

end
    
endmodule