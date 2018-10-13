module ram_dec_tb ();

wire [3:0] dec_out;
reg [1:0] dec_in;
integer i;
ram_decoder DUT (dec_in,dec_out);

/*always
begin
	clock=1'b0;
	forever #5 clock=~clock;
end*/

initial
begin

	for(i=0;i<4;i=i+1)
	begin
		
		dec_in=i;
		#5;
	end
	#10 $finish;
end
endmodule
