module operators_precedence ();

reg [3:0] a;
integer b;

//Generate Stimulus and Display
initial begin

a = ~4'b1110 & |4'b1000;            //Unary before Bitwise
$display("a=%b", a);
#5;

a = ~4'b1100 & !4'b1000;            //Unary before Bitwise
$display("a=%b", a);
#5;

a = |4'b0100 & ~&4'b1011;           //Unary before Bitwise
$display("a=%b", a);
#5;

b = 2*5 << 2;                       //Multiply before Left Shift
$display("b=%0d", b);
#5;

b = 2<4 && -33>-34;                 //Relational before Logical
$display("b=%0d", b);
#5;

b = 2<<3 - 3;                       //Arithmetic beofre Left shift
$display("b=%0d", b);

end    
endmodule