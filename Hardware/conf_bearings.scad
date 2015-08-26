// Select idler bearing size **************************************************
function bearing_out_dia(type)  = type[0];
function bearing_width(type)  = type[1];
function bearing_inn_dia(type)  = type[2];
function bearing_name(type)  = type[3];

// Bearings, all of them.
// [outer_diameter, width, inner_diameter, name]
bearing_608 = [22, 7, 8, "608 Bearing"];
bearing_624 = [16, 5, 4, "624 Bearing"];
bearing_624_double = [16, 10, 4, "two 624 Bearings"];
bearing_R4RS = [15.875, 4.9784, 6.35, "1/4 inch R4RS bearing"];
bearing_626RS = [19, 6, 6, "626RS Bearing"];

// Bearing belt guides. Could be 3D printed or manufactured.
// Ignore the width as the bearings will need washers anyways.
function belt_guide_out_dia(type)  = type[0];
function belt_guide_belt_dia(type)  = type[1];
function belt_guide_width(type)  = type[2];
function belt_guide_name(type)  = type[3];

// belt diameter is the diameter of the area that the belt will rest on. Some guides fit over the bearing.
// if the bearing guide is toothed, subtract the tooth height
// [outer_diameter, belt_diameter, width, name]
belt_guide_608_pb = [ 32, 24, 11, "608 Bearing with belt guide from PrintrBot"];