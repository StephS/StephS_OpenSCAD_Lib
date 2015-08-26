include <../inc/functions.scad>;
include <assy_drivetrain.scad>;

//radius of the idler assembly (to surface that touches belt, ignoring guide walls)
function idler_assy_r_inner(idler_bearing) = (idler_bearing[0] / 2) + 4 * single_wall_width * idler_bearing[3];
//radius of the idler assembly (to smooth side of belt)
function idler_assy_r_outer(idler_bearing) = (idler_bearing[0] / 2) + (idler_bearing[3] ? (5.5 * idler_bearing[3]) : belt[3]+1);

module drvtn_pulley(pulley_type=conf_pulley_17_GT2_3mm)
{
	difference() {
		union() {
			translate ([0, 0, pulley_hub_height(pulley_type)/2]) cylinder(d=pulley_hub_diameter(pulley_type),h=pulley_hub_height(pulley_type), center = true);
			translate ([0, 0, (pulley_height(pulley_type)-pulley_hub_height(pulley_type)-pulley_belt_height(pulley_type))/2/2+pulley_hub_height(pulley_type)]) cylinder(d=pulley_flange_diameter(pulley_type),h=(pulley_height(pulley_type)-pulley_hub_height(pulley_type)-pulley_belt_height(pulley_type))/2, center = true);
			translate ([0, 0, pulley_hub_height(pulley_type)+(pulley_height(pulley_type)-pulley_hub_height(pulley_type)-pulley_belt_height(pulley_type))/2+pulley_belt_height(pulley_type)/2]) cylinder(d=pulley_diameter(pulley_type),h=pulley_belt_height(pulley_type), center = true);
			translate ([0, 0, pulley_hub_height(pulley_type)+(pulley_height(pulley_type)-pulley_hub_height(pulley_type)-pulley_belt_height(pulley_type))/2+pulley_belt_height(pulley_type)+(pulley_height(pulley_type)-pulley_hub_height(pulley_type)-pulley_belt_height(pulley_type))/2/2]) cylinder(d=pulley_flange_diameter(pulley_type),h=(pulley_height(pulley_type)-pulley_hub_height(pulley_type)-pulley_belt_height(pulley_type))/2, center = true);
		}
		translate ([0, 0, pulley_height(pulley_type)/2]) cylinder(d=pulley_bore_dia(pulley_type),h=pulley_height(pulley_type)+1, center = true);
	}
}

module drvtn_idler(type=[22, 7, 8, 1], center=false) {
	difference(){
		cylinder(r=idler_bearing[0]/2,h=idler_bearing[1], center = center);
		cylinder_poly(r=idler_bearing[2]/2,h=idler_bearing[1]+1, center = center);
	}
	
}

module idler_assy(idler_bearing = [22, 7, 8, 1], idler_width=x_idler_width) {
    translate([0,0,0]) rod_hole(h=120, d=idler_bearing[2], $fn=8, center=true);
    //bearing shadow
    %idler(idler_bearing, center=true)
    // cutout around the idler
    cylinder(h = idler_width + 1, r=idler_assy_r_outer(idler_bearing), center=true);
}

// this module creates an idler suitable for mockup.
module idler(idler_type=idler_assy_608_double_washer_pb_guide, center=false) {
	idler_outer_dia = idler_assy_belt_dia(idler_type);
	bearing_width = bearing_width(idler_assy_bearing(idler_type));
	washer_outer_dia = idler_assy_washer_dia(idler_type);
	washer_width = washer_thickness(idler_assy_washer(idler_type));
	screw_dia = screw_dia(idler_assy_screw(idler_type));
	
    
	color([0.2,0.2,0.2,0.5])
	render()
	translate([ 0, 0, ((center) ? 0 : (bearing_width/2 + washer_width))])
	difference(){
		union() {
            cylinder(d=idler_outer_dia, h=bearing_width, center = true);
            translate([ 0, 0, bearing_width/2+washer_width/2]) cylinder(d=washer_outer_dia, h=washer_width, center = true);
            translate([ 0, 0, -bearing_width/2-washer_width/2]) cylinder(d=washer_outer_dia, h=washer_width, center = true);
        }
        cylinder_poly(r=screw_dia/2, h=bearing_width + washer_width*2 +1, center = true);
    }
}

// this module creates an idler hole for difference
// you should include the belt so that it is taken into account
module idler_hole(idler_type=idler_assy_608_double_washer_pb_guide, belt_type=-1, center=false) {
	// find out what is larger, the idler with the belt, or with the washer.
	idler_outer_dia = idler_assy_out_dia(idler_type, belt_type);
	// the width includes the washers
	idler_width = idler_assy_width(idler_type);
	//color([0.2,0.2,0.2,0.5])
	render()
        cylinder(d=idler_outer_dia, h=idler_width, center = center);
}

//drvtn_pulley();
/*
difference() {
idler_hole(idler_type=idler_assy_608_double_washer, belt_type=conf_belt_GT2_3mm, center=true);
idler(center=true);
}
*/