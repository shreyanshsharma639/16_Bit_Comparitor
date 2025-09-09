module comp16 (gt,eq,lt,A,B); //276
input [15:0] A,B;
output gt,eq,lt;

comp8 C1 (a,b,c,A[15:8],B[15:8]); //132
comp8 C2 (d,e,f,A[7:0],B[7:0]); //132
mux3 M3 ({gt,eq,lt},b,{d,e,f},{a,b,c}); //12
endmodule