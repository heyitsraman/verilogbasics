`timescale 1us/1ns
module task_meters_feet ();
    
real meters, feet;    
reg clk=0;

task meters_feet;
    input real meters;
    output real feet;
    begin

        feet = meters * 3.2808;
        $display($time," Meters=%0.4f, Feet=%0.4f", meters, feet);
    
    end
endtask

always begin #1 clk = ~clk; end

//Call the task
initial begin
        #1; meters=1; meters_feet(meters,feet);
        #5; meters=3; meters_feet(meters,feet);
        #10;meters=10; meters_feet(meters,feet);
        #10;
        $stop;

end




endmodule