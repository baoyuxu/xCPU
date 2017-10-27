`include "bus.h"
`include "../stddef.h"
`include "../global_config.h"
`include "../nettype.h"

module bus_addr_dec (
	input wire[`WordAddrBus] s_addr,
	output reg s0_cs_,
	output reg s1_cs_,
	output reg s2_cs_,
	output reg s3_cs_,
	output reg s4_cs_,
	output reg s5_cs_,
	output reg s6_cs_,
	output reg s7_cs_
);
wire[`BusSalveIndexBus] s_index;
assign s_index = s_addr[`BusSalveIndexLoc];

always @(*)
begin
	s0_cs_ = `DISABLE_;
	s1_cs_ = `DISABLE_;
	s2_cs_ = `DISABLE_;
	s3_cs_ = `DISABLE_;
	s4_cs_ = `DISABLE_;
	s5_cs_ = `DISABLE_;
	s6_cs_ = `DISABLE_;
	s7_cs_ = `DISABLE_;

	case (s_index)
		`BUS_SLAVE_0:
		begin
			s0_cs_ = `ENABLE_;
		end
		`BUS_SLAVE_1:
		begin
			s1_cs_ = `ENABLE_;
		end
		`BUS_SLAVE_2:
		begin
			s2_cs_ = `ENABLE_;
		end
		`BUS_SLAVE_3:
		begin
			s3_cs_ = `ENABLE_;
		end
		`BUS_SLAVE_4:
		begin
			s4_cs_ = `ENABLE_;
		end
		`BUS_SLAVE_5:
		begin
			s5_cs_ = `ENABLE_;
		end
		`BUS_SLAVE_6:
		begin
			s6_cs_ = `ENABLE_;
		end
		`BUS_SLAVE_7:
		begin
			s7_cs_ = `ENABLE_;
		end
	endcase
end
endmodule // bus_addr_dec