module clockdiv_nbit_tb ();

parameter cnt_width = 3;
reg clk, reset;
wire clk_div2;
wire [cnt_width:0]counter;

clockdiv_nbit #(.cnt_width(cnt_width)) clockdiv0(.clk(clk), .reset(reset), .counter(counter), .clk_div2(clk_div2));

//Clock signal
initial begin
    clk = 1'b0;
    forever begin
        #1;
        clk = ~clk;
    end
end


//Create Stimulus
initial begin
    
       #1; reset=1'b0;
       #1; reset=1'b1;
       repeat(20) @(posedge clk);

       $stop;

end
    
endmodule