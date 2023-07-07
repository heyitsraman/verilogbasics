`timescale 1us/1ns

module sram_dualport_syncread_tb ();

localparam WIDTH = 8;
localparam DEPTH = 16;
localparam DEPTH_LOG = $clog2(DEPTH);

reg clk=0;
reg write_en, read_en;
reg [WIDTH-1:0] data_wr;
wire [WIDTH-1:0] data_rd;
reg [DEPTH_LOG-1:0] addr_rd, addr_wr;

integer i;
integer num_tests=0, test_count=0, success_count=0, error_count=0;
reg [DEPTH_LOG-1:0] rand_addr_wr;

//Instantiate the module
sram_dp_syncread #(.WIDTH(WIDTH), .DEPTH(DEPTH), .DEPTH_LOG(DEPTH_LOG)) 
               dut (.clk(clk), .write_en(write_en), .data_wr(data_wr), .data_rd(data_rd),.addr_rd(addr_rd), .addr_wr(addr_wr), .read_en(read_en));


//Clock signal
always begin #1 clk = ~clk; end

initial begin

        success_count=0; error_count=0; test_count=0;
        num_tests=DEPTH;

        #2;

        $monitor("Time=%0d",$time," Test-1 START");
        for (i=0; i<num_tests; i=i+1) begin

            data_wr = $random;

            write_data(data_wr,i);
            read_data(i);
            #3;
            
            compare_data(i,data_wr,data_rd);

        end

        $monitor("Time=%0d",$time," Test-2 START");
        for (i=0; i<num_tests; i=i+1) begin

            rand_addr_wr = $random % DEPTH;
            data_wr = (rand_addr_wr % 2) ? 8'hAD : 8'hEB;

            write_data(data_wr,rand_addr_wr);
            read_data(rand_addr_wr);

            compare_data(rand_addr_wr,data_wr,data_rd);
                
        end

//Print Statistics
    $monitor("Time=%0d", $time, " Test Results SUCCESS=%0d, ERROR=%0d, TEST=%0d", success_count,
                        error_count, test_count);
    #40 $stop;

end


//TASKS

//Write Task
task write_data;
input [WIDTH-1:0] data_in;
input [DEPTH_LOG-1:0] address_in;

    begin
        
        @(posedge clk);
        write_en=1; 
        #13 read_en=0;
        data_wr = data_in;
        addr_wr = address_in;


    end
endtask

//Read Task
task read_data;
input [DEPTH_LOG-1:0] address_in;

    begin

        @(posedge clk);
        read_en=1;
        #25 write_en=0;
        addr_rd = address_in;

    end
endtask

//Compare Write and Read Data
task compare_data;
input [DEPTH_LOG-1:0] address;
input [WIDTH-1:0] expected_data;
input [WIDTH-1:0] observed_data;

    begin
        
        if (expected_data == observed_data) begin
            $monitor("SUCCESS ADDRESS=%0d, EXPECTED DATA=%0x, OBSERVED DATA=%0x", 
                        address, expected_data, observed_data);
                        
            success_count = success_count + 1;
        end

        else begin
            $monitor("ERROR ADDRESS=%0d, EXPECTED DATA=%0x, OBSERVED DATA=%0x", 
                        address, expected_data, observed_data);
                        
            error_count = error_count + 1;
        end
        
        test_count = success_count + error_count;

    end
endtask
endmodule