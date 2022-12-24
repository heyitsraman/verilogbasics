module adder_tree (a,b,c,d,sum1,sum2,sum3);

input [3:0]a,b;
input [7:0]c,d;             //Can declare them together as both have same number of bits.
output [4:0]sum1;
output [8:0]sum2;           //Cannot declare them together as both has different bit size.
output [9:0]sum3;

assign sum1 = a+b;
assign sum2 = c+d;
assign sum3 = sum1 + sum2;
    
endmodule