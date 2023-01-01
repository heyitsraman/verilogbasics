`timescale 1us/1ps
module clkgen ();

parameter time_period1 = 0.5;
parameter time_period2 = 0.25;

reg clock1;         //1MHz clock with 50% duty cycle
reg clock2=0;       //2MHz clock with 50% duty cycle
reg clock3, clock4;         //1MHz clock with 30% duty cycle

//Generation Method 1 using initial block
initial begin
    clock1=0;
    forever begin
        #(time_period1);        //1MHz clock
        clock1 = ~clock1;
    end
end

//Generation Method 2 using always block
always begin
    #(time_period2);
    clock2 = ~clock2;           //2MHz clock
end

initial begin
    clock3=0;
    forever begin
        clock3=0;   #(0.7);
        clock3=1;   #(0.3);     //1MHz clock with 30% duty cycle
    end
end
    
initial begin
    clock4=0;
    forever begin
        clock4=0;   #(0.4);
        clock4=1;   #(0.1);     //2MHz clock with 20% duty cycle
    end
end

initial begin
    #10;
    $stop;
end
endmodule