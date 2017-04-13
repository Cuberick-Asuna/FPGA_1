module vga_init (input wire clk,
input wire reset,
input wire switch,
output wire hsync,
output wire vsync,
output reg [9:0] hc,
output reg [9:0] vc,
output wire disp_on);

parameter hpixels = 10'd800;
parameter vlines = 10'd521;

reg vsenable;

initial begin
	hc = 1'b0;
	vc = 1'b0;
end



always @(posedge clk) 
begin
	if (reset || ~switch)
		hc <= 0;
	else 
	begin
		if (hc == hpixels - 1)
			begin
				hc <= 0;
				vsenable <= 1;
			end
		else
			begin
				hc <= hc + 1;
				vsenable <= 0;
			end
	end
end

always @(posedge clk) 
begin
	if (reset || ~switch)
		vc <= 0;
	else 
	begin
		if (vsenable) 
		begin
			if (vc == vlines - 1)
				vc <= 0;
			else
				vc <= vc + 1;
		end
	end
end

assign hsync = (hc < 8 || hc > 103);
// change from 103 to 104 to ensure the sync output!!
assign vsync = (vc < 2 || vc > 3);
assign disp_on = (hc > 151 && hc < 791 && vc > 36 && vc < 516);

endmodule
