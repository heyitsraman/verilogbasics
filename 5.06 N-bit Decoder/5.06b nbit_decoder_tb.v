module nbit_decoder_tb();

parameter N = 3;
reg enable;
reg [N-1:0]a;
wire [2**N-1:0]y;
integer i;

nbit_decoder dut(.a(a), .enable(enable), .y(y));

initial begin
    
    $monitor("Time=%0t, A=%d, Enable=%b, Y=%b", $time, a, enable, y);
    a=0; enable=0;

    for (i=0;i<2**N;i=i+1) begin
        enable=1;
        a=i;
        #2;
    end
    
end

    
endmodule