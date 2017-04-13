module vga_disp (input wire R,
input wire G,
input wire B,
input wire reset,
input wire set,
input wire switch,
input wire sysclk,
output wire hsync,
output wire vsync,
output wire [2:0] color
);


wire clk;
wire set_deb;
wire [9:0] hc;
wire [9:0] vc;
wire disp_on;
wire [2:0] color_record;
wire flag;


clockdivider clockdivider ( .sysclk(sysclk),
.reset(reset),
.slowclk(clk)
);

debouncer debouncer ( .set(set),
.sysclk(sysclk),
.reset(reset),
.set_deb(set_deb)
);

vga_init vga_init ( .clk(clk),
.reset(reset),
.switch(switch),
.hc(hc),
.vc(vc),
.hsync(hsync),
.vsync(vsync),
.disp_on(disp_on)
);




f1_key_processor f1_key_processor ( .R(R),
.G(G),
.B(B),
.set(set_deb),
.clk(clk),
.color(color_record)
);

f1_RAM f1_RAM ( .disp_on(disp_on),
.color_in(color_record),
.color_out(color)
);

endmodule