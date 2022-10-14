module logical_op ();

reg [2:0] my_val1 = 3'b111;         //3Bit Variable
reg [3:0] my_val2 = 4'b0000;        //4Bit Variable
reg result;                         //1Bit Result

//Monitor values
initial begin
    $monitor("Value 1=%b, Value 2=%b, Result=%b", my_val1, my_val2, result);
end

//Generate Stimulus
initial begin
    result = !my_val1;              //Logical NOT
    #5;
    result = !my_val2;              //Logical NOT

    #5;
    result = my_val1 && my_val2;    //Logical AND

    #5;
    result = my_val1 || my_val2;    //Logical OR

    #5;
    my_val1 = 3'bZ0X;               //Add unknown bits

    #5;
    result = !my_val1;              //Logical NOT

    #5;
    result = my_val1 || my_val2;    //Logical OR

    #5;
    result = my_val1 && my_val2;    //Logical AND
end
    
endmodule