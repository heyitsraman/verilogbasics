module sram_dp_syncread #(parameter WIDTH=8, parameter DEPTH=16,
                            parameter DEPTH_LOG=$clog2(DEPTH)) (clk, write_en, read_en, addr_wr, 
                                            addr_rd, data_wr, data_rd);

input clk;
input write_en,read_en;
input [DEPTH_LOG-1:0] addr_rd, addr_wr;
input [WIDTH-1:0] data_wr;
output reg [WIDTH-1:0] data_rd;

//Define the SRAM Array
reg [WIDTH-1:0] ram [0:DEPTH-1];

//Write is Synchronous
//Read is Asynchronous
always @(posedge clk) begin    
        if(write_en==1 && read_en==0)
            ram[addr_wr] <= data_wr;
        else if(read_en==1 && write_en==0)
            data_rd <= ram[addr_rd];
end




endmodule