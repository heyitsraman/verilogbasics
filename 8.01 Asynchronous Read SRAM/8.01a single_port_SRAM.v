//Single port SRAM with asynchronous read
//The size of the SRAM is 16x8bit words
module single_SRAM (clk,data_in,data_out,address,control);

input clk,control;
input [7:0]data_in;
input [3:0]address;
output [7:0]data_out;

reg [7:0]ram [0:15];

//RAM doesn't have reset 
//Default vlue for each location is X
//Write is Synchronous

always @(posedge clk) begin
    
        if (control==1) begin
            ram[address] <= data_in;
        end

end

assign data_out = ram[address];


endmodule
