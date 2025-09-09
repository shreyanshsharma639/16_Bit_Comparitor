module comp2 (gt,eq,lt,A,B);
input [1:0]A,B;
output gt,eq,lt;

comp1 C1 (a,b,c,A[1],B[1]); //5
comp1 C2 (d,e,f,A[0],B[0]); //5
mux3 M3 ( {gt,eq,lt},b,{d,e,f},{a,b,c});
endmodule 