module dff_asyncreset (clk,d,reset,q,qnot);

input clk,d,reset;
output reg q;
output qnot;

always @(posedge clk or negedge reset) begin
    
    if (!reset) begin
        q <= 1'b0;
    end

    else
        q <= d;
        
end

assign qnot = ~q;
    
endmodule