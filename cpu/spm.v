`include "../include/cpu.h"
`include "../include/isa.h"
`include "../include/spm.h"
`include "../include/stddef.h"
`include "../include/global_config.h"
`include "../include/nettype.h"


module spm (
	input wire clk,

	input wire[`SpmAddrBus] if_spm_addr,
	input wire if_spm_as_,
	input wire if_spm_rw,

	input wire[`WordDataBus] if_spm_wr_data,
	output wire[`WordDataBus] if_spm_rd_data,

	input wire[`SpmAddrBus] mem_spm_addr,
	input wire mem_spm_as_,
	input wire mem_spm_rw,
	input wire[`WordDataBus] mem_spm_wr_data,
	output wire[`WordDataBus] mem_spm_rd_data
);

reg wea;
reg web;

always @(*) 
begin
	if( (if_spm_as_ == `ENABLE_) && (if_spm_rw == `WRITE) )
	begin
		wea = `MEMORY_ENABLE;
	end
	else
	begin
		wea = `MEMORY_DISABLE;
	end

	if( (mem_spm_as_ == `ENABLE_) && (mem_spm_rw == `WRITE) )
	begin
		web = `MEMORY_ENABLE;
	end
	else
	begin
		web = `MEMORY_DISABLE;
	end
end

x_s3e_dpram x_s3e_dpram(
	.clka(clk),
	.addra(if_spm_addr),
	.dina(if_spm_wr_data),
	.wea(wea),
	.douta(if_spm_rd_data),
	.clkb(clk),
	.addrb(mem_spm_addr),
	.dinb(mem_spm_wr_data),
	.web(web),
	.doutb(mem_spm_rd_data)
);



endmodule
