module tb;
reg [15:0] A,B;
wire gt,eq,lt;

comp16 DUT (gt,eq,lt,A,B);

initial 
   begin
   repeat (10) 
       begin
	   A=$random;
	   B=$random;
	   #1
	   $display (A,,B,,,gt,eq,lt);
	   end
	A=12345;
	B=12345;
	#1
	$display (A,,B,,,gt,eq,lt);
	end
endmodule