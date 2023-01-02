module piso (clk,reset,pl,d,q,data_in,data_out);

input clk, reset, pl, data_in;
input [3:0]d;
output data_out;
output reg[3:0] q;
wire [3:0]data_src;

assign data_src = pl ? d : {data_in, q[3:1]};   //if preload is 0, values of D-ff will propagate else
                                                //if preload is 1, values will be shifted right.

always @(posedge clk or negedge reset) begin
    
    if (!reset) begin
        q <= 4'b0;
    end

    else
        q <= data_src;

end

assign data_out = q[0];
    
endmodule