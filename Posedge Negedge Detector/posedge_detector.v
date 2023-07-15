module posedge_detector (data, clk, pos_out, neg_out);

input clk, data;
output reg pos_out, neg_out;
wire data_delay;
    
assign #10 data_delay = data;

always @(posedge clk) begin
    
    pos_out <= data & (~data_delay);
    neg_out <= ~data & data_delay;

end
endmodule



module tb_posedge_detector ();

reg clk=0;
reg data;
wire pos_out, neg_out;

always begin #5 clk = ~clk; end

posedge_detector dut(.clk(clk), .data(data), .pos_out(pos_out), .neg_out(neg_out));

initial begin
    
        $monitor("Time=%0d",$time," Input=b, Posedge=%b, Negedge", data, pos_out, neg_out);

        repeat(2) @(posedge clk) data=0;
        repeat(2) @(posedge clk) data=1;
        repeat(5) @(posedge clk) data=0;
        repeat(1) @(posedge clk) data=1;
        repeat(1) @(posedge clk) data=0;
        #10; data=1;
        #15;
        repeat(1) @(posedge clk) data=0;
        repeat(1) @(posedge clk) data=1;
        repeat(1) @(posedge clk) data=0;
        

        #10;
        $stop;
end


    
endmodule