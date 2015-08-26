// conf_motors.scad
// Released under Attribution 3.0 Unported (CC BY 3.0) 
// http://creativecommons.org/licenses/by/3.0/
// Stephanie Shaltes
// This holds all of the functions for the motors

include <../inc/functions.scad>;
include <conf_motors.scad>;

X_AXIS = 0;
Y_AXIS = 1;
Z_AXIS = 2;

// define the padding required around the outside of the motor to provide enough room to fit inside a box
// recommended 1mm
conf_motor_padding = 1;
// define the padding required around the outside of the motor flange (additional to the diameter) to provide enough room to fit inside a box
conf_motor_flange_padding = 1;

// get the motor size + padding
function conf_motor_size_padded(type) = [motor_size(type)[X_AXIS] + conf_motor_padding, motor_size(type)[Y_AXIS] + conf_motor_padding, motor_size(type)[Z_AXIS]];


// this module creates the holes for the motor screws
module motor_screw_holes(hole_places=[1,1,1,1], motor = conf_motor_nema17, h=10, shadow=false, head_drop=5, slot_angles=[0, 0, 0, 0], slot_length=0, slot_offset=0, hole_support=false){
  for (i=[0:3]) {
    if (hole_places[i] == 1) {
      translate([motor_holes(motor)[i][X_AXIS], motor_holes(motor)[i][Y_AXIS], 0])
        rotate([0, 0, slot_angles[i]])
          translate([slot_offset, 0, 0])
            screw_hole(screw_type=motor_screw_assy(motor), head_drop=head_drop, length=slot_length, h=h, hole_support=hole_support);
    }
  }
  if (shadow != false) {
    %translate ([0, 0, h+motor_size(motor)[Z_AXIS]]) mirror([0,0,1]) motor_body();
    %for (i=[0:3]) {
	  if (hole_places[i] == 1) {
	    translate([motor_holes(motor)[i][X_AXIS], motor_holes(motor)[i][Y_AXIS], 0])
	      rotate([0, 0, slot_angles[i]])
            screw(type=motor_screw_assy(motor), head_drop=head_drop, length=slot_length, h=h, $fn=24);
	  }
    }
  }
}

// model of the motor
module motor_body(motor = conf_motor_nema17) {
	union() {
		// main body
        translate ([0, 0, motor_size(motor)[Z_AXIS]/2]) cube(motor_size(motor), center = true);
	    //flange
        translate ([0, 0, motor_size(motor)[Z_AXIS]+motor_flange_height(motor)/2]) cylinder(d = motor_flange_diameter(motor), h = motor_flange_height(motor), center = true, $fn=20);
	    //shaft
        translate ([0, 0, motor_size(motor)[Z_AXIS]+motor_shaft_height(motor)/2]) cylinder(d = motor_shaft_diameter(motor),h = motor_shaft_height(motor), center = true, $fn=10);
	}
}

// a plate with screw holes to mount the motor to
module motor_plate(motor = conf_m_nema17, size=[42, 42, 10], offset=[0,0], hole_places=[1,1,1,1], slot_angles=[0, 0, 0, 0], slot_length = 0, slot_offset=0, vertical_fillet=[0,0,0,0], head_drop=5, hole_support=false, shadow=false, $fn=0){
// Motor holding part
  difference(){
    translate([offset[X_AXIS], offset[Y_AXIS], size[Z_AXIS]/2]) cube_fillet([size[X_AXIS], size[Y_AXIS], size[Z_AXIS]], vertical=vertical_fillet, center = true);
    // motor screw holes
    motor_screw_holes(hole_places=hole_places, motor = motor, h=size[Z_AXIS], shadow=shadow, head_drop=head_drop, slot_angles=slot_angles, slot_length=slot_length, slot_offset=slot_offset, hole_support=hole_support);
                
    // see if all of the slot angles are the same
    if (slot_angles[0]==slot_angles[1] && slot_angles[0]==slot_angles[2] && slot_angles[0]==slot_angles[3]) {
      // slots are all in the same direction, so slot the center hole too
      translate ([0, 0, size[Z_AXIS]/2]) cylinder_slot(r=hole_fit(motor_flange_diameter(motor)+conf_motor_flange_padding,$fn)/2,h=size[Z_AXIS]+1, length=slot_length, center = true);
    } else {
      translate ([0, 0, size[Z_AXIS]/2]) cylinder_poly(r=hole_fit(motor_flange_diameter(motor)+conf_motor_flange_padding,$fn)/2,h=size[Z_AXIS]+1, center = true);
    }
  }
}


// Creates a motor plate from a pre-defined array (makes for cleaner code?)
// settings is defined as: settings = [offset, hole_places, slot_angles, slot_length, slot_offset, vertical_fillet]
conf_plate_default_settings = [[0,0], [1,1,1,1], [-135, -45, 135, 45], 2, -1, [0,0,0,0]];

module motor_plate_array(motor = conf_m_nema17, size = [42, 42, 5], head_drop=1, hole_support=false, shadow = true, settings = [[0,0], [1,1,1,1], [-135, -45, 135, 45], 2, -1, [0,0,0,0]]) {
  motor_plate(motor = motor, size=size, offset= settings[0], hole_places=settings[1], slot_angles=settings[2], slot_length = settings[3], slot_offset= settings[4], vertical_fillet=settings[5], head_drop=head_drop, hole_support=hole_support, shadow=shadow);
}

//motor_screw_holes(places=[1,1,1,1], motor = conf_m_nema17, h=10, shadow=false, head_drop=5, slot_angles=[-135, -45, 135, 45], slot_length=5, slot_offset=-2.5, hole_support=true, $fn=24);
//mirror([0,0,1]) motor_plate(motor = conf_m_nema17, size=[42+5, 42+5, 5], offset=[0,0], hole_places=[1,1,1,1], slot_angles=[-135, -45, 135, 45], slot_length = 2, slot_offset=-1, vertical_fillet=[0,0,0,0], head_drop=1, hole_support=false, shadow=true);
//motor_screw_holes(hole_places=[1,1,1,1], motor = conf_m_nema17, h=10, shadow=false, head_drop=5, slot_angles=[0, 0, 0, 0], slot_length=0, slot_offset=0, hole_support=false, $fn=30);
//mirror([0,0,1]) motor_plate_array(motor = conf_m_nema17, size = [42, 42, 5], head_drop=1, hole_support=false, shadow = true, settings = conf_plate_default_settings);