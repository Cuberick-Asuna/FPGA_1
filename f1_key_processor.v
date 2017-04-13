module f1_key_processor (input wire R,
input wire G,
input wire B,
input wire set,
input wire clk,
output reg [2:0] color
);


// key processor and display processor

initial begin
	color = 3'b000;
end

always @(posedge clk)
begin
	if (set)
	begin
		color <= {R,G,B};
	end
end

endmodule
