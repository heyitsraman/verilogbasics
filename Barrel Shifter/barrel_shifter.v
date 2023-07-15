//2x1 MUX
module mux2_1 (sel, i0, i1, mux_out);

input sel, i0, i1;
output mux_out;

assign mux_out = (sel) ? i1:i0;

endmodule



//Barrel shifter
module barrel_shifter (in, out, shift);

input [7:0]in;
input [2:0]shift;
output [7:0]out;

wire [7:0]out1, out2;

mux2_1 ins0 (.sel(shift[0]), .i0(1'b0),  .i1(in[0]), .mux_out(out1[0]));
mux2_1 ins1 (.sel(shift[0]), .i0(in[0]), .i1(in[1]), .mux_out(out1[1]));
mux2_1 ins2 (.sel(shift[0]), .i0(in[1]), .i1(in[2]), .mux_out(out1[2]));
mux2_1 ins3 (.sel(shift[0]), .i0(in[2]), .i1(in[3]), .mux_out(out1[3]));
mux2_1 ins4 (.sel(shift[0]), .i0(in[3]), .i1(in[4]), .mux_out(out1[4]));
mux2_1 ins5 (.sel(shift[0]), .i0(in[4]), .i1(in[5]), .mux_out(out1[5]));
mux2_1 ins6 (.sel(shift[0]), .i0(in[5]), .i1(in[6]), .mux_out(out1[6]));
mux2_1 ins7 (.sel(shift[0]), .i0(in[6]), .i1(in[7]), .mux_out(out1[7]));


mux2_1 ins8  (.sel(shift[1]),  .i0(1'b0),     .i1(out1[0]), .mux_out(out2[0]));
mux2_1 ins9  (.sel(shift[1]),  .i0(1'b0),     .i1(out1[1]), .mux_out(out2[1]));
mux2_1 ins10 (.sel(shift[1]),  .i0(out1[0]),  .i1(out1[2]), .mux_out(out2[2]));
mux2_1 ins11 (.sel(shift[1]),  .i0(out1[1]),  .i1(out1[3]), .mux_out(out2[3]));
mux2_1 ins12 (.sel(shift[1]),  .i0(out1[2]),  .i1(out1[4]), .mux_out(out2[4]));
mux2_1 ins13 (.sel(shift[1]),  .i0(out1[3]),  .i1(out1[5]), .mux_out(out2[5]));
mux2_1 ins14 (.sel(shift[1]),  .i0(out1[4]),  .i1(out1[6]), .mux_out(out2[6]));
mux2_1 ins15 (.sel(shift[1]),  .i0(out1[5]),  .i1(out1[7]), .mux_out(out2[7]));


mux2_1 ins16  (.sel(shift[2]),  .i0(1'b0),     .i1(out2[0]), .mux_out(out[0]));
mux2_1 ins17  (.sel(shift[2]),  .i0(1'b0),     .i1(out2[1]), .mux_out(out[1]));
mux2_1 ins18  (.sel(shift[2]),  .i0(1'b0),     .i1(out2[2]), .mux_out(out[2]));
mux2_1 ins19  (.sel(shift[2]),  .i0(1'b0),     .i1(out2[3]), .mux_out(out[3]));
mux2_1 ins20  (.sel(shift[2]),  .i0(out2[0]),  .i1(out2[4]), .mux_out(out[4]));
mux2_1 ins21  (.sel(shift[2]),  .i0(out2[1]),  .i1(out2[5]), .mux_out(out[5]));
mux2_1 ins22  (.sel(shift[2]),  .i0(out2[2]),  .i1(out2[6]), .mux_out(out[6]));
mux2_1 ins23  (.sel(shift[2]),  .i0(out2[3]),  .i1(out2[7]), .mux_out(out[7]));


endmodule


//Testbench for Barrel Shifter
module tb_barrel_shifter ();

reg [7:0]in;
reg [2:0]shift;
wire [7:0]out;

    
//Instantiate the DUT
barrel_shifter DUT(.in(in), .out(out), .shift(shift));

initial begin
    
    $monitor("Time=%0d",$time, " Input=%b, Shift=%b, Output=%b", in, shift, out);

    in=8'b1101_0110;
    #10;
    in=8'b1101_0110; shift=3'b001;
    #5;
    in=8'b1101_0110; shift=3'b010;
    #5;
    in=8'b1101_0110; shift=3'b011;
    #5;
    in=8'b1101_0110; shift=3'b100;
    #5;
    in=8'b1101_0110; shift=3'b101;
    #5;
    in=8'b1101_0110; shift=3'b110;
    #5;
    in=8'b1101_0110; shift=3'b111;
    
    #40 $stop;


end


endmodule