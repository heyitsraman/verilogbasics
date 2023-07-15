module tb_majority_gate ();

parameter N = 8;
reg [N-1:0]A;
wire Y;

integer i;

majority_gate #(.N(N)) dut (.a(A), .y(Y));

initial begin

        $monitor($time, " A=%b, Y=%b", A, Y);

        for (i=0; i<2**N ;i=i+1 ) begin
            A=i;
            #2;
        end
  
        #40; $stop;

end

    
endmodule