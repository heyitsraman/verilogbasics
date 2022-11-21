module bit4adder_structural (a,b,cin,sum,cout);

input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

//Internal nets used to connect the 4 modules
wire [2:0]c;            //Also called as Glue Logic

fa_structural FA0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[0]));
fa_structural FA1(.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
fa_structural FA2(.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
fa_structural FA3(.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .cout(cout));


endmodule