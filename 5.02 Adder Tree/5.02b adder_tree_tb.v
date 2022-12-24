module adder_tree_tb ();

reg [3:0]A,B;
reg [7:0]C,D;
wire [4:0]SUM1;
wire [8:0]SUM2;
wire [9:0]SUM3;

adder_tree dut(.a(A), .b(B), .c(C), .d(D), .sum1(SUM1), .sum2(SUM2), .sum3(SUM3));

initial begin
    $monitor("A=%d, B=%0d, C=%0d, D=%0d, SUM1=%0d, SUM2=%0d, SUM3=%d", A,B,C,D,SUM1,SUM2,SUM3);

    A=4'd0; B=4'd3; C=8'd1; D=8'd255;
    #3;

    A=4'd10; B=4'd13; C=8'd9; D=8'd10;
    #3;

    A=4'd15; B=4'd15; C=8'd109; D=8'd37;
    #3;

    A=4'd0; B=4'd9; C=8'd45; D=8'd45;
    #3;

end
    
endmodule