`timescale 1us/1ns
module func_fibonacci ();

function automatic integer fibonacci (input integer N);
    
    integer result=0;
    begin
        
        if(N==0)
            result=0;
        else if(N==1)
            result=1;
        else
            result = fibonacci(N-1) + fibonacci(N-2);

    fibonacci = result;

    end
    
endfunction

integer i;

//Stimulus
initial begin
    
    for (i=0; i<11; i=i+1) begin
        
    #1; $display($time," N=%0d, Fibonacci=%0d",i, fibonacci(i));

    end
end



endmodule