module comp8 (gt,eq,lt,A,B);
input [7:0]A,B;
output gt,eq,lt;

comp4 C1 (a,b,c,A[7:4],B[7:4]);
comp4 C2 (d,e,f,A[3:0],B[3:0]);
mux3 M3 ({gt,eq,lt},b,{d,e,f},{a,b,c});

endmodule 