module lfsr_16 (clk, reset, enable, lfsr);

input clk, reset, enable;
output reg [15:0] lfsr;

//Seed has to be a non-zero value
localparam SEED = 16'h1001 ;
wire feedback;

//x^16 + x^14 + x^13 + x^11 + 1
assign feedback = lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10] ^ lfsr[0];

always @(posedge clk or negedge reset) begin
    
    if (!reset) begin
        lfsr <= SEED;
    end
    else if (enable)
        lfsr <= {lfsr[14:0], feedback};         //Left-shift

end

    
endmodule