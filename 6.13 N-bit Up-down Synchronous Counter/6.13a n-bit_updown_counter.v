module updown_counter #(parameter CNT_WIDTH = 3) (clk,reset,load_en,up_down,counter_in,counter_out);
 input clk;
 input reset;
 input load_en;
 input [CNT_WIDTH-1:0] counter_in;
 input up_down;
 output reg [CNT_WIDTH-1:0] counter_out;



 always @(posedge clk or negedge reset) begin
    if (!reset) begin
        counter_out <= 0;
    end
    else if (load_en) begin
        counter_out <= counter_in;
    end
    else begin
        if (up_down == 1'b1) begin
            counter_out <= counter_out + 1'b1;
        end
        else begin
            counter_out <= counter_out - 1'b1;
        end

    end
    
 end

endmodule