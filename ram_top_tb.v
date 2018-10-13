module ram_top_tb();

wire [127:0] top_data_out;
reg [127:0] top_data_in;

reg read_en,write_en,clock,reset;

reg [11:0]rd_addr,wr_addr;

 ram_top DUT (clock,wr_addr,rd_addr,reset,read_en,write_en,top_data_in,top_data_out);

always
begin
	clock=1'b0;
	#5;
       	clock=1'b1;
	#5;
end

initial
begin
	@(negedge clock);reset=1'b1;
	@(negedge clock);
	reset=1'b0;wr_addr=12'd2;top_data_in=$random;write_en=1;read_en=0;
	@(negedge clock);
	reset=1'b0;rd_addr=12'd2;write_en=0;read_en=1;wr_addr=12'dx;
	#20 $finish;
end
endmodule

