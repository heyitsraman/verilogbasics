module replication_op ();

reg [7:0] a;
reg [31:0] b;

//Generate Stimulus
initial begin

a = {4{2'b10}};
$display("a=%b", a);
#5;

a = {2{4'b1X0Z}};
$display("a=%b", a);
#5;

b = {8{4'b0110}};
$display("b=%b", b);
#5;

b = {2{8'b0111_0001}};
$display("b=%b", b);
#5;

b = {16{2'b10}};
$display("b=%b", b);

end
endmodule