module pipo (clk,reset,d,q);

input clk,reset;
input [3:0]d;
output reg [3:0]q;

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        q <= 1'b0;
    end   

    else 
        q <= d;
end
    
endmodule