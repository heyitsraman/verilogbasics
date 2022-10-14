module equality_op ();

reg result;

//Generate stimulus and display
initial begin
    #5; result = (1'b1 == 1'b0);
    $display("Result = %b", result);

    #5; result = (1'b1 == 1'b1);
    $display("Result = %b", result);

    #5; result = (1'b1 == 1'bX);
    $display("Result = %b", result);

    #5; result = (3'b101 == 3'b100);
    $display("Result = %b", result);

    #5; result = (3'b101 != 3'b101);
    $display("Result = %b", result);

    #5; result = (3'b10Z == 3'b10Z);
    $display("Result = %b", result);

    #5; result = (3'b10Z === 3'b10Z);
    $display("Result = %b", result);

    #5; result = (3'b1XZ == 3'b10Z);
    $display("Result = %b", result);

    #5; result = (3'b1XZ == 3'b1XZ);
    $display("Result = %b", result);

    #5; result = (2'bXX !== 2'bXX);
    $display("Result = %b", result);

    #5; result = (2'bXX != 2'bXX);
    $display("Result = %b", result);

end

endmodule