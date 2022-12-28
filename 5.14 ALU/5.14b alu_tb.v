module alu_tb ();

parameter bus_width = 8;
reg [bus_width-1:0]a,b;
reg carry_in, borrow_in;
reg [3:0]opcode;      //We have 16 operations to be performed

wire [bus_width-1:0]y;
wire carry_out, borrow_out, invalid_op;
wire zero, parity;
integer i=0;


alu dut (a,b,carry_in,opcode,y,carry_out,borrow_out,borrow_in,zero,parity,invalid_op);

initial begin

    $monitor("Time=%0t, Opcode=%d, A=%d, B=%d, Carry_in=%b, Borrow_in=%b, Y=%d, Y(in binary)=%b, Borrow_out=%b, Carry_out=%b, Zero=%b, Parity=%b, Invalid_op=%b", 
              $time, opcode, a,b,carry_in,borrow_in,
              y, y, borrow_out, carry_out, zero, parity, invalid_op);

    a=0; b=0; opcode=0; carry_in=0; borrow_in=0;

    for (i=1;i<=16;i=i+1) begin
        opcode=i;
        $display("Operation %0d:",i);
        a=8'b1000_1111; b=8'b0000_0011;
        #2;
    end
    #1; 
    a=25; b=25; opcode=23;
    #5;
    $stop;

end
    
endmodule