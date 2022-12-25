module nbit_comparator (a,b,smaller,equal,greater);
    
parameter N = 7;
input [N-1:0]a,b;
output reg smaller, equal, greater;

always @(*) begin
    
    smaller = (a<b);
    equal = (a==b);
    greater = (a>b);

end

endmodule