module dlatch_reset (d,enable,reset,q,q_not);

input d, enable, reset;
output reg q;
output q_not;

always @(d or enable or reset) begin
        if (!reset) begin                   //Active Low Reset
            q <= 1'b0;
        end

        else if (enable) begin
            q <= d;
        end
end

assign q_not = ~q;
    
endmodule