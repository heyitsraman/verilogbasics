module majority_gate #(parameter N=8) (a,y);

input [N-1:0] a;
output reg y;
integer count_1;

integer i;

always @(*)  begin
    
    count_1 = 0;
    for(i=0; i<N; i=i+1) begin
     if(a[i] == 1'b1)
        count_1 = count_1 + 1;

    end

    y = (count_1 > (N/2)) ? 1:0;

end

    
endmodule