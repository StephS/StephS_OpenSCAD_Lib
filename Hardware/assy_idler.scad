// Stored assemblies for standard bearing idlers
// It's no longer just a bearing, it's an idler for belts.

include <conf_bearings.scad>
include <assy_screw.scad>
include <conf_belts.scad>

// ********** <START> accessor functions **********
function idler_assy_bearing(type) = type[0];
function idler_assy_screw_assy(type) = type[1];
function idler_assy_use_fender(type) = type[2];
function idler_assy_belt_guide(type) = type[3];
function idler_assy_name(type) = type[4];
// function to get the total width (thickness) of the bearing assembly, including 1 washer per side.
function idler_assy_width(type) = bearing_width(idler_assy_bearing(type)) + washer_thickness(idler_assy_washer(type))*2;
// function to get the total diameter of the bearing assembly, including 1 washer per side.
// determine if the washer is greater than the bearing guide
function idler_assy_out_dia(idler_type, belt_type) = 
  ((idler_assy_with_belt_out_dia(idler_type, belt_type) > idler_assy_washer_dia(idler_type)) ?
    ((idler_assy_with_belt_out_dia(idler_type, belt_type) > idler_assy_belt_guide_out_dia(idler_type)) ?
      idler_assy_with_belt_out_dia(idler_type, belt_type)
    : 
      idler_assy_belt_guide_out_dia(idler_type))
  : 
    ((idler_assy_washer_dia(idler_type) > idler_assy_belt_guide_out_dia(idler_type)) ?
      idler_assy_washer_dia(idler_type) 
    : 
      idler_assy_belt_guide_out_dia(idler_type)));

// this function returns the diameter of the area the belt will ride on.
function idler_assy_belt_dia(type) = ((idler_assy_belt_guide(type) == -1) ? idler_assy_bearing_dia(type) : belt_guide_belt_dia(idler_assy_belt_guide(type)));
// this function returns the diameter of the area including belt will ride on.
function idler_assy_with_belt_out_dia(idler_type, belt_type) = (idler_assy_belt_dia(idler_type) +  belt_height(belt_type)*2);

// function to return the correct washer, depending on use_fender
function idler_assy_washer(type) = ((idler_assy_use_fender(type)==-1) ? screw_assy_washer(idler_assy_screw_assy(type)) : screw_assy_fender_washer(idler_assy_screw_assy(type)));
// ********** <END> accessor functions **********

// ********** <START> Internal functions (do not use) **********

// returns the outer diameter of the belt guide (if no belt guide, returns the diameter of the bearing)
function idler_assy_belt_guide_out_dia(type) = ((idler_assy_belt_guide(type) == -1) ? idler_assy_bearing_dia(type) : belt_guide_out_dia(idler_assy_belt_guide(type)));
// returns the diameter of the washer
function idler_assy_washer_dia(type) = washer_outer_dia(idler_assy_washer(type));
// returns the outer diameter of the bearing
function idler_assy_bearing_dia(type) = bearing_out_dia(idler_assy_bearing(type));

// function to return the screw (not screw assembly). Prefer to use the screw assembly instead
function idler_assy_screw(type) = screw_assy_screw(idler_assy_screw_assy(type));
// function to return the nut. Prefer to use the screw assembly instead
function idler_assy_nut(type) = screw_assy_nut(idler_assy_screw_assy(type));
// function to return the jam nut. Prefer to use the screw assembly instead
function idler_assy_jam_nut(type) = screw_assy_jam_nut(idler_assy_screw_assy(type));
// ********** <END> Inteernal functions **********

// ********** <START> Bearing Assemblies **********
// bearing guide is what you're using as a bearing guide.
// You'll probably never use the fender washers
// idler_assy_608_double_washer
// uses 2x washers (double washer) per side
//                                        [     bearing,                           screw_assy, use_fender,        belt_guide, name]
idler_assy_608_double_washer_pb_guide = [ bearing_608, screw_assy_M8_socket_head_dbl_washer,         -1, belt_guide_608_pb, "608 Bearing, 2x M8 Washers per side, M8 Socket Head Screw, M8 Nut, Printerbot Bearing guides"];
idler_assy_608_double_washer =          [ bearing_608, screw_assy_M8_socket_head_dbl_washer,         -1,                   -1, "608 Bearing, 2x M8 Washers per side, M8 Socket Head Screw, M8 Nut"];