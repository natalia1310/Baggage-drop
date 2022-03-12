`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:42:56 11/13/2021 
// Design Name: 
// Module Name:    baggage_drop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
/////////////////////////////////////////////////////////////////////////////////	 
module baggage_drop( 
	 output   [6 : 0]   seven_seg1, 
    output   [6 : 0]   seven_seg2,
    output   [6 : 0]   seven_seg3,
    output   [6 : 0]   seven_seg4,
    output   [0 : 0]   drop_activated,
    input    [7 : 0]   sensor1,
    input    [7 : 0]   sensor2,
    input    [7 : 0]   sensor3,
    input    [7 : 0]   sensor4,
    input    [15: 0]   t_lim,
    input              drop_en);
	 
	 wire [15:0] t_act,out;
	 wire [7:0] in,height;
	 
	 sensors_input 		SI(height,sensor1[7:0],sensor2[7:0],sensor3[7:0],sensor4[7:0]);
	 square_root 			SR (out,height);
	 
	 assign t_act=out/2;
	 
	 display_and_drop		DD(seven_seg1[6:0],seven_seg2[6:0],seven_seg3[6:0],seven_seg4[6:0],drop_activated[0:0],t_act,t_lim[15:0],drop_en);
	 
	 

endmodule
