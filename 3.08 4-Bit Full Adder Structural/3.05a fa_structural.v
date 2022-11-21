module fa_structural (a, b, cin, sum, cout);

input a, b, cin;
output sum, cout;

//Declare nets to connect the Half Adders
wire sum1, carry1, carry2;

//Instantiate the Half adder module
    ha_structural HA1(.a(a), .b(b), .sum(sum1), .carry(carry1));
    ha_structural HA2(.a(sum1), .b(cin), .sum(sum), .carry(carry2));

    or(cout, carry1, carry2);
    
endmodule