//Single port SRAM with asynchronous read
//The size of the SRAM is 16x8bit words
module syncread_SRAM (clk,data_in,data_out,address,write_en,read_en);

input clk,write_en,read_en;
input [7:0]data_in;
input [3:0]address;
output reg [7:0]data_out;

reg [7:0]ram [0:15];

//RAM doesn't have reset 
//Default vlue for each location is X
//Write is Synchronous

always @(posedge clk) begin
    
        if (write_en==1) begin
            ram[address] <= data_in;
        end

        if (read_en==1) begin
            data_out <= ram[address];
        end
end




endmodule