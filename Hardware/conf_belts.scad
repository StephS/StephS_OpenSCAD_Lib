// conf_nuts_screws.scad
// Released under Attribution 3.0 Unported (CC BY 3.0) 
// http://creativecommons.org/licenses/by/3.0/
// Stephanie Shaltes
// This holds all of the dimensions for the belts
// also holds all of the access functions

// Select your belt type ******************************************************

function belt_tooth_distance(type) = type[0];
function belt_tooth_ratio(type) = type[1];
function belt_tooth_height(type) = type[2];
function belt_height(type) = type[3];
function belt_base_height(type) = type[4];
function belt_name(type) = type[5];

// keep below for legacy checking/fixes
//tooth_distance = 0;
//tooth_ratio = 1;
//tooth_height = 2;
//height = 3;
//base_height = 4; //belt_height - tooth_height

conf_belt_T2_5 =    [   2.5,  0.5,  0.7,  1.3,   1.3-0.7, "T2.5 Belt"];
conf_belt_T5 =      [     5, 0.75,  1.2,  2.2,   2.2-1.2, "T5 Belt"];
conf_belt_HTD3 =    [     3, 0.75, 1.22, 2.41, 2.41-1.22, "HTD3 Belt"];
conf_belt_MXL =     [ 2.032, 0.64, 0.46,  1.2,  1.2-0.46, "MXL Belt"];
conf_belt_GT2 =     [     2,  0.5, 0.76, 1.52, 1.52-0.76, "GT2 Belt"];
conf_belt_GT2_3mm = [     3,  0.5, 1.14, 2.41, 2.41-1.14, "GT2-3mm belt"];
