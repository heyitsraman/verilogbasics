`timescale 1us/1ns
module func_sum ();

/*This function returns the sum of two 8-bit numbers.
An internal variable with the same name as the function is created inside it
and is used for returning the value */

function [8:0]sum (input [7:0]a, input [7:0]b);

    begin
        sum = a + b;
    end
    
endfunction

//Variables for stimulus
reg [7:0] a,b;

//Create Stimulus
initial begin
    
    $monitor($time, " A=%d, B=%d, SUM=%d",a,b,sum(a,b));
    #1;
    a=1; b=9;
    #1;
    a=13; b=66;
    #1;
    a=255; b=1;
    #1;
    a=255; b=255;

end
    
endmodule