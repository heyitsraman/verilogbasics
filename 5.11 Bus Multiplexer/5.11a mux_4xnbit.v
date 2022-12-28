module mux_4xnbit (a,b,c,d,sel,y);

parameter n = 8;
input [n-1:0]a,b,c,d;
input [1:0]sel;
output reg [n-1:0]y;

always @(*) begin
    case (sel)
        2'b00: y=a;
        2'b01: y=b;
        2'b10: y=c;
        2'b11: y=d; 
        default: y=2'dx;
    endcase
    
end
    
endmodule