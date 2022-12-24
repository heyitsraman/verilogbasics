module comparator_1bit (a,b,smaller,equal,greater);

input a,b;
output smaller,equal,greater;

wire nota,notb;

not NOT1(nota,a);
not NOT2(notb,b);

and AND1(smaller,nota,b);
xnor XNOR1(equal,a,b);
and AND2(greater,a,notb);
    
endmodule