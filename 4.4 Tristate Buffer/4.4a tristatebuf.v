module tristatebuf (din,dhigh,dlow,sel);

input din,sel;
output dhigh, dlow;

bufif1 B1(dhigh,din,sel);
bufif0 B2(dlow,din,sel);
    
endmodule