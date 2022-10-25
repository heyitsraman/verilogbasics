module procedures ();

reg [7:0] var1;
reg [7:0] var2;
wire [8:0] sum;
reg [15:0] product;

//All the procedures are executed in parallel

//Continuous assignment (Dataflow Style)
assign sum = var1 + var2;

//Behavioral Style - Conttrolled by the change of var1 or var2
always @(var1 or var2) begin
    product = var1 * var2;

end

//Behavioral Style - Controlled by the change of var1 or var2
always @(var1) begin
    $display("MON_var1: %0d", var1);
    
end

//Behavioral Style - Controlled by the change of all the parameters
always @(*) begin
    $display("MON_ALL: var1=%0d, var2=%0d, sum=%0d, product=%0d", var1, var2, sum, product);

end

//Behavioral Style - Generate Stimulus
initial begin
    var1 = 10; var2 = 99;
    #1;
    var2 = 33;
    #1;
    var1 = var2 << 2;           //00100001 -> 10000100
    #1;
    var2 = var2 >> 3;           //00100001 -> 00000100
    #1;
    var2 = var2 + 1;

end

endmodule