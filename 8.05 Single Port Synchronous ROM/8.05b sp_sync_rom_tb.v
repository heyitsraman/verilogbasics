`timescale 1us/1ns
module sp_sync_rom_tb();
    
localparam WIDTH = 8;
localparam DEPTH = 16;
localparam DEPTH_LOG = $clog2(DEPTH);

reg clk=0;
reg [DEPTH_LOG-1:0] addr_rd;
wire [WIDTH-1:0] data_rd;
integer i;

//Instantiate the module
sp_sync_rom #(.WIDTH(WIDTH), .DEPTH(DEPTH), .DEPTH_LOG(DEPTH_LOG)) 
               dut(.clk(clk), .addr_rd(addr_rd), .data_out(data_rd));


//Clock Signal
always begin #1 clk = ~clk; end

initial begin
    
    #1;
    $monitor("Time=%0d", $time, " ROM Content:");
    for (i=0; i<DEPTH; i=i+1) begin
        read_data(i);
    end

    #40 $stop;

end

//Read the data synchronously
task read_data;
input [DEPTH_LOG-1:0] address_in;
begin
    
        @(posedge clk);
        addr_rd = address_in;
        @(posedge clk);
        #1;

        $monitor("Time=%0d", $time, " Address=%0d, Data=%0x", addr_rd, data_rd);

end
endtask
endmodule