module sipo (clk,q,reset,serial_data);

input clk, reset, serial_data;
output reg [3:0]q;

always @(posedge clk or negedge reset) begin
    
    if (!reset) begin
        q <= 4'b0;
    end
    
    else
        q <= {serial_data, q[3:1]};

end
    
endmodule