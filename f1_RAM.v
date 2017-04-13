module f1_RAM (input wire disp_on,
input wire [2:0]color_in,
output reg [2:0] color_out
);


// RAM storage for f1
always @(*)
begin
	if (disp_on) 
		color_out = color_in;
	else
		color_out = 3'b000;
end

endmodule
