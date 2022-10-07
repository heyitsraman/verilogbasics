module reduction_op ();

reg [4:0] my_val1 = 5'b1_1111;      //5Bit Variable
reg [8:0] my_val2 = 9'b1_0101_1110;     //9Bit Variable
reg result;

//Monitor values
initial begin
    $monitor("Value 1=%b, Value 2=%b, Result=%b", my_val1, my_val2, result);
end

//Generate stimulus
initial begin
    result = &my_val1;      //AND Reduction
    #1;
    result = &my_val2;      //AND Reduction

    #1;
    result = ~&my_val1;     //NAND Reduction
    #1;
    result = ~&my_val2;     //NAND Reduction

    #1;
    result  = |my_val1;     //OR Reduction
    #1;
    result = |my_val2;      //OR Reduction

    #1;
    result = ~|my_val1;     //NOR Reduction
    #1;
    result = ~|my_val2;     //NOR Reduction

    #1;
    result = ^my_val1;      //XOR Reduction
    #1;
    result = ^my_val2;      //XOR Reduction 

    #1;
    result = ~^my_val1;     //XNOR Reduction
    #1;
    result =~^my_val2;      //XNOR Reduction
end
    
endmodule