module ha_behavioral (a, b, sum, carry);

input a, b;
output reg sum, carry;

//Behavioral Style
always @(a or b) begin
    sum = a^b;
    carry = a&b;
    
end

endmodule