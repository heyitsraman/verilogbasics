module func_compare_nbit_tb ();

parameter comp_width = 4;
reg [comp_width-1:0]a,b;
wire greater, equal, smaller;

func_compare_nbit #(.comp_width(comp_width)) dut(.a(a), .b(b), .greater(greater), .equal(equal), .smaller(smaller));


initial begin
    
    $monitor($time, " A=%d, B=%d, Greater=%b, Equal=%b, Smaller=%b", a,b,greater,equal,smaller);
    #1; a=3; b=6;
    #1; a=14; b=10;
    #1; a=2; b=2;
    #2;
    $stop;
    
end
    
endmodule