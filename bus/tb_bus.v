`timescale 1ns/1ps

`include "bus.h"
`include "../stddef.h"
`include "../global_config.h"
`include "../nettype.h"

`define WORD_ADDR_W__ 27

module tb_bus (); /* this is automatically generated */

	reg clk;

	// clock
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	// (*NOTE*) replace reset, clock, others

	reg                reset =  `RESET_ENABLE;
	reg                m0_req_ = `DISABLE_;
	wire                m0_grnt_;
	reg                m1_req_ = `DISABLE_;
	wire                m1_grnt_;
	wire                m2_req_ = `DISABLE_;
	wire                m2_grnt_;
	wire                m3_req_ = `DISABLE_;
	wire                m3_grnt_;
	wire [`WordAddrBus] m0_addr = {3'b000, `WORD_ADDR_W__'b0};
	wire                m0_as_ = `DISABLE_;
	wire                m0_rw = `WRITE;
	wire [`WordDataBus] m0_wr_data = `WORD_DATA_W'b0;
	wire [`WordAddrBus] m1_addr = {3'b001, `WORD_ADDR_W__'b0};
	wire                m1_as_  = `DISABLE_;
	wire                m1_rw  = `READ;
	wire [`WordDataBus] m1_wr_data = `WORD_DATA_W'b0;
	wire [`WordAddrBus] m2_addr = {3'b010, `WORD_ADDR_W__'b0};
	wire                m2_as_  = `DISABLE_;
	wire                m2_rw  = `READ;
	wire [`WordDataBus] m2_wr_data = `WORD_DATA_W'b0;
	wire [`WordAddrBus] m3_addr = {3'b011, `WORD_ADDR_W__'b0};
	wire                m3_as_  = `DISABLE_;
	wire                m3_rw  = `READ;
	wire [`WordDataBus] m3_wr_data = `WORD_DATA_W'b0;
	wire [`WordAddrBus] s_addr;
	wire                s_as_;
	wire                s_rw;
	wire [`WordDataBus] s_wr_data;
	wire                s0_cs_;
	wire                s1_cs_;
	wire                s2_cs_;
	wire                s3_cs_;
	wire                s4_cs_;
	wire                s5_cs_;
	wire                s6_cs_;
	wire                s7_cs_;
	wire [`WordDataBus] s0_rd_data = `WORD_DATA_W'b111111;
	wire                s0_rdy_ = `ENABLE_;
	wire [`WordDataBus] s1_rd_data = `WORD_DATA_W'b001;
	wire                s1_rdy_ = `ENABLE_;
	wire [`WordDataBus] s2_rd_data = `WORD_DATA_W'b010;
	wire                s2_rdy_ = `ENABLE_;
	wire [`WordDataBus] s3_rd_data = `WORD_DATA_W'b011;
	wire                s3_rdy_ = `ENABLE_;
	wire [`WordDataBus] s4_rd_data = `WORD_DATA_W'b100;
	wire                s4_rdy_ = `ENABLE_;
	wire [`WordDataBus] s5_rd_data = `WORD_DATA_W'b101;
	wire                s5_rdy_ = `ENABLE_;
	wire [`WordDataBus] s6_rd_data = `WORD_DATA_W'b110;
	wire                s6_rdy_ = `ENABLE_;
	wire [`WordDataBus] s7_rd_data = `WORD_DATA_W'b111;
	wire                s7_rdy_ = `ENABLE_;
	wire [`WordDataBus] m_rd_data;
	wire                m_rdy_;

	bus inst_bus
		(
			.clk        (clk),
			.reset      (reset),
			.m0_req_    (m0_req_),
			.m0_grnt_   (m0_grnt_),
			.m1_req_    (m1_req_),
			.m1_grnt_   (m1_grnt_),
			.m2_req_    (m2_req_),
			.m2_grnt_   (m2_grnt_),
			.m3_req_    (m3_req_),
			.m3_grnt_   (m3_grnt_),
			.m0_addr    (m0_addr),
			.m0_as_     (m0_as_),
			.m0_rw      (m0_rw),
			.m0_wr_data (m0_wr_data),
			.m1_addr    (m1_addr),
			.m1_as_     (m1_as_),
			.m1_rw      (m1_rw),
			.m1_wr_data (m1_wr_data),
			.m2_addr    (m2_addr),
			.m2_as_     (m2_as_),
			.m2_rw      (m2_rw),
			.m2_wr_data (m2_wr_data),
			.m3_addr    (m3_addr),
			.m3_as_     (m3_as_),
			.m3_rw      (m3_rw),
			.m3_wr_data (m3_wr_data),
			.s_addr     (s_addr),
			.s_as_      (s_as_),
			.s_rw       (s_rw),
			.s_wr_data  (s_wr_data),
			.s0_cs_     (s0_cs_),
			.s1_cs_     (s1_cs_),
			.s2_cs_     (s2_cs_),
			.s3_cs_     (s3_cs_),
			.s4_cs_     (s4_cs_),
			.s5_cs_     (s5_cs_),
			.s6_cs_     (s6_cs_),
			.s7_cs_     (s7_cs_),
			.s0_rd_data (s0_rd_data),
			.s0_rdy_    (s0_rdy_),
			.s1_rd_data (s1_rd_data),
			.s1_rdy_    (s1_rdy_),
			.s2_rd_data (s2_rd_data),
			.s2_rdy_    (s2_rdy_),
			.s3_rd_data (s3_rd_data),
			.s3_rdy_    (s3_rdy_),
			.s4_rd_data (s4_rd_data),
			.s4_rdy_    (s4_rdy_),
			.s5_rd_data (s5_rd_data),
			.s5_rdy_    (s5_rdy_),
			.s6_rd_data (s6_rd_data),
			.s6_rdy_    (s6_rdy_),
			.s7_rd_data (s7_rd_data),
			.s7_rdy_    (s7_rdy_),
			.m_rd_data  (m_rd_data),
			.m_rdy_     (m_rdy_)
		);

	initial begin
		
		reset = `RESET_ENABLE;
		#10
		reset = `RESET_DISABLE;

		m0_req_ = `ENABLE_;
		m1_req_ = `ENABLE_;
		#10
		m0_req_ = `DISABLE_;
		#10
		reset = `RESET_ENABLE;

		repeat(10)@(posedge clk);
		$finish;
	end

	// dump wave
	initial begin
        $dumpfile("tb_bus.vcd");
        $dumpvars(0, tb_bus);
	end

endmodule
