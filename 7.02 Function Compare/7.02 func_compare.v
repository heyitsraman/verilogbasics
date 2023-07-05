`timescale 1us/1ns
module func_compare ();

//This function compares two integer numbers and outputs if they are equal.
//The result is eihter a 0(false) or 1(true)

function compare(input integer a, input integer b);

    begin
        compare = (a==b);
    end
    
endfunction


//Variables used for stimulus
integer a,b;

//Create stimulus
initial begin
    
    $monitor($time, " A=%0d, B=%0d, COMPARE=%b", a, b, compare(a,b));
    #1; a=1; b=9;
    #1; a=99; b=99;
    #1; a=490; b=134;
    #1; a=-134; b=-134;

end
    
endmodule