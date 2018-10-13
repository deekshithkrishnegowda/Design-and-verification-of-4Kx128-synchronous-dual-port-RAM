
module ram_syn_dual_1024_64 (wr_addr,rd_addr,data_in,chip_select,
			     data_out,read_en,write_en,clock,reset);

parameter  RAM_WIDTH=64,
           RAM_ADDR=10,
	   RAM_DEPTH=1024;
   
input [RAM_ADDR-1:0] wr_addr,rd_addr;
input [RAM_WIDTH-1:0] data_in;
input clock,reset,write_en,read_en,chip_select;

output reg [RAM_WIDTH-1:0] data_out;
 


reg [RAM_WIDTH-1:0] mem [RAM_DEPTH-1:0];

always@(posedge clock)
begin
	if(reset)
		data_out<=64'b0;
	else
	begin
		if(chip_select)
			begin
		 		if(write_en) 						//write_operation
					 begin
			 			mem[wr_addr]<=data_in;
		 			end
		 		else
		 			begin
			 			mem[wr_addr]<=64'bx;
		 			end
	
					
		 		if(read_en)                                      	//read_operation
		 			begin
			 			data_out<=mem[rd_addr];
		 			end
		 		else
		 			begin
			 			data_out<=64'bx;
		 			end
	 		end
	 	else
		 data_out<=64'bx;
	 end
 end
 endmodule
