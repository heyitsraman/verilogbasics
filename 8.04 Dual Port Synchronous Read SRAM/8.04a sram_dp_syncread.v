module sram_dp_syncread #(parameter WIDTH=8, parameter DEPTH=16,
                            parameter DEPTH_LOG=$clog2(DEPTH)) (clk, write_A,write_B,
                             read_A, read_B, addr_A, addr_B, data_wr_A,
                             data_wr_B, data_rd_A, data_rd_B);

input clk;
input write_A, write_B, read_A, read_B;
input [DEPTH_LOG-1:0] addr_A, addr_B;
input [WIDTH-1:0] data_wr_A, data_wr_B;
output reg [WIDTH-1:0] data_rd_A, data_rd_B;

//Define the SRAM Array
reg [WIDTH-1:0] ram [0:DEPTH-1];

//Write is Synchronous
//Read is Synchronous
always @(posedge clk) begin   
    //Considering only the case where both write or both read takes place at same clock.
        case ({write_A,read_A,write_B,read_B})
            4'b1010: begin
                        ram[addr_A] <= data_wr_A;
                        ram[addr_B] <= data_wr_B;  
                    end
            
            4'b0101: begin
                        data_rd_A <= ram[addr_A];
                        data_rd_B <= ram[addr_B];    
                    end

            default: begin
                        ram[addr_A] <= ram[addr_A]; 
                        ram[addr_B] <= ram[addr_B];
            end
        endcase
end
endmodule
