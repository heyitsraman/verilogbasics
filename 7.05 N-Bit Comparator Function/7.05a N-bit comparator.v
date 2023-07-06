module func_compare_nbit #(parameter comp_width = 4) (a,b,greater,equal,smaller);

input [comp_width-1:0]a,b;
output reg greater, equal, smaller;

function [2:0] compare (input[comp_width-1:0]a, input[comp_width-1:0]b);

    reg greater_local, equal_local, smaller_local;
    begin
        
        greater_local = (a>b);
        equal_local = (a==b);
        smaller_local = (a<b);
        compare = {greater_local, equal_local, smaller_local};
    end

endfunction

always @(*) begin
        {greater,equal,smaller} = compare(a,b);
end

endmodule