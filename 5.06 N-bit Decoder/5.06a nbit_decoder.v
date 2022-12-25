module nbit_decoder (a,enable,y);

parameter N = 3;
input enable;
input [N-1:0]a;
output reg [2**N-1:0]y;

always @(*) begin
    if (enable==0) begin
        y=0;
    end

    else
        y=(1<<a);
    
end
    
endmodule