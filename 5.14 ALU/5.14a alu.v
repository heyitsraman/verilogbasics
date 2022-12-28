module alu (a,b,carry_in,opcode,y,carry_out,borrow_out,borrow_in,zero,parity,invalid_op);

parameter bus_width = 8;
input [bus_width-1:0]a,b;
input carry_in, borrow_in;
input [3:0]opcode;      //We have 16 operations to be performed

output reg [bus_width-1:0]y;
output reg carry_out, borrow_out, invalid_op;
output zero, parity;

//Define the list of opcodes
/*Use of localparam ensures that the variables values cannot be changed in any other 
  instantiation modules*/

localparam OP_ADD = 1;                          //A+B
localparam OP_ADD_CARRY = 2;                    //A+B+Carry  
localparam OP_SUB = 3;                          //A-B
localparam OP_SUB_BORROW = 4;                   //A-B-Borrow
localparam OP_INC = 5;                          //Increment A
localparam OP_DEC = 6;                          //Decrement A
localparam OP_NOT = 7;                          //NOT A
localparam OP_AND = 8;                          //A AND B
localparam OP_OR = 9;                           //A OR B
localparam OP_XOR = 10;                         //A XOR B
localparam OP_ROL = 11;                         //Rotate Left A
localparam OP_ROR = 12;                         //Rotate Right A
localparam OP_LALS = 13;                        //Arithmetic and Logical Left Shift
localparam OP_ARS = 14;                         //Arithmetic Right Shift
localparam OP_LRS = 15;                         //Logical Right Shift
localparam OP_RRTC = 16;                        //Rotate Right Through Carry

always @(*) begin
    
    y=0; carry_out=0; borrow_out=0; invalid_op=0; 

    case (opcode)
        OP_ADD : {carry_out,y} = a+b;
        OP_ADD_CARRY : {carry_out,y} = a+b+carry_in;
        OP_SUB : {borrow_out,y} = a-b;
        OP_SUB_BORROW : {borrow_out,y} = a-b-borrow_in;
        OP_INC : {carry_out,y} = a+1'b1;
        OP_DEC : {borrow_out,y} = a-1'b1;
        OP_NOT : y = ~a;
        OP_AND : y = a&b;
        OP_OR : y = a|b;
        OP_XOR : y = a^b;
        OP_ROL : y = {a[bus_width-2:0], a[bus_width-1]};
        OP_ROR : y = {a[0], a[bus_width-1:1]};
        OP_LALS : y = {a[bus_width-2:0], 1'b0};
        OP_ARS : y = {a[bus_width-1], a[bus_width-1:1]};
        OP_LRS : y = {1'b0, a[bus_width-1:1]};
        OP_RRTC : {y,carry_out} = {carry_out,a};
        default: invalid_op = 1;

    endcase
end
    
    assign zero = (y==0);
    assign parity = ^y;

endmodule