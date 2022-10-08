module arithmetic_op ();

integer a=2, b=3, result;       //Integer is a 32bit signed value

//Monitor Values
initial begin
    $monitor("a=%0d, b=%0d, result=%0d", a, b , result);
end

//Generate Stimulus
initial begin
    result = a**b; #5;
    result = b**a; #5;

    a=177; b=12;
    result = a*b; #5;

    a=199; b=19;
    result = a/b; #5;
    result = a%b; #5;

    a=199; b=-19;
    result = a/b; #5;
    result = a%b; #5;

    a=4199; b=-2319;
    result = a+b; #5;

    a=19234; b=-16;
    result = a-b; #5;

    a=919234; b=13;
    result = a - (b*(2**15));


end
    
endmodule