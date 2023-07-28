module sram_dp_asyncread #(parameter WIDTH=8, parameter DEPTH=16,
                            parameter DEPTH_LOG=$clog2(DEPTH)) (clk, write_A,write_B,
                             addr_A,addr_B, data_wr_A, data_wr_B, data_rd_A, data_rd_B);

input clk;
input write_A, write_B;
input [DEPTH_LOG-1:0] addr_A, addr_B;
input [WIDTH-1:0] data_wr_A, data_wr_B;
output [WIDTH-1:0] data_rd_A, data_rd_B;

//Define the SRAM Array
reg [WIDTH-1:0] ram [0:DEPTH-1];

//Write is Synchronous
always @(posedge clk) begin    
        if(write_A)
            ram[addr_A] <= data_wr_A;
        if(write_B)
            ram[addr_B] <= data_wr_B;
end

//Read is Asynchronous
assign data_rd_A = ram[addr_A];
assign data_rd_B = ram[addr_B];

endmodule
