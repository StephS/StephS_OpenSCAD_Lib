// Tests to check the nuts_screws functions
include <..\print_config.scad>
include <assy_screw.scad>
include <func_nuts_screws_washers.scad>

screw_test_assy=screw_assy_M6_button_head;
screw_height=20;
screw_head_drop=1;
cube_width=screw_head_top_dia(screw_assy_screw(screw_test_assy)) + 4;
slice_cube=true;


screw_rotate=[0, 0, 0];

screw_assy(h=screw_height, head_drop=screw_head_drop, screw_assy_type=screw_test_assy, use_washer=-1, poly=false, $fn=0);
translate([0, 0, 30])
difference() {
    translate ([-cube_width/2, -cube_width/2, 0])
        cube([cube_width, cube_width, 30]);
    screw_assy_hole(h=screw_height, length=0, head_drop=screw_head_drop, rotate=screw_rotate, screw_assy_type=screw_test_assy, use_washer=-1, hole_support=true, allowance=-1, horizontal=false);
    if (slice_cube) translate([0, 0, -1]) cube([cube_width, cube_width, 32]);
}
