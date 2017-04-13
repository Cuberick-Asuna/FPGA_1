module f2_RAM (input wire clk,
input wire [9:0] hc,
input wire [9:0] vc, //mark the current pixel position
input wire [3:0] actual_pxl_x,
input wire [3:0] actual_pxl_y, //the actual pxl (mapping) obtained from scaler
input wire [2:0] image_pxl_color, //the current pxl data from the f2_ROM
output reg [9:0] current_x_for_scaler,
output reg [9:0] current_y_for_scaler, //current display pxl position (same as hc, vc) for scaler
output reg [3:0] actual_pxl_x_for_ROM,
output reg [3:0] actual_pxl_y_for_ROM, //the actual pxl location for ROM (asking for the color as return)
output reg [2:0] color
);


// might be able to integrate with Display processor