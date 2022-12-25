module decoder_4to16 (a,Y);

input [3:0]a;
output [15:0]Y;

decoder_3to8 dec1(.enable(~a[3]), .d(a[2:0]), .y(Y[7:0]));
decoder_3to8 dec2(.enable(a[3]), .d(a[2:0]), .y(Y[15:8]));
    
endmodule