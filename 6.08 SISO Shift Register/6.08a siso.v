module siso (clk,reset,data_in,data_out,q);

input clk, reset, data_in;
output data_out;
output reg[3:0]q;

always @(posedge clk or negedge reset) begin
    
    if (!reset) begin
        q <= 4'b0;
    end

    else
        q <= {data_in, q[3:1]};

end

assign data_out = q[0];
    
endmodule