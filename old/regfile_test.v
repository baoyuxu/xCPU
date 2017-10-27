`timescale 1ns/1ps
`include "regfile.h"

module regfile_test ;
	reg clk;
	reg reset;
	reg [`ADDRBUS] addr;
	reg [`DATABUS] d_in;
	reg we;
	wire [`DATABUS] d_out;
	integer i;
	parameter STEP = 100.000;

always #(STEP/2)
begin
	clk <= ~clk;
end

regfile regfile(
	.clk(clk),
	.reset(reset),
	.addr(addr),
	.d_in(d_in),
	.we(we),
	.d_out(d_out)
);

initial
begin
	# 0
	begin
		clk <= 0;
		reset <= `ENABLE;
		addr <= {`ADDR_W{1'b0}};
		d_in <= {`DATA_W{1'b0}};
		we <= `DISABLE;
	end

	#STEP
	begin
		reset <= `DISABLE;
	end

	#STEP
	begin
		for(i = 0; i < `DATA_D; i = i+1)
		begin
			#STEP
			begin
				addr <= i;
				d_in <= i;
				we <= `ENABLE;
			end
			#STEP
			begin
				addr <= {`ADDR_W{1'b0}};
				d_in <= {`DATA_W{1'b0}};
				we <= `DISABLE;
				if(d_out == i)
				begin
					$display($time," regfile[%d] R/W Check OK! %d", i, d_out);
				end
				else
				begin
					$display($time," regfile[%d] R/W Check NG! %d", i, d_out);
				end
			end

		end
	end
	#STEP
	begin
		$finish;
	end
end

initial
begin
	$dumpfile("regfile.vcd");
	$dumpvars(0, regfile);
end

endmodule