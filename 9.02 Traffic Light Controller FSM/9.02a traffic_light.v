module traffic_light (clk,reset,enable,red,yellow,green,state_out);
    
input clk, reset, enable;
output reg red, yellow, green;
output [3:0] state_out;

//Declare the parameters
parameter OFF=4'd0;
parameter RED=4'd1;
parameter YELLOW=4'd4;
parameter GREEN=4'd8;

//Declare the logic for the state
reg [3:0] state;                        //the sequential part
reg [3:0] next_state;                   //the combinational part
reg [5:0] timer;                        //counter keeps the gate open
reg timer_clear;                        //when set resets the timer value

//Next State Logic
always @(*) begin
    
        next_state = OFF;
        red=0; yellow=0; green=0;
        timer_clear=0;

        case (state)

            OFF: begin
                    if(enable)
                        next_state = RED;
                    else
                        next_state = OFF; 
            end 

            RED: begin
                    red=1;
                    if (timer==6'd50) begin
                        next_state = YELLOW;
                        timer_clear=1;
                    end
                    else
                        next_state = RED;
            end 

            YELLOW: begin
                    yellow=1;
                    if (timer==6'd10) begin
                        next_state = GREEN;
                        timer_clear=1;
                    end
                    else
                        next_state = YELLOW;
            end

            GREEN: begin
                    green=1;
                    if (timer==6'd30) begin
                        next_state = RED;
                        timer_clear=1;
                    end
                    else
                        next_state = GREEN;
            end  

            default: next_state = OFF; 
        endcase

//Return from any state to OFF if enable=0
                    if(!enable)
                        next_state = OFF;
end

//State Sequencer Logic
always @(posedge clk or negedge reset) begin

        if(!reset)
            state <= OFF;
        else
            state <= next_state;

end

assign state_out = state;

//Timer Logic
always @(posedge clk or negedge reset) begin
    
        if(!reset)
            timer <= 0;
        else if((timer_clear==1) || (!enable))
            timer <= 0;
        else if(state != OFF)
            timer <= timer + 1;

end
endmodule