module counter_nbit #(parameter cnt_width = 3) (clk, reset, counter);

input clk, reset;
output reg [cnt_width:0] counter;

//Use non-blocking assignment for sequential logic

always @(posedge clk or negedge reset) begin

    if(!reset)
        counter <= 0;
    else
        counter <= counter + 1'b1;
    
end
    
endmodule