// conf_nuts_screws.scad
// Released under Attribution 3.0 Unported (CC BY 3.0) 
// http://creativecommons.org/licenses/by/3.0/
// Stephanie Shaltes
// This holds all of the dimensions for the pulleys
// also holds all of the access functions

// Select your belt type ******************************************************

function pulley_height(type) = type[0];
function pulley_bore_dia(type) = type[1];
function pulley_hub_height(type) = type[2];
function pulley_belt_height(type) = type[3];
function pulley_setscrew_height(type) = type[4];
function pulley_setscrew_diameter(type) = type[5];
function pulley_diameter(type) = type[6];
function pulley_hub_diameter(type) = type[7];
function pulley_flange_diameter(type) = type[8];
function pulley_belt_center(type) = type[9];
function pulley_name(type) = type[10];

// belt center is where the middle of the belt sits.
// belt height is the hight of the belt mating area, where the teeth are.
// For some reason SDP-SI doesn't give us the height dimensions of the flange. So it has to be calculated.
// height=0;
// bore_dia=1
// hub_height=2;
// belt_height=3;
// setscrew_height=4;
// setscrew_diameter=5;
// diameter=6;
// hub_diameter=7;
// flange_diameter=8;
// belt_center=9; (pulley_height-pulley_hub_height)/2+pulley_hub_height;
// name=10

// [     0,          1,           2,               3,                 4,        5,            6,               7,           8,    9]
// [height, hub_height, belt_height, setscrew_height, setscrew_diameter, diameter, hub_diameter, flange_diameter, belt_center, name]

conf_pulley_17_GT2_3mm = [ 20.6, 5, 6.3, 11.1, 3.5, 3, 15.4, 17.5, 22, (20.6-6.3)/2+6.3, "GT2-3mm 17 groove pulley"];
conf_pulley_36_GT2 =     [ 17.5, 5, 6.3,    8, 3.5, 3, 22.4, 17.5, 28, (17.5-6.3)/2+6.3, "GT2 36 groove pulley"];
conf_pulley_40_GT2 =     [ 17.5, 5, 6.3,    8, 3.5, 3,   25, 17.5, 30, (17.5-6.3)/2+6.3, "GT2 40 groove pulley"];