module adder8bit (a, b, sum);

input [7:0] a;
input [7:0] b;
output [8:0] sum;

assign sum = a+b;
    
endmodule