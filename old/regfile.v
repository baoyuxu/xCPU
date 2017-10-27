`include "regfile.h"

module regfile(
	input wire clk,
	input wire reset,
	input wire [`ADDRBUS] addr,
	input wire [`DATABUS] d_in,
	input wire we,
	output wire [`DATABUS] d_out
);

reg [`DATABUS] reg_file[`DATA_D-1:0];
integer i;

assign d_out = reg_file[addr];

always @(posedge clk or negedge reset) 
begin
	if(reset == `ENABLE)
	begin
		for(i = 0; i < `DATA_D; i=i+1)
		begin
			reg_file[i] <= {`DATA_W{1'b0}}; 
		end
	end
	else 
	begin
		if(we == `ENABLE)
		begin
			reg_file[addr] <= d_in;
		end
	end
end

endmodule // regfile