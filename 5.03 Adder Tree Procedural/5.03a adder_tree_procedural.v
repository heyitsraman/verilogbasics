module adder_tree_procedural (a,b,c,d,sum1,sum2,sum3);

input [3:0]a,b;
input [7:0]c,d;             //Can declare them together as both have same number of bits.
output reg [4:0]sum1;
output reg [8:0]sum2;       //Cannot declare them together as both has different bit size.
output reg [9:0]sum3;       //declared as reg since it is a procedural assignment

always @(a or b) begin
    sum1 = a+b;
end

always @(c or d) begin
    sum2 = c+d;
end    

always @(*) begin
    sum3 = sum1+sum2;
end

endmodule