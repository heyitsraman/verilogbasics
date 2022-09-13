module easy_verilog_example ();

reg x = 1'b0;
reg y = 1'b1;
reg z = 1'b0;

always @(z) begin
        $display("x=%b, y=%b, z=%b", x, y, z);    
end

initial begin
    #2;     z = x^y;
    #10;    y=0;
    z = x | y;
    #10;
    z = ~z;
    #10;    
end
    
endmodule