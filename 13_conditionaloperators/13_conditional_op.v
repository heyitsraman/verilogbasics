module conditional_op ();

integer  result, a=9, b=31;
reg c=0;

//Generate stimulus and display
initial begin
    #5; result = (a==9)? 1:0;
    $display ("result=%0b", result);

    #5; result = ((a+b) == 40)? 1:0;
    $display ("result=%0b", result);

    #5; result = (b==30)? 678:-99;
    $display ("result=%0d", result);

    #5; c = (b==31)? 1'bZ:1'b0;
    $display ("c=%b", c);
end

    
endmodule