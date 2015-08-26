// Stored assemblies for standard bearing idlers

include <assy_idler.scad>
include <conf_pulleys.scad>
include <conf_motors.scad>
include <conf_belts.scad>

//accessor functions
function drivetrain_assy_motor(type) = type[0];
function drivetrain_assy_belt(type) = type[1];
function drivetrain_assy_pulley(type) = type[2];
function drivetrain_assy_idler_assy(type) = type[3];
function drivetrain_assy_name(type) = type[4];

//bearing_608_double_washer
//                                         [             motor,              belt,                 pulley,                     idler_assy, name]
drivetrain_assy_nema17_gt2_3mm_17t_608dw_pbg = [ conf_motor_nema17, conf_belt_GT2_3mm, conf_pulley_17_GT2_3mm, idler_assy_608_double_washer_pb_guide, "Nema17 Motor with 17 Tooth pulley, GT2-3mm belt, and 608 bearing with double M8 washers and PrintrBot belt guides."];