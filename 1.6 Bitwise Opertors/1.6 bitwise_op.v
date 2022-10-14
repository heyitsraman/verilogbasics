module bitwise_op ();

reg [5:0] x = 0;
reg [5:0] y = 0;
reg [5:0] result = 0;

//Monitor the values
initial begin
    $monitor("x=%b, y=%b, result=%b", x, y, result);
end
    

//Generate Stimulus
initial begin

x = 6'b00_0101;
y = 6'b11_0001;
result = x&y;       //AND OPERATION

#5;
result = ~(x&y);    //NAND OPERATION

#1
x = 6'b01_0110;
y = 6'b01_1011;
result = x|y;       //OR OPERATION

#5;
result = ~(x|y);    //NOR OPERATION

#1;
x = 6'b01_0110;
y = 6'b01_1011; 
result = x^y;       //XOR OPERATION

#5;
result = ~(x^y);      //NXOR OPERATION

#5;
x=y;                //Makes all bits equal to 1
result = ~(x^y);

end
endmodule