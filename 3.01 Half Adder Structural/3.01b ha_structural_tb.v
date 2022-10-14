`timescale 1ns/1ns
module ha_structural_tb ();

reg A, B;
wire SUM, CARRY;

//Instantiate the module
ha_structural HA1(.a(A), .b(B), .sum(SUM), .carry(CARRY));

//Monitor values
initial begin
    $monitor("A=%b, B=%b, SUM=%b, CARRY=%b", A, B, SUM, CARRY);
end

//Generate stimulus
initial begin
    A=0; B=0;
    #1; A=0; B=1;
    #1; A=1; B=0;
    #1; A=1; B=1;
    #1; A=0; B=0;

end
    
endmodule