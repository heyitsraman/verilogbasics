module priority_encoder (d,q,v);

input [3:0]d;
output reg [1:0]q;
output reg v;

//Assigning values to Output
always @(*) begin
    if (d[3]) begin
        q = 2'd3;
    end

    else if (d[2]) begin
        q = 2'd2;
    end

    else if (d[1]) begin
        q = 2'd1;
    end

    else
        q=2'd0;
end

//Assigning values to Valid
always @(*) begin
    if(!d)
    v=0;
    else
    v=1;
end
    
endmodule