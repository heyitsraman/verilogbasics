module clk_div3 (clk,reset,clk_out);

input clk,reset;
output clk_out;

reg qa,qb,qc;

always @(posedge clk or negedge reset) begin

//Counter counts modulo 3 (1--->4--->2--->1)

    if (!reset) begin
        qa <= 1'b0;
        qb <= 1'b0;
        qc <= 1'b0;
    end

    else begin
        qa <= ~(qa|qb);
        qb <= qa;
        qc <= qb;
    end
    
end

assign clk_out = qc | qb;
    
endmodule