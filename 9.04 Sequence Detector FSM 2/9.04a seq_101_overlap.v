module seq_101_overlap (clk,reset,seq_in,seq_detected,state_out);

input clk, reset, seq_in;
output reg seq_detected;
output [1:0] state_out;

    
//Declare the state values as parameters
parameter S1 = 2'd0;
parameter S10 = 2'd1;
parameter S101 = 2'd2;

//Declare the logic for state machine
reg [1:0] state;                        //the sequential part
reg [1:0] next_state;                   //the combinational part

//Next State Logic
always @(*) begin
    
            seq_detected = 1'b0;
            case (state)
                S1: begin
                        if(seq_in == 1)
                            next_state = S10;
                        else
                            next_state = S1;
                end 

                S10: begin
                        if(seq_in == 0)
                            next_state = S101;
                        else    
                            next_state = S10; 
                end

                S101: begin
                        
                        if(seq_in == 1) begin
                            seq_detected = 1'b1;
                            next_state = S10;
                        end
                        else
                            next_state = S1;
                end 

                default: next_state = S1; 
            endcase
end

//State Sequencer Logic
always @(posedge clk or negedge reset) begin

        if (!reset)
            state <= S1;
        else
            state <= next_state;
    
end

assign state_out = state;           //connect with the output port
endmodule