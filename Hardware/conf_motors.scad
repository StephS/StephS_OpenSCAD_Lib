// conf_motors.scad
// Released under Attribution 3.0 Unported (CC BY 3.0) 
// http://creativecommons.org/licenses/by/3.0/
// Stephanie Shaltes
// This holds all of the dimensions for the motors
// also holds all of the access functions

include <assy_screw.scad>

// motor accessor functions
function motor_size(type) = type[0];
function motor_flange_diameter(type) = type[1];
function motor_flange_height(type) = type[2];
function motor_shaft_diameter(type) = type[3];
function motor_shaft_height(type) = type[4];
function motor_holes(type) = type[5];
function motor_screw_assy(type) = type[6];
function motor_name(type) = type[7];

// each config is in form[size, flange_diameter, flange_height, shaft_diameter, shaft_height, [[hole1], [hole2], [hole3], [hole4]], screw, "name"] where:
//     width is the motor width [0]
//     height is the motor height [1]
//     flange_diameter is the motor flange diameter (shaft output) [2]
//     flange_height is the motor flange height (shaft output) [3]
//     shaft_diameter is the motor shaft diameter [4]
//     shaft_height is the motor shaft height [5]
//     [[hole1], [hole2], [hole3], [hole4]] is the location of the holes relative to the center of motor shaft [6]
//     screw is screw for the mounting holes [7]
//     name is human readable name [8]

//                  [ [ x,  y,  z], flange_diameter, flange_height, shaft_diameter, shaft_height,      [[hole1],       [hole2],       [hole3],        [hole4]],           screw_assy,                    "name"]
conf_motor_nema17 = [ [42, 42, 42],              22,             2,              5,           14, [[15.5, 15.5], [-15.5, 15.5], [15.5, -15.5], [-15.5, -15.5]], screw_assy_M3_socket_head, "Nema 17 motor 42mm high"];
