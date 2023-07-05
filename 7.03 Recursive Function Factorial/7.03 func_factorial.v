`timescale 1us/1ns
module func_factorial ();

function automatic integer factorial (input integer N);
    
    integer result=0;
    begin
        
        if(N==1 | N==0)
            result=1;
        else
            result = N*factorial(N-1);

    factorial = result;

    end
    
endfunction

integer N;

//Stimulus
initial begin
    
    for (N=0; N<11; N=N+1) begin
        
    #1; $display($time," N=%0d, Factorial=%0d",N, factorial(N));

    end
end



endmodule