module concatenation_op ();

reg [7:0] a;
reg [3:0] upper_nibble, lower_nibble;

//Generate stimulus and display
initial begin
    #5; a = {4'b1110, 4'b0001};
    $display("a=%b",a);

    #5; a = {3'b000, 2'b11, 3'b000};
    $display("a=%b",a);

    #5; a = {1'b1, 2'b00, 2'b01, 3'b010};
    $display("a=%b",a);
    
    #5; a = {a<<1, 1'b1};                   //Left Shift 'a' by 1 bit and concatenate LSB
    $display("a=%b",a);

    #5; {upper_nibble, lower_nibble} = a;
    $display("Upper Nibble=%b, Lower Nibble=%b", upper_nibble, lower_nibble);

    #5; {upper_nibble, lower_nibble} = {lower_nibble, upper_nibble};
    $display("Upper Nibble=%b, Lower Nibble=%b", upper_nibble, lower_nibble);

    #5; a = {upper_nibble, lower_nibble};
    $display("a=%b", a);
end
    
endmodule