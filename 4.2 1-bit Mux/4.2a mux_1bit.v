module mux_1bit (a,b,x,y);

input x,a,b;
output y;

wire notx, bit1, bit2;

not not1(notx,x);
and and1(bit1,notx,a);
and and2(bit2,x,b);
or or1(y,bit1,bit2);

    
endmodule