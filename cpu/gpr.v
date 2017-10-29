`include "../include/cpu.h"
`include "../include/isa.h"
`include "../include/stddef.h"
`include "../include/global_config.h"
`include "../include/nettype.h"


module gpr (
	input wire clk,
	input wire reset,

	input wire[`RegAddrBus] rd_addr_0,
	output wire[`WordDataBus] rd_data_0,

	input wire[`RegAddrBus] rd_addr_1,
	output wire[`WordDataBus] rd_data_1,

	input wire we_,
	input wire[`WORD_ADDR_W+`BYTE_OFFSET_W-1 : 0] wr_addr,
	input wire[`WordDataBus] wr_data
);

reg [`WordDataBus] gpr [`REG_NUM-1 : 0];
integer i;

//读取控制
assign rd_data_0 = ( (we_ == `ENABLE_) && (wr_addr == rd_data_0) ) ? wr_data : gpr[rd_addr_0];
assign rd_data_1 = ( (we_ == `ENABLE_) && (wr_addr == rd_data_1) ) ? wr_data : gpr[rd_addr_1];


//写入访问
always @( posedge clk or `RESET_EDGE reset )
begin
	if(reset == `RESET_ENABLE)
	begin
		for(i=0; i<`REG_NUM; i=i+1)
		begin
			gpr[i] <= `WORD_DATA_W'h0;
		end
	end
	else
	begin
		if(we_ == `ENABLE_)
		begin
			gpr[wr_data] <= wr_data;
		end
	end
end

endmodule
