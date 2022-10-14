module adder8bit_tb ();

reg [7:0] A=0;              //Reg type for inputs
reg [7:0] B=0;
wire [8:0] SUM;             //Wire type for outputs

//Instantiate the Design Under Test (DUT)
adder8bit Adder(.a(A), .b(B), .sum(SUM));           //Syntax: .main module port name (Testbench Variable)

//Monitor Inputs and Output
initial begin
    $monitor("a=%d, b=%d, sum=%d", A, B, SUM);
end

//Generate Stimulus
initial begin

    A=1; #1; B=10; #1;
    A=3; B=99; #5;
    A=101; B=66; #5;
    A=255; B=255;

end

endmodule