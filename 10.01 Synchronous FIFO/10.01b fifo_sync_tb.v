`timescale 1us/1ns
module fifo_sync_tb ();

//Testbench variables
parameter FIFO_DEPTH=8;
parameter DATA_WIDTH=32;
reg clk=0, reset, cs;
reg read_en, write_en;
reg [DATA_WIDTH-1:0] data_in;
wire [DATA_WIDTH-1:0] data_out;
wire empty, full;

integer i;

//Instantiate the DUT
fifo_sync #(.FIFO_DEPTH(FIFO_DEPTH), .DATA_WIDTH(DATA_WIDTH))
            dut (.clk(clk), .reset(reset), .cs(cs), .read_en(read_en), .write_en(write_en),
                 .data_in(data_in), .data_out(data_out), .empty(empty), .full(full));


//Write Task
task write_data;
    input [DATA_WIDTH-1:0] d_in;
    begin
        @(posedge clk);
        cs=1; write_en=1;
        data_in=d_in;
        $monitor("Time=%0d", $time, " i=%0d, Write Data= %0d", i, data_in);
        @(posedge clk);
        cs=1; write_en=0; 
    end
endtask

//Read Task
task read_data();
    begin
        @(posedge clk);
        cs=1; read_en=1;
        @(posedge clk);
        #1;
        $monitor("Time=%0d", $time, " i=%0d Read Data= %0d", i, data_out);
        cs=1; read_en=0;
    end
endtask

//Clock Signal
always begin #1 clk = ~clk; end

//Create Stimulus
initial begin
    #1;
    reset=0; read_en=0; write_en=0;

    #2;
    reset=1;
    
    $display("\n Time=%0d",$time," SCENARIO 1");
    write_data(1);
    write_data(10);
    write_data(100);
    read_data();
    read_data();
    read_data();
    read_data();

    @(posedge clk);

    $display("\n Time=%0d",$time," SCENARIO 2");
    for (i=0; i<FIFO_DEPTH; i=i+1) begin
        write_data(2**i);
        read_data();
    end

    @(posedge clk);

    $display("\n Time=%0d",$time," SCENARIO 3");
    for (i=0; i<FIFO_DEPTH; i=i+1) begin
        write_data(i**i);
        read_data();
    end

    #40 $stop;

end
endmodule