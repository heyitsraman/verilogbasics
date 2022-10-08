module relational_op ();

reg result;

//Monitor Values
initial begin
    $monitor("result=%b", result);
end
    
//Generate Stimulus
initial begin
    
    #5; result = 3 < 0;
    #5; result = 3 < 6'b00_1111;
    #5; result = 6>6;
    #5; result = 4'b1001 <= 4'b1010;
    #5; result = 4'b100X > 4'b1010;
    #5; result = 99>=98;

end

endmodule