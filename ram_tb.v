module ram_tb ();

parameter  RAM_WIDTH=64,
           RAM_ADDR=10,
	   RAM_DEPTH=1024;
   
reg [RAM_ADDR-1:0] wr_addr,rd_addr;
reg [RAM_WIDTH-1:0] data_in;
reg clock,reset,write_en,read_en,chip_select;

wire [RAM_WIDTH-1:0] data_out;

ram_syn_dual_1024_64 DUT (wr_addr,rd_addr,data_in,chip_select,
		      data_out,read_en,write_en,clock,reset);

	      always
	      begin
		      #5;
		      clock=1'b0;
		      #5;
		      clock=1'b1;
		      #5;
	   	end

		initial
		begin
			@(negedge clock); reset=1'b1;
			@(negedge clock); reset=1'b0;chip_select=1;wr_addr=10'd2;write_en=1;read_en=0;data_in=$random;
			@(negedge clock); rd_addr=3'd2;read_en=1;write_en=0;
				#10 $finish;
		end
	
		endmodule


 
