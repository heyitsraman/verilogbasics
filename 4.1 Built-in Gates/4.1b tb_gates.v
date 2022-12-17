module tb_gates ();

reg a,b,c,d;
wire o1,o2,o3,o4,o5,o6,o7,o8,o9,o10;

builtin_gates dut (a,b,c,d,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10);

initial begin
    #0.5; a=1; b=0; c=1; d=0;
    #1; a=0; b=1; c=0; d=1;
    #2; a=0; b=0; c=1; d=0;
    #1; a=1; b=1; c=1; d=1;
    #1; a=0; b=0; c=0; d=0;
    #5;
end
    
endmodule