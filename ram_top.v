`define RAM_WIDTH 128
`define RAM_DEPTH 4096
`define RAM_ADDR 12

module ram_top (clock,wr_addr,rd_addr,reset,read_en,write_en,top_data_in,top_data_out);

input [`RAM_ADDR-1:0] wr_addr,rd_addr;
input [`RAM_WIDTH-1:0] top_data_in;
input clock,reset,read_en,write_en;

output [`RAM_WIDTH-1:0] top_data_out;

wire [3:0] wr_dec_out;
wire [3:0] rd_dec_out;
wire [3:0] or_out;

ram_decoder WR_DECODER(.dec_in(wr_addr[11:10]),.dec_out(wr_dec_out[3:0]));

ram_decoder RD_DECODER(.dec_in(rd_addr[11:10]),.dec_out(rd_dec_out[3:0]));

or OR1 (or_out[0],wr_dec_out[0],rd_dec_out[0]);
or OR2 (or_out[1],wr_dec_out[1],rd_dec_out[1]);
or OR3 (or_out[2],wr_dec_out[2],rd_dec_out[2]);
or OR4 (or_out[3],wr_dec_out[3],rd_dec_out[3]);


ram_syn_dual_1024_64 RAM_0(.wr_addr(wr_addr[9:0]),.rd_addr(rd_addr[9:0]),
			   .data_in(top_data_in[127:64]),.chip_select(or_out[0]),
			   .data_out(top_data_out [127:64]),.read_en(read_en),
			   .write_en(write_en),.clock(clock),.reset(reset));

ram_syn_dual_1024_64 RAM_1(.wr_addr(wr_addr[9:0]),.rd_addr(rd_addr[9:0]),
			   .data_in(top_data_in[127:64]),.chip_select(or_out[1]),
			   .data_out(top_data_out [127:64]),.read_en(read_en),
			   .write_en(write_en),.clock(clock),.reset(reset));

ram_syn_dual_1024_64 RAM_2(.wr_addr(wr_addr[9:0]),.rd_addr(rd_addr[9:0]),
			   .data_in(top_data_in[127:64]),.chip_select(or_out[2]),
			   .data_out(top_data_out [127:64]),.read_en(read_en),
			   .write_en(write_en),.clock(clock),.reset(reset));

ram_syn_dual_1024_64 RAM_3(.wr_addr(wr_addr[9:0]),.rd_addr(rd_addr[9:0]),
			   .data_in(top_data_in[127:64]),.chip_select(or_out[3]),
			   .data_out(top_data_out [127:64]),.read_en(read_en),
			   .write_en(write_en),.clock(clock),.reset(reset));		   


ram_syn_dual_1024_64 RAM_4(.wr_addr(wr_addr[9:0]),.rd_addr(rd_addr[9:0]),
			   .data_in(top_data_in[63:0]),.chip_select(or_out[0]),
			   .data_out(top_data_out [63:0]),.read_en(read_en),
			   .write_en(write_en),.clock(clock),.reset(reset));

ram_syn_dual_1024_64 RAM_5(.wr_addr(wr_addr[9:0]),.rd_addr(rd_addr[9:0]),
			   .data_in(top_data_in[63:0]),.chip_select(or_out[1]),
			   .data_out(top_data_out [63:0]),.read_en(read_en),
			   .write_en(write_en),.clock(clock),.reset(reset));
	
ram_syn_dual_1024_64 RAM_6(.wr_addr(wr_addr[9:0]),.rd_addr(rd_addr[9:0]),
			   .data_in(top_data_in[63:0]),.chip_select(or_out[2]),
			   .data_out(top_data_out [63:0]),.read_en(read_en),
			   .write_en(write_en),.clock(clock),.reset(reset));

ram_syn_dual_1024_64 RAM_7(.wr_addr(wr_addr[9:0]),.rd_addr(rd_addr[9:0]),
			   .data_in(top_data_in[63:0]),.chip_select(or_out[3]),
			   .data_out(top_data_out [63:0]),.read_en(read_en),
			   .write_en(write_en),.clock(clock),.reset(reset));

		   endmodule		   
