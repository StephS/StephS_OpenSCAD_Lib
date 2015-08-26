// conf_nuts_screws.scad
// Released under Attribution 3.0 Unported (CC BY 3.0) 
// http://creativecommons.org/licenses/by/3.0/
// Stephanie Shaltes
// This holds all of the dimensions for the nuts, screws, and washers
// also holds all of the access functions

include <inch_metric.scad>

// Nut unit conversion function	
function Inch_nut_to_Metric(type) = 
	[nut_dia(type) * 24.5,
	nut_flat(type) * 24.5,
	nut_thickness(type) * 24.5,
	nut_name(type)];

//************* nut access functions *************
function nut_dia(type)  = type[0];
function nut_flat(type)  = type[1];
function nut_outer_dia(type)  = (nut_flat(type)/cos(30));
function nut_thickness(type)  = type[2];
function nut_name(type)  = type[3];

//************* Generic Metric nuts *************
// inner diameter = 0
// flat size = 1
// thickness = 2
// name = 3
nut_M2p5 = [ METRIC_M2p5,   5,   2, "(Generic) Metric M2.5 Nut"];
nut_M3 =   [   METRIC_M3, 5.5, 2.4, "(Generic) Metric M3 Nut"];
nut_M4 =   [   METRIC_M4,   7, 3.2, "(Generic) Metric M4 Nut"];
nut_M5 =   [   METRIC_M5,   8,   4, "(Generic) Metric M5 Nut"];
nut_M6 =   [   METRIC_M6,  10,   5, "(Generic) Metric M6 Nut"];
nut_M8 =   [   METRIC_M8,  13, 6.5, "(Generic) Metric M8 Nut"];
nut_M10 =  [  METRIC_M10,  16,   8, "(Generic) Metric M10 Nut"];

// Jam nuts, also known as half height nuts
nut_jam_M2p5 = [ METRIC_M2p5,   5, 1.6, "(Generic) Metric M2.5 Jam (half height) Nut"];
nut_jam_M3 =   [   METRIC_M3, 5.5, 1.8, "(Generic) Metric M3 Jam (half height) Nut"];
nut_jam_M4 =   [   METRIC_M4,   7, 2.2, "(Generic) Metric M4 Jam (half height) Nut"];
nut_jam_M5 =   [   METRIC_M5,   8, 2.7, "(Generic) Metric M5 Jam (half height) Nut"];
nut_jam_M6 =   [   METRIC_M6,  10, 3.2, "(Generic) Metric M6 Jam (half height) Nut"];
nut_jam_M8 =   [   METRIC_M8,  13,   4, "(Generic) Metric M8 Jam (half height) Nut"];
nut_jam_M10 =  [  METRIC_M10,  16,   5, "(Generic) Metric M10 Jam (half height) Nut"];

//************* Generic(inch) nuts *************
// inner diameter = 0
// flat size = 1
// thickness = 2
// name = 3
nut_inch_2 =        Inch_nut_to_Metric([  INCH_n2,  3/16,  1/16, "(Generic) (inch) #2 Nut"]);
nut_inch_3 =        Inch_nut_to_Metric([  INCH_n3,  3/16,  1/16, "(Generic) (inch) #3 Nut"]);
nut_inch_4 =        Inch_nut_to_Metric([  INCH_n4,   1/4,  3/32, "(Generic) (inch) #4 Nut"]);
nut_inch_5 =        Inch_nut_to_Metric([  INCH_n5,  5/16,  7/64, "(Generic) (inch) #5 Nut"]);
nut_inch_6 =        Inch_nut_to_Metric([  INCH_n6,  5/16,  7/64, "(Generic) (inch) #6 Nut"]);
nut_inch_8 =        Inch_nut_to_Metric([  INCH_n8, 11/32,   1/8, "(Generic) (inch) #8 Nut"]);
nut_inch_10 =       Inch_nut_to_Metric([ INCH_n10,   3/8,   1/8, "(Generic) (inch) #10 Nut"]);
nut_inch_1_4 =      Inch_nut_to_Metric([ INCH_1_4,  7/16,  7/32, "(Generic) (inch) 1/4 Nut"]);
nut_inch_5_16 =     Inch_nut_to_Metric([INCH_5_16,   1/2, 17/64, "(Generic) (inch) 5/16 Nut"]);
nut_inch_3_8 =      Inch_nut_to_Metric([ INCH_3_8,  9/16, 21/64, "(Generic) (inch) 3/8 Nut"]);
nut_inch_1_2 =      Inch_nut_to_Metric([ INCH_1_2,   3/4,  7/16, "(Generic) (inch) 1/2 Nut"]);

// Jam nuts, also known as half height nuts
nut_jam_inch_1_4 =  Inch_nut_to_Metric([ INCH_1_4, 7/16, 5/32, "(Generic) (inch) 1/4 Jam (half height) Nut"]);
nut_jam_inch_5_16 = Inch_nut_to_Metric([INCH_5_16,  1/2, 3/16, "(Generic) (inch) 5/16 Jam (half height) Nut"]);
nut_jam_inch_3_8 =  Inch_nut_to_Metric([ INCH_3_8, 9/16, 7/32, "(Generic) (inch) 3/8 Jam (half height) Nut"]);
nut_jam_inch_1_2 =  Inch_nut_to_Metric([ INCH_1_2,  3/4, 5/16, "(Generic) (inch) 1/2 Jam (half height) Nut"]);