module clockdivider(input wire sysclk,
input wire reset,
output wire slowclk);

parameter WIDTH = 1;
reg [(WIDTH-1):0] count;
assign slowclk = count[WIDTH-1];

always @(posedge sysclk) begin
	if(reset)
		count <= {WIDTH{1'b0}};
	else
		count<=count+1'b1;
	end
endmodule