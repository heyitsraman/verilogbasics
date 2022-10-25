module ha_structural (a, b, sum, carry);

input a, b;
output sum, carry;

xor XOR1(sum, a, b);
and AND1(carry, a, b);
    
endmodule