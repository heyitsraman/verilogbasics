module shift_lr (clk,reset,in,load_enable,sel,q);

input clk, reset, load_enable, sel;
input [7:0]in;
output reg[7:0]q;

always @(posedge clk or negedge reset) begin
    
    if (!reset) begin
        q <= 8'b0;
    end

    else if (load_enable == 1'b0) begin          //if load_enable=0, load value of input to output
        q <= in;
    end

    else begin                                  //if load_enable=1, shift value of output
        if(sel==0)
            q <= {q[6:0], 1'b0};                //if sel=0, left shift

        else                            
            q <= {1'b0, q[7:1]};                //if sel=1, right shift
    end

end

endmodule