module shift_op ();

reg [11:0] a = 12'b0101_1010_1101;     //12 bit unsigned value
reg [11:0] b;

//Monitor Values
initial begin
    $monitor("a=%12b, b=%12b, a=%0d, b=%0d", a, b, a, b);
end

//Generate Stimulus
initial begin
    b = a<<1;       //b = a*2
    #5;
    b = 0;
    #5; b = a*2;
    #5; b = b>>2;
    #5; b = b<<1;
    #5; b = a>>>2;
    #5; b = a<<<2;
    #5; b = a<<2;
    #5; b = a>>2;
    #5; b = (a<<1)>>6;
end
    
endmodule