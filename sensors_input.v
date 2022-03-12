`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:16:48 11/13/2021 
// Design Name: 
// Module Name:    sensors_input 
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
module sensors_input(
	output   [7 : 0]   height,
   input    [7 : 0]   sensor1,
   input    [7 : 0]   sensor2,
   input    [7 : 0]   sensor3,
   input    [7 : 0]   sensor4);
	
	reg [7:0]  h;
	reg [7:0] f;
	always @(*) begin
						if ((sensor1 == 8'd0 ) || (sensor3 == 8'd0))  begin
																						if (sensor2[0]==sensor4[0]) 
																							h=(sensor2 + sensor4)/2;
																						else h=((sensor2 + sensor4)+1)/2;
																					 end							
						else if ((sensor2 == 8'd0 ) || (sensor4 == 8'd0)) begin
																								if (sensor1[0]==sensor3[0]) 
																									h=(sensor1 + sensor3)/2;
																								else h=((sensor1 + sensor3)+1)/2;
																							end
						else begin
									f=sensor1 + sensor2 + sensor3 + sensor4;
									if ((f[0]==0) && (f[1]==0)) 
												h=(sensor1 + sensor2 + sensor3 + sensor4)/4;
									 else h=((sensor1 + sensor2 + sensor3 + sensor4)+2)/4;
							  end
						
					end
					
	assign height=h;
	
endmodule
