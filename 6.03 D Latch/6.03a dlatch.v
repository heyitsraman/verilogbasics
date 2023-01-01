module dlatch(d,enable,q,q_not);

input d, enable;
output reg q;
output q_not;

always @(d or enable) begin              
        if (enable) begin
            q <= d;
        end
end

assign q_not = ~q;
    
endmodule