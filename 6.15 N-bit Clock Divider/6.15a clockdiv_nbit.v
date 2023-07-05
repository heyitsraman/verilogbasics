module clockdiv_nbit #(parameter cnt_width = 3)(clk, reset, clk_div2, counter);

input clk, reset;
output reg clk_div2;
output  [cnt_width:0] counter;


always @(posedge clk or negedge reset) begin

    if(!reset)
        clk_div2 <= 0;
    else
        clk_div2 = ~clk_div2;
    
end

counter_nbit #(.cnt_width(cnt_width)) counter0(.clk(clk), .reset(reset), .counter(counter));

    
endmodule