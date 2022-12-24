module nbit_adder (a,b,sum);

parameter N = 3;
input [N-1:0]a,b;
output reg [N:0]sum;

always @(*) begin
    sum = a+b;
    //Also can be written as sum[N:0] = a[N-1:0] + b[N-1:0]
end
    
endmodule