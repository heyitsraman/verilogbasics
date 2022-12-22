module demux_1bit (s,x,y0,y1);

input s,x;
output y0,y1;

wire nots;

not not1(nots,s);
and and1(y0,nots,x);
and and2(y1,s,x);


    
endmodule