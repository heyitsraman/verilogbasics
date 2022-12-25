module decoder_3to8 (d,y,enable);

input [2:0]d;
input enable;
output reg [7:0]y;

always @(*) begin
        if (enable==0) begin
            y=0;
        end

        else
            y=1<<d;
            
end
    
endmodule