module some_logic (a,b,c);

input a,b;
output c;

wire a_not, a_or_b;
    
//The order of assignments is not important

assign c = a_or_b | (a_not & a_or_b);
assign a_not = ~a;
assign a_or_b = a|b;

endmodule