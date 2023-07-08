`timescale 1us/1ns
module metro_turnstile_tb ();

reg clk=0, reset;
reg validate_code;
reg [3:0] access_code;                //4-bit metro access card
wire open_access_door;
wire [1:0] state_out;                 //Used for debug
integer i;
    
//Instantiate the module
metro_turnstile dut (.clk(clk), .reset(reset), .validate_code(validate_code),
                     .access_code(access_code), .open_access_door(open_access_door),
                     .state_out(state_out));

//Clock Signal
always begin #1 clk = ~clk; end


//Create Stimulus
initial begin

        $monitor("Time=%0d", $time," Access_Code=%b, State_Out=%b, Open_Door=%b", access_code,
                                                                state_out, open_access_door);

        reset=0;
        #4;
        reset=1;
        validate_code=0; access_code=0;         //invalid access code
        for (i=0; i<16; i=i+1 ) begin
           
            @(posedge clk);
            validate_code=1; access_code=i;    
        
        end
        
        validate_code=0; access_code=9;         //disable validate code
        #40 $stop;
end
endmodule