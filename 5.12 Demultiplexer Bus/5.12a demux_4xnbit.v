module demux_4xnbit (a,b,c,d,sel,y);

parameter n = 8;
input [n-1:0]y;
input [1:0]sel;
output reg [n-1:0]a,b,c,d;

always @(*) begin

    case(sel)
        2'b00: begin a=y; b=8'dX; c=8'dX; d=8'dX; end
        2'b01: begin a=8'dX; b=y; c=8'dX; d=8'dX; end
        2'b10: begin a=8'dX; b=8'dX; c=y; d=8'dX; end
        2'b11: begin a=8'dX; b=8'dX; c=8'dX; d=y; end
        default: begin a=8'dX; b=8'dX; c=8'dX; d=8'dX; end
    endcase

end
    
endmodule