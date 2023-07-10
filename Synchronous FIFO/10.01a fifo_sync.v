module fifo_sync #(parameter FIFO_DEPTH=8, parameter DATA_WIDTH=32) 
                  (clk,reset,cs,write_en,read_en,data_in,data_out,empty,full);

input clk, reset, cs, write_en, read_en;
input [DATA_WIDTH-1:0] data_in;
output reg [DATA_WIDTH-1:0] data_out;
output full,empty;

localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH) ;

//Declare a bi-dimensional array
reg [DATA_WIDTH-1:0] fifo [0:FIFO_DEPTH-1];

//Write/Read have 1 extra bit at MSB
reg [FIFO_DEPTH_LOG:0] write_pointer;
reg [FIFO_DEPTH_LOG:0] read_pointer;

//Write Pointer
always @(posedge clk or negedge reset) begin

    if(!reset)
        write_pointer <= 0;
    else if(cs && write_en && !full)
        write_pointer <= write_pointer + 1'b1;
    
end

//Read Pointer
always @(posedge clk or negedge reset) begin

    if(!reset)
        read_pointer <= 0;
    else if(cs && read_en && !empty)
        read_pointer <= read_pointer + 1'b1;
    
end

//Declare the empty/full logic
assign empty = (read_pointer == write_pointer);
assign full = (read_pointer == {~write_pointer[FIFO_DEPTH_LOG] , write_pointer[FIFO_DEPTH_LOG-1:0]});

//Write to FIFO memory
always @(posedge clk) begin
    if(cs && write_en && !full)
        fifo[write_pointer[FIFO_DEPTH_LOG-1:0]] <= data_in;
end

//Read to FIFO memory
always @(posedge clk or negedge reset) begin
    if(!reset)
        data_out <= 0;
    else if(cs && read_en && !empty)
        data_out <= fifo[read_pointer[FIFO_DEPTH_LOG-1:0]];
end

endmodule