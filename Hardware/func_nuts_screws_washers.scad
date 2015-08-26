// Nuts_screws.scad
// Released under Attribution 3.0 Unported (CC BY 3.0) 
// http://creativecommons.org/licenses/by/3.0/
// Stephanie Shaltes
include <../inc/functions.scad>;

include <conf_screws.scad>
include <conf_nuts.scad>
include <conf_washers.scad>

// Allowances for tolerance
// Horizontal settings
screw_hole_allowance_horizontal = 0.2;
screw_head_allowance_horizontal = 0.6;
screw_head_allowance_tight_horizontal = 0.2;

rod_hole_allowance_horizontal = 0.2;

nut_hole_allowance_horizontal = 0.2;
nut_thickness_allowance_horizontal = 0.2;

washer_hole_allowance_horizontal = 0.5;
washer_hole_allowance_tight_horizontal = 0.2;
washer_thickness_allowance_horizontal = 0.05;

// Vertical settings
screw_hole_allowance_vertical = 0.2;
screw_head_allowance_vertical = 0.6;
screw_head_allowance_tight_vertical = 0.2;

rod_hole_allowance_vertical = 0.2;

nut_hole_allowance_vertical = 0.2;
nut_thickness_allowance_vertical = 0.2;

washer_hole_allowance_vertical = 0.5;
washer_hole_allowance_tight_vertical = 0.2;
washer_thickness_allowance_vertical = 0.05;

//************* screw hole tolerance function *************
function v_screw_hole(type, hole_allowance=-1, head_allowance=-1, $fn, horizontal=false) = 
	[((hole_fit(screw_dia(type),$fn))+ ((hole_allowance==-1) ? ((horizontal) ? screw_hole_allowance_horizontal : screw_hole_allowance_vertical) : hole_allowance)),
	(hole_fit(screw_head_bottom_dia(type), $fn))+ ((head_allowance==-1) ? ((horizontal) ? screw_head_allowance_horizontal : screw_head_allowance_vertical) : head_allowance),
	(hole_fit(screw_head_top_dia(type), $fn))+ ((head_allowance==-1) ? ((horizontal) ? screw_head_allowance_horizontal : screw_head_allowance_vertical) : head_allowance),
	screw_head_height(type),
	screw_name(type)];

//************* nut hole tolerance function *************
function v_nut_hole(type, hole_allowance=-1, thickness_allowance=-1, horizontal=false) = 
	[nut_dia(type),
	nut_flat(type)+ ((hole_allowance==-1) ? ((horizontal) ? nut_hole_allowance_horizontal : nut_hole_allowance_vertical) : hole_allowance),
	nut_thickness(type)+ ((thickness_allowance==-1) ? ((horizontal) ? nut_thickness_allowance_horizontal : nut_thickness_allowance_vertical) : thickness_allowance),
	nut_name(type)];

//************* washer hole tolerance function *************
function v_washer_hole(type, hole_allowance=-1, thickness_allowance=-1, $fn, horizontal=false) =
	[washer_dia(type),
	(hole_fit(washer_outer_dia(type), $fn)) + ((hole_allowance==-1) ? ((horizontal) ? washer_hole_allowance_horizontal : washer_hole_allowance_vertical) : hole_allowance),
	washer_thickness(type) + ((thickness_allowance==-1) ? ((horizontal) ? washer_thickness_allowance_horizontal : washer_thickness_allowance_vertical) : thickness_allowance) ,
	washer_name(type)];

//************* rod hole tolerance function *************
function v_rod_hole(d=0, allowance=-1, $fn=0, horizontal=false) =
	hole_fit(d, (($fn>0) ? $fn : poly_sides(d))) + ((allowance==-1) ? ((horizontal) ? rod_hole_allowance_horizontal : rod_hole_allowance_vertical) : allowance);

// modules
module screw_assy(h=20, head_drop=0, screw_assy_type=screw_assy_M3_socket_head, use_washer=-1, poly=false, $fn=0){
    //makes screw with head

    screw_type=screw_assy_screw(screw_assy_type);
    washer_type=screw_assy_washer(screw_assy_type);

    washer_height=((use_washer==-1) ? 0 : washer_thickness(washer_type));
    
    head_bottom_dia= screw_head_bottom_dia(screw_type);
    head_top_dia= screw_head_top_dia(screw_type);

    head_height= screw_head_height(screw_type);
    
    union() {
        translate([0, 0, head_drop - washer_height]) {
        // create the screw body/threads
            translate([0, 0, -0.01]) {
            
                if (poly) {
                    cylinder_poly(h=h+0.01, r=screw_dia(screw_type)/2, $fn=$fn);
                } else {
                    cylinder(h=h+0.01, r=screw_dia(screw_type)/2, $fn=$fn);
                }
                // create the screw head and washer
                translate([0, 0, -head_height+screw_head_offset(screw_type)]) {
                    if (use_washer!=-1) translate([0, 0, head_height]) washer(type=washer_type, $fn=$fn);
                    translate([0, 0, -0.01])
                        cylinder(h=head_height+0.02, d2=head_bottom_dia, d1=head_top_dia, $fn=$fn);
                }
            }
        }
    }
}

function tolerance_adjust(angle, vertical_tolerance, horizontal_tolerance) = ((abs(calc_z_angle(angle))*horizontal_tolerance)+(1-abs(calc_z_angle(angle)))*vertical_tolerance);

// length is used to create a slotted hole
// head_drop drops the head that number of units, allowing inset screw holes.
// use the rotate here, it will auto-calculate if support is required
module screw_assy_hole(h=20, length=0, head_drop=0, rotate=[0, 0, 0], screw_assy_type=screw_assy_M3_socket_head, use_washer=-1, allowance=-1){
    //makes screw with head
    hole_support=(calc_z_angle(rotate) < 90);

    echo(tolerance_adjust(rotate, screw_hole_allowance_vertical, screw_hole_allowance_horizontal));
    
    screw_type=screw_assy_screw(screw_assy_type);
    washer_type=screw_assy_washer(screw_assy_type);
 
    head_allowance=((allowance==-1) ?
                       ( (screw_head_bottom_dia(screw_type) < screw_head_top_dia(screw_type)) ?
                           (tolerance_adjust(rotate, screw_head_allowance_tight_vertical, screw_head_allowance_tight_horizontal))
                           :
                           (tolerance_adjust(rotate, screw_head_allowance_vertical, screw_head_allowance_horizontal))) 
                       :
                       allowance);
   
    hole_allowance=((allowance==-1) ? (tolerance_adjust(rotate, screw_hole_allowance_vertical, screw_hole_allowance_horizontal)) : allowance);
    

    screw=v_screw_hole(screw_type, hole_allowance = hole_allowance, head_allowance = head_allowance, $fn=$fn, horizontal=horizontal);
    
    head_bottom_dia= ((use_washer==-1) ? screw_head_bottom_dia(screw) : ((washer_outer_dia(washer_type)>screw_head_bottom_dia(screw)) ? washer_outer_dia(v_washer_hole(washer_type, $fn=$fn)) : screw_head_bottom_dia(screw)));
    head_top_dia= ((use_washer==-1) ? screw_head_top_dia(screw) :((washer_outer_dia(washer_type)>screw_head_top_dia(screw)) ? washer_outer_dia(v_washer_hole(washer_type, $fn=$fn)) : screw_head_top_dia(screw)));
    
    // get the head height
    // if it's countersunk, this function will return the head height, otherwise returns 0
    head_height = screw_head_offset(screw);
    
    rotate(rotate)
    translate([0, 0, -0.01])
    difference() {
        union() {
            // the screw threads/body
            translate([0, 0, head_drop]) {
                cylinder_slot(h=h+0.02, r=screw_dia(screw)/2, length=length, $fn=$fn);
                // add in the head if it's a countersunk screw
                if (head_height>0)
                    cylinder_slot(h=head_height, r2=head_bottom_dia/2, r1=head_top_dia/2, length=length, $fn=$fn);
    
            }
            // if there is a head drop, add it
            cylinder_slot(h=head_drop+0.01, r=head_top_dia/2, length=length, $fn=$fn);
        }
        // hole support for the head if the screw is upside down (allows bridging)
        render(convexity = 6)
        translate([0, 0, head_drop+head_height])
        if (hole_support) {
            cylinder_slot(h=layer_height+0.02, r=head_top_dia/2, length=length, $fn=$fn);
        }
    }
}

/*
// length is used to create a slotted hole
module screw_hole(h=20, length=0, head_drop=0, type=screw_M3_socket_head, washer_type=0, hole_support=false, allowance=-1, horizontal=false){
    //makes screw with head
    screw=v_screw_hole(type, hole_allowance = allowance, head_allowance = ((screw_head_bottom_dia(type) < screw_head_top_dia(type)) ? ((horizontal) ? screw_head_allowance_tight_horizontal : screw_head_allowance_tight_vertical) : ((horizontal) ? screw_head_allowance_horizontal : screw_head_allowance_vertical)), $fn=$fn, horizontal=horizontal);
    
    head_bottom_dia= (washer_outer_dia(washer_type)>screw_head_bottom_dia(screw)) ? washer_outer_dia(v_washer_hole(washer_type, $fn=$fn)) : screw_head_bottom_dia(screw);
    head_top_dia= (washer_outer_dia(washer_type)>screw_head_top_dia(screw)) ? washer_outer_dia(v_washer_hole(washer_type, $fn=$fn)) : screw_head_top_dia(screw);
	
	head_height = ((screw_head_bottom_dia(screw) < screw_head_top_dia(screw)) ? screw_head_height(screw) : head_drop);
	head_drop1= ((screw_head_bottom_dia(screw) < screw_head_top_dia(screw)) ? screw_head_height(screw)+head_drop : head_drop);
	
    translate([0, 0, head_drop1]) {
	     difference() {
	     	union() {
				translate([0, 0, -0.01]) {
					cylinder_slot(h=h+0.02, r=screw_dia(screw)/2, length=length, $fn=$fn);
               }
		 	   render(convexity = 6)
		 	   if (head_height>0) {
				    translate([0, 0, -head_height-0.01]) {						
						cylinder_slot(h=head_height+0.02, r2=head_bottom_dia/2, r1=head_top_dia/2, length=length, $fn=$fn);
					}
					translate([0, 0, -head_drop1]) {
						cylinder_slot(h=head_drop1-head_height, r=head_top_dia/2, length=length, $fn=$fn);
					}
				}
			}
			render(convexity = 6)
			if (hole_support) translate([0, 0, -0.01]) {
				cylinder_slot(h=layer_height+0.02, r=head_top_dia/2, length=length, $fn=$fn);
			}
		}
	}
}
*/

module rod_hole(d=0, h=0, allowance=-1, length=0, $fn=0, center=false, horizontal=false){
	//makes a rod hole
	dia = v_rod_hole(d=d, allowance=allowance, $fn=$fn, horizontal=horizontal);
	cylinder_slot(h=h, r=dia/2, length=length, $fn=$fn, center=center);
}

module nut(type=nut_M3, h=0){
	//makes a nut
	cylinder(h=((h>0) ? h : nut_thickness(type)), r=nut_outer_dia(type)/2, $fn=6);
}

module nut_hole(type=nut_M3, thickness=0, nut_slot=0, horizontal=false, allowance=-1){
	//makes a nut hole
	nut_h=v_nut_hole(type, horizontal=horizontal, hole_allowance = allowance);
	nut_thickness=((thickness>0) ? (thickness+0.01) : (nut_thickness(nut_h)+0.01));
	start=((nut_slot>0) ? 2 : 1);
	stop=((nut_slot>0) ? 4 : 6);
	// fix manifold
	//translate ([0,0,-0.001])
	render() union() {
		hull() {
	 		cylinder(h=nut_thickness, r=nut_outer_dia(nut_h)/2, $fn=6);
			if (nut_slot>0) translate([0, -(nut_flat(nut_h))/2, 0]) cube([nut_slot+0.01, (nut_flat(nut_h)), nut_thickness]);
	    }
		if (!horizontal) for(i = [start:stop])
			rotate([0,0,60*i]) translate([nut_outer_dia(nut_h)/2-0.45,0,0]) rotate([0,0,-45]) cylinder(r=0.75, h=nut_thickness, $fn=8);
	}
}

module washer(type=washer_M3, $fn=0){
	//makes a washer
	color([150/255, 150/255, 150/255, 0.7]) rotate([0,0, 180/(($fn>0) ? $fn : poly_sides(washer_outer_dia(type)))])
	render(convexity = 4) cylinder_poly(h=washer_thickness(type), r=washer_outer_dia(type)/2, $fn=$fn);
}

module washer_hole(type=washer_M3, $fn=0, horizontal=false){
	//makes a washer hole
	washer_h=v_washer_hole(type=type, $fn=$fn, horizontal=horizontal);
	cylinder_poly(h=washer_thickness(washer_h)+0.01, r=washer_outer_dia(washer_h)/2, $fn=$fn);
}

// Use this for screw clamps
// Length will be l + outer_radius_add*2
module screw_trap(l=20, screw=screw_M3_socket_head, nut=nut_M3, add_inner_support=0.5, outer_radius_add=2, $fn=8, horizontal=false){
	inner_r = (
		(screw_head_top_dia(v_screw_hole(screw,$fn=$fn, horizontal=horizontal)) > nut_outer_dia(v_nut_hole(nut, horizontal=horizontal)))
		? screw_head_top_dia(v_screw_hole(screw,$fn=$fn, horizontal=horizontal)) : nut_outer_dia(v_nut_hole(nut, horizontal=horizontal))
		)/2 + add_inner_support;
	intersection() {
		rotate([0,0,180/$fn])
		union() {
			translate([0, 0, l/2])
				cylinder(r2=inner_r, r1=inner_r + outer_radius_add, h=outer_radius_add, $fn=$fn);
			
			translate([0, 0, -l/2-outer_radius_add])
				cylinder(r1=inner_r, r2=inner_r + outer_radius_add, h=outer_radius_add, $fn=$fn);
			
			translate([0, 0, 0])
				cylinder(r=inner_r + outer_radius_add, h=l+0.002, $fn=$fn, center=true);
		}
		
		translate([(inner_r)+outer_radius_add/2-sagitta_radius( inner_r-outer_radius_add/2,
			(inner_r + outer_radius_add)), 0, 0])
			cylinder_poly(r=
			sagitta_radius( inner_r-outer_radius_add/2,
			(inner_r + outer_radius_add)),
			h=l+outer_radius_add*2+1,
			center=true);
			
	}
}

module screw_nut_negative(l=20, screw=screw_M3_socket_head, nut=nut_M3, nut_slot=0, nut_drop=0, nut_thickness=0, head_drop=0, washer_type, $fn=0, center=false, horizontal=false){
	translate([0,0,((center) ? -(l)/2 : 0)]) {
		// nut trap
		translate([0,0,l-nut_drop])
			nut_hole(type=nut_M3, nut_slot=nut_slot, horizontal=horizontal, thickness=nut_thickness);
	
		// screw head hole
		screw_hole(type=screw, h=l-head_drop+0.001, head_drop=head_drop, washer_type=washer_type, $fn=$fn, horizontal=horizontal);
	}
}