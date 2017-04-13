module f2_disp_processor ( input wire clk,
input wire backwards,
input wire forwards,
input wire rotate,
input wire inverse,
input wire f2_switch_command, // the two command prompt for f2 auto switch
input wire [9:0] hc,
input wire [9:0] vc, //mark the current pixel position
input wire disp_on,
input wire [2:0] image_pxl_color, //the current pxl data from the f2_ROM
output reg [1:0] current_img,
output reg [3:0] actual_pxl_x_for_ROM,
output reg [3:0] actual_pxl_y_for_ROM, //the actual pxl location for ROM (asking for the color as return)
output reg [2:0] color);


reg [3:0] actual_pxl_x;
reg [3:0] actual_pxl_y;
reg [1:0] rotate_count;
reg [23:0] timer;
reg inverse_flag;

initial begin
	actual_pxl_x = 1'b0;
	actual_pxl_y = 1'b0;
	actual_pxl_x_for_ROM = 1'b0;
	actual_pxl_y_for_ROM = 1'b0;
	color = 3'b000;
	current_img = 2'b0;
	rotate_count = 2'b00; //00 for normal, 01 90-deg ACW, 10 upside down, 11 90-deg CW
	inverse_flag = 1'b0;
end



// scaler section

/* 
Firstly, obtain hc, vc as the current pixel address;
then require the scaler to return the actual pixel location on the 16x16 image.
*/

always @(*)
begin
	if (hc < 261) 
		actual_pxl_x = 0;
	else if (hc < 291) 
		actual_pxl_x = 1;
	else if (hc < 321) 
		actual_pxl_x = 2;
	else if (hc < 351) 
		actual_pxl_x = 3;
	else if (hc < 381) 
		actual_pxl_x = 4;
	else if (hc < 411) 
		actual_pxl_x = 5;
	else if (hc < 441) 
		actual_pxl_x = 6;
	else if (hc < 471) 
		actual_pxl_x = 7;
	else if (hc < 501) 
		actual_pxl_x = 8;
	else if (hc < 531) 
		actual_pxl_x = 9;
	else if (hc < 561) 
		actual_pxl_x = 10;
	else if (hc < 591) 
		actual_pxl_x = 11;
	else if (hc < 621) 
		actual_pxl_x = 12;
	else if (hc < 651) 
		actual_pxl_x = 13;
	else if (hc < 681) 
		actual_pxl_x = 14;
	else  
		actual_pxl_x = 15;
		
	if (vc < 66) 
		actual_pxl_y = 0; 
	else if (vc < 96) 
		actual_pxl_y = 1; 
	else if (vc < 126) 
		actual_pxl_y = 2;
	else if (vc < 156) 
		actual_pxl_y = 3;
	else if (vc < 186) 
		actual_pxl_y = 4;
	else if (vc < 216) 
		actual_pxl_y = 5;
	else if (vc < 246) 
		actual_pxl_y = 6;
	else if (vc < 276) 
		actual_pxl_y = 7;
	else if (vc < 306) 
		actual_pxl_y = 8;
	else if (vc < 336) 
		actual_pxl_y = 9;
	else if (vc < 366) 
		actual_pxl_y = 10;
	else if (vc < 396) 
		actual_pxl_y = 11;
	else if (vc < 426) 
		actual_pxl_y = 12;
	else if (vc < 456) 
		actual_pxl_y = 13;
	else if (vc < 486) 
		actual_pxl_y = 14;
	else 
		actual_pxl_y = 15;
end

// control section
always @(posedge clk)
begin
	//check switch image (auto or not)
	if (f2_switch_command)
	begin
		if (&timer)
			begin
			current_img <= current_img + 1'b1;
			timer <= timer + 1;
			end
		else
			timer <= timer + 1;
	end
	
	
	else if (backwards)
	begin
		timer <= 0;
		current_img <= current_img - 1'b1;
	end
	
	else if (forwards)
	begin
		timer <= 0;
		current_img <= current_img + 1'b1;
	end
	
	
	//check inverse
	else if (inverse)
		inverse_flag <= ~inverse_flag;	
	
	// check rotate
	else if (rotate) begin
		rotate_count <= rotate_count + 1'b1;
		
	end		
end

// rotation processor
always @(*)
begin
	case (rotate_count)
			2'b00: begin
			actual_pxl_x_for_ROM <= actual_pxl_y;
			actual_pxl_y_for_ROM <= actual_pxl_x;	
			end
			
			2'b01: begin
			actual_pxl_x_for_ROM <= actual_pxl_x;
			actual_pxl_y_for_ROM <= actual_pxl_y;
			end
			
			2'b10: begin
			actual_pxl_x_for_ROM <= (15 - actual_pxl_y);
			actual_pxl_y_for_ROM <= (15 - actual_pxl_x);
			end
			
			2'b11: begin
			actual_pxl_x_for_ROM <= (15-actual_pxl_x);
			actual_pxl_y_for_ROM <= (15-actual_pxl_y);
			end
		endcase

end

// display section, provided that ROM has returned the color
always @(*)
begin
	if (disp_on) 
	begin
		if (inverse_flag)
			color = ~image_pxl_color;
//			color = 3'b010;
		else
			color = image_pxl_color;
//			color = 3'b101;
	end
	else
		color = 3'b000;
end

endmodule
