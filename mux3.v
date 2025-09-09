module mux3 (Y,S,I1,I0); 
input [2:0] I1,I0;
output [2:0] Y;
input S;

mux G0 (Y[0],S,I1[0],I0[0]);
mux G1 (Y[1],S,I1[1],I0[1]);
mux G2 (Y[2],S,I1[2],I0[2]);

endmodule