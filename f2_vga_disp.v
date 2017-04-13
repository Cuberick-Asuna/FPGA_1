module f2_vga_disp (input wire east,
input wire west,
input wire north,
input wire south,
input wire auto,
input wire switch,
input wire sysclk,
output wire hsync,
output wire vsync,
output wire [2:0] color);


wire clk;
wire reset;

wire [9:0] hc;
wire [9:0] vc;
wire disp_on;

wire west_deb;
wire east_deb;
wire north_deb;
wire south_deb;

wire [2:0] ROM_output;
wire [1:0] ROM_input_image_no;
wire [3:0] ROM_input_x;
wire [3:0] ROM_input_y;

clockdivider clockdivider ( .sysclk(sysclk),
.reset(reset),
.slowclk(clk)
);

debouncer deb_W ( .set(west),
.sysclk(sysclk),
.reset(reset),
.set_deb(west_deb)
);

debouncer deb_E ( .set(east),
.sysclk(sysclk),
.reset(reset),
.set_deb(east_deb)
);

debouncer deb_N ( .set(north),
.sysclk(sysclk),
.reset(reset),
.set_deb(north_deb)
);

debouncer deb_S ( .set(south),
.sysclk(sysclk),
.reset(reset),
.set_deb(south_deb)
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

f2_disp_processor f2_disp_processor ( .clk(clk),
.backwards(west_deb),
.forwards(east_deb),
.rotate(north_deb),
.inverse(south_deb),
.f2_switch_command(auto),
.hc(hc),
.vc(vc),
.disp_on(disp_on),
.image_pxl_color(ROM_output),
.current_img(ROM_input_image_no),
.actual_pxl_x_for_ROM(ROM_input_x),
.actual_pxl_y_for_ROM(ROM_input_y),
.color(color)
);

f2_ROM f2_ROM ( .x(ROM_input_x),
.y(ROM_input_y),
.image_no(ROM_input_image_no),
.color(ROM_output)
);


endmodule