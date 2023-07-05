module updown_counter_tb ();

parameter CNT_WIDTH = 3;
reg clk = 0;
reg reset;
reg load_en;
reg [CNT_WIDTH-1:0] counter_in;
reg up_down;
wire [CNT_WIDTH-1:0] counter_out;

updown_counter #(.CNT_WIDTH(CNT_WIDTH)) dut(.clk(clk), .reset(reset), .load_en(load_en), .up_down(up_down), .counter_in(counter_in), .counter_out(counter_out));
always #1 clk = ~clk;

initial begin
    $monitor($time," load_en=%b, up_down=%b, counter_in=%d, counter_out=%d", load_en,up_down,counter_in,counter_out);
    #1; reset=0; load_en=0; counter_in=0; up_down=0;
    #2; reset=1; 
    @(posedge clk);
    repeat(2) @(posedge clk); counter_in =3; load_en=1;
    @(posedge clk); load_en=0; up_down=1;

    wait(counter_out == 0) up_down =0;
end
initial begin
    #100 $stop;
end
endmodule