module sp_sync_rom #(parameter WIDTH=8, parameter DEPTH=16, parameter DEPTH_LOG=$clog2(DEPTH)) 
                        (clk, addr_rd, data_out);

input clk;
input [DEPTH_LOG-1:0] addr_rd;
output reg [WIDTH-1:0] data_out;

//Declare the ROM
reg [WIDTH-1:0] rom [0:DEPTH-1];

//Load the ROM from "rom_init.hex"
//Relative location depends on the Modelsim Project location

initial begin
    $readmemh("D:\VS CODE\Projects\verilog_zerotohero\codes\rom_init.hex", rom, 0, DEPTH-1);
end

//Read is Synchronous
always @(posedge clk) begin
    
        data_out <= rom[addr_rd];

end
endmodule