`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:18:43 11/13/2021 
// Design Name: 
// Module Name:    display_and_drop 
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
//////////////////////////////////////////////////////////////////////////////////
module display_and_drop(
    output   reg [6 : 0]   seven_seg1, 
    output  reg  [6 : 0]   seven_seg2,
    output   reg [6 : 0]   seven_seg3,
    output   reg [6 : 0]   seven_seg4,
    output   reg [0 : 0]   drop_activated,
    input    [15: 0]   t_act,
    input    [15: 0]   t_lim,
    input              drop_en);
	 
	 reg [8:1] seg1,seg2,seg3,seg4;
	 always @(*) begin
						if ((t_act < t_lim) && (drop_en ==0 ) ) begin
																				drop_activated=0;	
																				seg1="C";
																				seg2="O";
																				seg3="L";
																				seg4="D";
																			 end 
						else if ((t_act < t_lim) && (drop_en ==1 ) ) begin
																						drop_activated=1;	
																						seg1="D";
																						seg2="R";
																						seg3="O";
																						seg4="P";	
																					end
						else if ((t_act > t_lim) && (drop_en ==1 ) ) begin
																						drop_activated=0;	
																						seg1="_";
																						seg2="H";
																						seg3="O";
																						seg4="T";
																					end
						else begin
								   drop_activated=0;	
									seg1="C";
									seg2="O";
									seg3="L";
									seg4="D";
								end 
						case (seg1)
							"C": seven_seg1 = 7'b0111001;
							"D": seven_seg1 = 7'b1011110;
							"_": seven_seg1 = 7'b0000000;
							
							default : seven_seg1 = 7'b0000000;
						endcase 
						
						
						
						case (seg2)
							"O": seven_seg2 = 7'b1011100;
							"R": seven_seg2 = 7'b1010000;
							"H": seven_seg2 = 7'b1110110;
							
							default : seven_seg2 = 7'b0000000;
						endcase 
						
						
						
						case (seg3)
							"L": seven_seg3 = 7'b0111000;
							"O": seven_seg3 = 7'b1011100;
							
							default : seven_seg3 = 7'b0000000;
						endcase 
						
						
						
						case (seg4)
							"D": seven_seg4 = 7'b1011110;
							"P": seven_seg4 = 7'b1110011;
							"T": seven_seg4 = 7'b1111000;
							
							default : seven_seg4 = 7'b0000000;
						endcase 


						
					 end
endmodule
