module bit4adder_struct_tb ();

reg [3:0]a,b;
reg cin;
wire[3:0]sum;
wire cout;

integer i,j;        //used for verification

//Instantiate the module
bit4adder_structural dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

//Generate stimulus and monitor module ports
initial begin
    $monitor ("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", a,b,cin,sum,cout);

    a=4'b0000;  b=4'b0000;  cin=0; #5;
    a=4'b0000;  b=4'b0000;  cin=1; #5;
    a=4'b0001;  b=4'b0001;  cin=0; #5;
    a=4'b0001;  b=4'b0001;  cin=1; #5;
    a=4'd3;  b=4'd6;  cin=0; #5;
    a=4'b1111; b=4'b1111; cin=1; #5;

//Change the values of a and b to observe effects
for(i=0; i<2; i=i+1) begin
    for(j=0; j<2; j=j+1) begin
        a=i; b=j; cin=0;
    end
end
end

endmodule