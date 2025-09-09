module comp1 (gt,eq,lt,a,b);
input a,b;
output gt,eq,lt;

wire abar, bbar; 

not G1 (abar, a);
not G2 (bbar, b);     
and G3 (gt, a, bbar);
and G4 (lt, abar, b); 
xnor G5 (eq, a, b);   

endmodule