module literal_values ();

reg [7:0] my_var;

//All assignments are grouped in an 'initial' procedure
initial begin
    
my_var = 8'd137;            //137 in decimal
$display("Value of my_var in decimal = %d", my_var);

my_var = 8'h89;            //137 in hexadecimal
$display("Value of my_var in hexadecimal = %h", my_var);
    
my_var = 8'b1000_1001;     //137 in binary
$display("Value of my_var in binary = %b", my_var);

my_var = 8'o211;           //137 in octal
$display("Value of my_var in octal = %o", my_var); 

my_var = 8'hZ1;            //zzzz_0001
$display("Value of my_var = %h", my_var);

my_var = 1'b1;            //8 bit variable gets 1 bit value
$display("Value of my_var = %b", my_var);

my_var = 12'b1111_1111_0000;  //8-bit variable gets 12-bit value
$display("Value of my_var = %b", my_var);

end
endmodule