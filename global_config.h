`ifndef GLOBAL_CONFIG_H
	`define GLOBAL_CONFIG_H

	`define POSITIVE_RESET
	//`define NEGATIVE_RESET

	`define POSITIVE_MEMORY
	//`define NEGATIVE_MEMORY

	//`define IMPLEMENT_TIMER
	//`define IMPLEMENT_UART
	//`define IMPLEMENT_GPIO

	`ifdef POSITIVE_RESET
		`define RESET_EDGE posedge
	`else
		`define RESET_EDGE negedge
	`endif

	`ifdef POSITIVE_RESET
		`define RESET_ENABLE 1'b1
	`else
		`define RESET_ENABLE 1'b0
	`endif

	`ifdef POSITIVE_RESET
		`define RESET_DISABLE 1'b0
	`else
		`define RESET_DISABLE 1'b1
	`endif

	`ifdef POSITIVE_MEMORY
		`define MEMORY_ENABLE 1'b1
	`else
		`define MEMORY_ENABLE 1'b0
	`endif

	`ifdef POSITIVE_MEMORY
		`define MEMORY_DISABLE 1'b0
	`else
		`define MEMORY_DISABLE 1'b1
	`endif

`endif

//IF
//ID
//EX
//MEM
//WB