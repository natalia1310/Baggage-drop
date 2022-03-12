`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:18:01 11/13/2021 
// Design Name: 
// Module Name:    square_root 
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
module square_root (
		 output [15:0] out,
		 input  [7:0] in );					 
						 
		/*	reg [7:0] n,d,p,a,o;
			always @(in) begin
								n=1;
								while ((n*n)<in) begin
														n=n+1;
														end
								 d=(~((n*n)-in))+8'b1;
								 p=d/2*n;
								 a=n+p;
								 o=a-p*p/2*a;
							 end
			assign out=o;	*/
			
		 reg 		[15:0] d;
		 reg 		[15:0] q;
		 reg 		[17:0] stanga,dreapta,r;    
		 integer i;
		always @(in) begin
								//initializam variabile
							 d = in;
							 q = 0; //radacina numarului
							 i = 0;
							 stanga = 0;   
							 dreapta = 0;  
							 r = 0;  //restul pentru patrate imperfecte 
							 for(i=0;i<16;i=i+1) begin 
														  dreapta = {q,r[17],1'b1};
														  stanga = {r[15:0],d[15:14]};
														  d = {d[13:0],2'b00};  //shiftam la stanga cu 2 cifre  
														  if (r[17] == 1) // facem adunarea daca r este negativ
																	r = stanga + dreapta; 
														  else    			// facem scaderea daca r este pozitiv
																	r = stanga - dreapta;
														  q = {q[14:0],!r[17]};       
														end
							end
		 assign out = q;   


endmodule
