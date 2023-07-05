module modulo_n_counter #(parameter N =13 , parameter cnt_width = 4) 
                         (clk, reset, enable, counter_out);

input clk, reset, enable;
output reg [cnt_width-1:0] counter_out;

always @(posedge clk or negedge reset) begin
    
        if (!reset)
            counter_out <= 0;

        else if (enable) begin

            if (counter_out == N-1)
            counter_out <= 0;

            else
            counter_out <= counter_out + 1'b1;
        end

end
    
endmodule