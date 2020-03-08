`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Team Honey Badger
// Engineer: Sean Kennedy
//
// Create Date:    18:03:03 03/09/2015
// Design Name:
// Module Name:    LVDS_Output
// Project Name:   LVDS_Implementation_v2
// Target Devices: Atyls - Spartan6
// Tool versions:  ISE Project Navigator
// Description:
//				LVDS_Ouput module will take RGB888 input from a frame buffer and output
//	to a LVDS LCD.
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments: changes for ULX3S and 480x272 screen by Goran Mahovlić
//
//////////////////////////////////////////////////////////////////////////////////
module LVDS_Output(
			input clk_in,
			input [7:0] red,
			input [7:0] blue,
			input [7:0] green,
			input  hsync,
			input  vsync,
			input  dataenable,
		//	output reg [10:0] vcurrent,
		//	output reg [10:0] hcurrent,
			output [1:0] CK1in_p,
			output [1:0] Rxin0_p,
			output [1:0] Rxin1_p,
			output [1:0] Rxin2_p
);

wire clk_bit; //fast clock

assign clk_bit = clk_in;

// Bit Slot
// This will determine what bit column is being sent in one pixel frame
reg [2:0] bitSlot;

reg hsync_local, vsync_local, dataenable_local;

// Display parameters from datasheet
// https://www.tme.eu/Document/77bfd348db23fc9e00241720d8313e21/RFE43BH-AIW-DNS.pdf 
parameter htotal = 535;
parameter hfront = 8;		//Horizontal Front Porch
parameter hactive = 481;	//Horizontal active region
reg [10:0] hcurrent = 0; //bit width is calculated 2^htotal

parameter vtotal = 296;
parameter vfront = 8;		//Vertical Front Porch
parameter vactive = 273;	//Vertical active region
reg [10:0] vcurrent = 0;		//bit width is calculated 2^vtotal

//the signals hold data to be sent to the lcd on each slot
reg [6:0] Rx0_data;
reg [6:0] Rx1_data;
reg [6:0] Rx2_data;
parameter [6:0] CK1_data = 7'b1100011;

//internal LVDS signal inputs
reg CK1in;
reg Rxin0;
reg Rxin1;
reg Rxin2;

assign CK1in_p = CK1in;
assign Rxin0_p = Rxin0;
assign Rxin1_p = Rxin1;
assign Rxin2_p = Rxin2;

//Initial Values
initial
	begin
		//This is for the initial breadboard needs to change later
		hsync_local = 1'b0;
		vsync_local = 1'b0;
		dataenable_local = 1'b0;
		bitSlot = 3'b000;

		Rx0_data = 7'b0000000;
		Rx1_data = 7'b0000000;
		Rx2_data	= 7'b0000000;

	end

always @ (*)
	begin

			//data enable: should be high when the data is valid for display

			//dataenable_local <= vsync_local & hsync_local;

			//Rx2_data {Blue2, Blue3, Blue4, Blue5, hsync, vsync, dataenable}
			Rx2_data <= { blue[4], blue[5], blue[6], blue[7], hsync_local, vsync_local, dataenable_local};

			//Rx1_data {Green1, Green2, Green3, Green4, Green5, Blue0, Blue1}
			Rx1_data <= { green[3], green[4], green[5], green[6], green[7], blue[2], blue[3]};

			//Rx0_data { Red0, Red1, Red2, Red3, Red4, Red5, Green0}
			Rx0_data <= { red[2], red[3], red[4], red[5], red[6], red[7], green[2]};

			Rxin2 <= Rx2_data[bitSlot];
			Rxin1 <= Rx1_data[bitSlot];
			Rxin0 <= Rx0_data[bitSlot];
			CK1in <= CK1_data[bitSlot];
			hsync_local <= hsync;
			vsync_local <= vsync;
			dataenable_local  <= dataenable;
	end

always @ (posedge clk_bit)
	begin
	/*
				if( hcurrent < hfront || (hcurrent >= (hfront + hactive)))
				begin
					hsync_local <= 1'b0;
				end
				else
				begin
					hsync_local <= 1'b1;
				end
				if( vcurrent < vfront || (vcurrent >= (vfront + vactive)))
				begin
					vsync_local <= 1'b0;
				end
				else
				begin
					vsync_local <= 1'b1;
				end
*/
				if (bitSlot == 6)
				begin
					//The last slot, wrap around
					bitSlot <= 0;
					//If this is the last pixel in the line, wrap around
					if (hcurrent == hactive)
					begin
						hcurrent <= 0;
						if( vcurrent == vactive)
						begin
							vcurrent <=0;
						end
						else
						begin
							vcurrent <= vcurrent + 1;
						end
					end
					else
					begin
						hcurrent <= hcurrent + 1;
					end
				end
				else
				begin
					bitSlot <= bitSlot + 1;
				end

	end
endmodule
