`ifndef BUS_H
	`define BUS_H

	`define BUS_MASTER_CH 4
	`define BUS_MASTER_INDEX_W 2
	`define BusOwnerBus 1:0

	`define BUS_OWNER_MASTER_0 2'b00
	`define BUS_OWNER_MASTER_1 2'b01
	`define BUS_OWNER_MASTER_2 2'b10
	`define BUS_OWNER_MASTER_3 2'b11

	`define BUS_SLAVE_CH 8
	`define BUS_SLAVE_INDEX_W 3
	`define BusSalveIndexBus 2:0
	`define BusSalveIndexLoc 29:27

	`define BUS_SLAVE_0 3'b000
	`define BUS_SLAVE_1 3'b001
	`define BUS_SLAVE_2 3'b010
	`define BUS_SLAVE_3 3'b011
	`define BUS_SLAVE_4 3'b100
	`define BUS_SLAVE_5 3'b101
	`define BUS_SLAVE_6 3'b110
	`define BUS_SLAVE_7 3'b111


`endif