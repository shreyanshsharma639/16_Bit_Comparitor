module comp4 (gt,eq,lt,A,B);
input [3:0]A,B;
output gt,eq,lt;

comp2 C1 (a,b,c,A[3:2],B[3:2]);
comp2 C2 (d,e,f,A[1:0],B[1:0]);
mux3 M3 ({gt,eq,lt},b,{d,e,f},{a,b,c});

endmodule 