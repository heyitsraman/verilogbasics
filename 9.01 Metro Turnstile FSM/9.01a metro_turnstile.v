module metro_turnstile (clk,reset,validate_code,access_code,open_access_door,state_out);

input clk, reset;
input validate_code;
input [3:0] access_code;                //4-bit metro access card
output reg open_access_door;
output [1:0] state_out;                 //Used for debug

//Declare state values as localparams
localparam IDLE = 2'b0;
localparam CHECK_CODE = 2'b1; 
localparam ACCESS_GRANTED = 2'd2;

//Deduce the logic for the state machine
reg [1:0] state;                        //the sequential part
reg [1:0] next_state;                   //the combinational part
reg [3:0] timer;                        //the counter that keeps the gate open

//Next State Logic
always @(*) begin

            next_state = IDLE;          //default value
            open_access_door = 0;       //door is closed

            case (state)
                IDLE : begin
                                if(validate_code)
                                    next_state = CHECK_CODE;
                                else
                                    next_state = IDLE;
                end 

                CHECK_CODE : begin
                                if((access_code>=4'd4) && (access_code<=4'd11))
                                    next_state = ACCESS_GRANTED;
                                else
                                    next_state = IDLE; 
                end

                ACCESS_GRANTED: begin
                                    open_access_door = 1;
                                    if(timer == 4'hF)
                                        next_state = IDLE;
                                    else    
                                        next_state = ACCESS_GRANTED;
                end 

                default: next_state = IDLE;         
            endcase
end

//State sequencer logic
always @(posedge clk or negedge reset) begin

            if(!reset)
                state <= IDLE;
            else
                state <= next_state;
    
end

assign state_out = state;               //Connect the output port

//Timer logic
always @(posedge clk or negedge reset) begin
    
            if(!reset)
                timer <= 0;
            else if (state == ACCESS_GRANTED)
                timer <= timer + 1;
            else
                timer <= 0;
end
endmodule