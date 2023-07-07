module sram_dp_asyncread #(parameter WIDTH=8, parameter DEPTH=16,
                            parameter DEPTH_LOG=$clog2(DEPTH)) (clk, write_en, addr_wr, 
                                            addr_rd, data_wr, data_rd);

input clk;
input write_en;
input [DEPTH_LOG-1:0] addr_rd, addr_wr;
input [WIDTH-1:0] data_wr;
output [WIDTH-1:0] data_rd;

//Define the SRAM Array
reg [WIDTH-1:0] ram [0:DEPTH-1];

//Write is Synchronous
always @(posedge clk) begin    
        if(write_en)
            ram[addr_wr] <= data_wr;
end

//Read is Asynchronous
assign data_rd = ram[addr_rd];

endmodule