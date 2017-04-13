module f2_scaler (input wire [9:0] on_screen_pxl_x,
input wire [9:0] on_screen_pxl_y,
output reg [3:0] actual_pxl_x,
output reg [3:0] actual_pxl_y
);

always @(*)
begin
	if (on_screen_pxl_x < 261) 
		actual_pxl_x = 0;
	else if (on_screen_pxl_x < 291) 
		actual_pxl_x = 1;
	else if (on_screen_pxl_x < 321) 
		actual_pxl_x = 2;
	else if (on_screen_pxl_x < 351) 
		actual_pxl_x = 3;
	else if (on_screen_pxl_x < 381) 
		actual_pxl_x = 4;
	else if (on_screen_pxl_x < 411) 
		actual_pxl_x = 5;
	else if (on_screen_pxl_x < 441) 
		actual_pxl_x = 6;
	else if (on_screen_pxl_x < 471) 
		actual_pxl_x = 7;
	else if (on_screen_pxl_x < 501) 
		actual_pxl_x = 8;
	else if (on_screen_pxl_x < 531) 
		actual_pxl_x = 9;
	else if (on_screen_pxl_x < 561) 
		actual_pxl_x = 10;
	else if (on_screen_pxl_x < 591) 
		actual_pxl_x = 11;
	else if (on_screen_pxl_x < 621) 
		actual_pxl_x = 12;
	else if (on_screen_pxl_x < 651) 
		actual_pxl_x = 13;
	else if (on_screen_pxl_x < 681) 
		actual_pxl_x = 14;
	else  
		actual_pxl_x = 15;
		
		
		
		
	if (on_screen_pxl_y < 66) 
		actual_pxl_y = 0; 
	else if (on_screen_pxl_y < 96) 
		actual_pxl_y = 1; 
	else if (on_screen_pxl_y < 126) 
		actual_pxl_y = 2;
	else if (on_screen_pxl_y < 156) 
		actual_pxl_y = 3;
	else if (on_screen_pxl_y < 186) 
		actual_pxl_y = 4;
	else if (on_screen_pxl_y < 216) 
		actual_pxl_y = 5;
	else if (on_screen_pxl_y < 246) 
		actual_pxl_y = 6;
	else if (on_screen_pxl_y < 276) 
		actual_pxl_y = 7;
	else if (on_screen_pxl_y < 306) 
		actual_pxl_y = 8;
	else if (on_screen_pxl_y < 336) 
		actual_pxl_y = 9;
	else if (on_screen_pxl_y < 366) 
		actual_pxl_y = 10;
	else if (on_screen_pxl_y < 396) 
		actual_pxl_y = 11;
	else if (on_screen_pxl_y < 426) 
		actual_pxl_y = 12;
	else if (on_screen_pxl_y < 456) 
		actual_pxl_y = 13;
	else if (on_screen_pxl_y < 486) 
		actual_pxl_y = 14;
	else 
		actual_pxl_y = 15;
end
