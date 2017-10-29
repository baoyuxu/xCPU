`include "../include/cpu.h"
`include "../include/isa.h"
`include "../include/spm.h"
`include "../include/stddef.h"
`include "../include/global_config.h"
`include "../include/nettype.h"
`include "../include/bus/bus.h"

module bus_if (
	input wire clk,
	input wire reset,

	input wire stall,
	input wire flush,
	output reg busy,

	input wire[`WordAddrBus] addr,
	input wire as_,
	input wire rw,
	input wire[`WordDataBus] wr_data,
	output reg[`WordDataBus] rd_data,

	input wire[`WordDataBus] spm_rd_data,
	output wire[`WordAddrBus] spm_addr,
	output reg spm_as_,
	output wire spm_rw,
	output wire[`WordDataBus] spm_wr_data,

	input wire[`WordDataBus] bus_rd_data,
	input wire bus_rdy_,
	input wire grnt_,
	output reg bus_req_,
	output wire[`WordAddrBus] bus_addr,
	output reg bus_as_,
	output wire bus_rw,
	output wire[`WordDataBus] bus_wr_data
);

reg[`BusIfStateBus] state;
reg[`WordDataBus] rd_buf;
wire [`BusSalveIndexBus] s_index;

assign s_index = addr[`BusSalveIndexLoc];
assign spm_addr = addr;
assign spm_rw = rw;
assign spm_wr_data = wr_data;

//内存访问控制

always @(*) 
begin
	rd_data = `WORD_DATA_W'h0;
	spm_as_ = `DISABLE_;
	busy = `DISABLE;

	case (state)
		`BUS_IF_STATE_IDLE:
		begin
			if( (flush == `DISABLE) && (as_ == `DISABLE_) )
			begin
				if(stall == `DISABLE)
				begin
					spm_as_ = `ENABLE_;
					if(rw == `READ)
					begin
						rd_data = spm_rd_data;
					end
				end
				else
				begin
					busy = `ENABLE;
				end
			end
		end

		`BUS_IF_STATE_REQ:
		begin
			busy = `ENABLE;
		end

		`BUS_IF_STATE_ACCESS:
		begin
			if(bus_rdy_ == `ENABLE_)
			begin
				if(rw == `READ)
				begin
					rd_data = bus_rd_data;
				end
			end
			else
			begin
				busy = `ENABLE;
			end
		end

		`BUS_IF_STATE_STALL:
		begin
			if(rw == `READ)
			begin
				rd_data = rd_buf;
			end
		end

	endcase
end

endmodule