`timescale 1us/1ns

module sram_dualport_asyncread_tb ();

localparam WIDTH = 8;
localparam DEPTH = 16;
localparam DEPTH_LOG = $clog2(DEPTH);

reg clk=0;
reg write_A, write_B;
reg [WIDTH-1:0] data_wr_A, data_wr_B;
wire [WIDTH-1:0] data_rd_A, data_rd_B;
reg [DEPTH_LOG-1:0] addr_A, addr_B;

integer i;
integer num_tests=0, test_count=0, success_count=0, error_count=0;
reg [DEPTH_LOG-1:0] rand_addr_A, rand_addr_B;

//Instantiate the module
sram_dp_asyncread #(.WIDTH(WIDTH), .DEPTH(DEPTH), .DEPTH_LOG(DEPTH_LOG)) 
               dut (.clk(clk), .write_A(write_A), .write_B(write_B), .data_wr_A(data_wr_A), 
                    .data_wr_B(data_wr_B), .data_rd_A(data_rd_A), .data_rd_B(data_rd_B), 
                    .addr_A(addr_A), .addr_B(addr_B));


//Clock signal
always begin #1 clk = ~clk; end

initial begin

        success_count=0; error_count=0; test_count=0;
        num_tests=DEPTH;

        #2;

        $monitor("Time=%0d",$time," Test-1 START");
        for (i=0; i<num_tests; i=i+1) begin

            data_wr_A = $random;
            data_wr_B = $random;

            write_data(data_wr_A, data_wr_B,i,i+2);
            read_data(i,i+2);
            #3;
            
            compare_data(i,i+2,data_wr_A,data_wr_B,data_rd_A,data_rd_B);

        end

        $monitor("Time=%0d",$time," Test-2 START");
        for (i=0; i<num_tests; i=i+1) begin

            rand_addr_A = $random % DEPTH;
            rand_addr_B = $random % DEPTH;
            data_wr_A = (rand_addr_A % 5) ? 4'hA : 4'h7;
            data_wr_B = (rand_addr_B % 7) ? 4'hB : 4'h5;

            write_data(data_wr_A,data_wr_B,rand_addr_A,rand_addr_B);
            read_data(rand_addr_A,rand_addr_B);

            compare_data(rand_addr_A,data_wr_A,rand_addr_B,data_wr_B,data_rd_A,data_rd_B);
                
        end

//Print Statistics
    $monitor("Time=%0d", $time, " Test Results SUCCESS=%0d, ERROR=%0d, TEST=%0d", success_count,
                        error_count, test_count);
    #40 $stop;

end


//TASKS

//Write Task
task write_data;
input [WIDTH-1:0] data_in_A, data_in_B;
input [DEPTH_LOG-1:0] address_in_A, address_in_B;

    begin
        
        @(posedge clk);
        write_A=1; write_B=1;
        data_wr_A = data_in_A;
        data_wr_B = data_in_B;
        addr_A = address_in_A;
        addr_B = address_in_B;

        @(posedge clk);
        write_A=0; write_B=0;

    end
endtask

//Read Task
task read_data;
input [DEPTH_LOG-1:0] address_in_A, address_in_B;

    begin
        
        addr_A = address_in_A;
        addr_B = address_in_B;

    end
endtask

//Compare Write and Read Data
task compare_data;
input [DEPTH_LOG-1:0] address_A, address_B;
input [WIDTH-1:0] expected_data_A, expected_data_B;
input [WIDTH-1:0] observed_data_A, observed_data_B;

    begin
        
        if (expected_data_A == observed_data_A && expected_data_B == observed_data_B) begin
            $monitor("SUCCESS ADDR_A=%0d, ED_A=%0x, OD_A=%0x, ADDR_B=%0d, ED_B=%0x, OD_B=%0x", 
                        address_A, expected_data_A, observed_data_A, address_B, expected_data_B, 
                        observed_data_B);
                        
            success_count = success_count + 1;
        end

        else begin
            $monitor("ERROR ADDR_A=%0d, ED_A=%0x, OD_A=%0x, ADDR_B=%0d, ED_B=%0x, OD_B=%0x", 
                        address_A, expected_data_A, observed_data_A, address_B, expected_data_B, 
                        observed_data_B);
                        
            error_count = error_count + 1;
        end
        
        test_count = success_count + error_count;

    end
endtask
endmodule
