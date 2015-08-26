
include <conf_extrusions.scad>

module extrusion(type=conf_ex_8020_10s, length=10, center=true) {
	difference() {
		color("silver") render(convexity = 8) union(){
			for (i=[0:3]) {
	           	rotate([0, 0, 90*i]) translate([extrusion_width(type)/2-extrusion_thin_wall(type)/2, extrusion_width(type)/2-extrusion_wall_width(type)/2, 0]) cube([extrusion_thin_wall(type),extrusion_wall_width(type),length], center = center);
				rotate([0, 0, 90*i]) translate([extrusion_width(type)/2-extrusion_wall_width(type)/2, extrusion_width(type)/2-extrusion_thin_wall(type)/2, 0]) cube([extrusion_wall_width(type),extrusion_thin_wall(type),length], center = center);
				rotate([0, 0, 90*i]) translate([extrusion_width(type)/2-extrusion_corner_square_width(type)/2, extrusion_width(type)/2-extrusion_corner_square_width(type)/2, 0]) cube([extrusion_corner_square_width(type),extrusion_corner_square_width(type),length], center = center);
			}
				rotate([0, 0, 45]) cube([extrusion_thin_wall(type),(extrusion_width(type)-(sin(45)*extrusion_thin_wall(type)))/cos(45),length], center = center);
				rotate([0, 0, -45]) cube([extrusion_thin_wall(type),(extrusion_width(type)-(sin(45)*extrusion_thin_wall(type)))/cos(45),length], center = center);
				cube([extrusion_center_square(type),extrusion_center_square(type),length], center = center);
			}
			cylinder(h=length+1,r=extrusion_hole_dia(type)/2,center=center);
		}
}

extrusion(type=conf_ex_8020_10s, length=extrusion_width(conf_ex_8020_10s)*3);