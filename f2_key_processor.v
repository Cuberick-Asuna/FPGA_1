module f2_key_processor ( input wire backwards,
input wire forwards,
input wire rotate,
input wire inverse,
input wire autoslide,
output reg [3:0] f2_button_command,
output reg f2_switch_command);

initial begin
	f2_button_command = 1'b0;
	f2_switch_command = 1'b0;
end

always @ (*)
begin
	if (backwards)
		f2_button_command = 3'b001;
	else if (forwards)
		f2_button_command = 3'b010;
	else if (rotate)
		f2_button_command = 3'b011;
	else if (inverse)
		f2_button_command = 3'b100;
	else
		f2_button_command = 3'b000;
	
end

always @ (*)
begin
	f2_switch_command = autoslide;
end

endmodule
