// Tests to check the nuts_screws functions
include <..\print_config.scad>
include <assy_screw.scad>
include <func_nuts_screws_washers.scad>

function add_screw_dia(list, i) = (i <=0 ? screw_head_top_dia(screw_assy_screw(list[i])) : screw_head_top_dia(screw_assy_screw(list[i])) + add_screw_dia(list, i-1));

// screw array definitions

screw_assy_inch_button_head_list = [screw_assy_inch_2_button_head,
                               screw_assy_inch_3_button_head,
                               screw_assy_inch_4_button_head,
                               screw_assy_inch_5_button_head,
                               screw_assy_inch_6_button_head,
                               screw_assy_inch_8_button_head,
                               screw_assy_inch_10_button_head,
                               screw_assy_inch_1_4_button_head,
                               screw_assy_inch_5_16_button_head,
                               screw_assy_inch_3_8_button_head,
                               screw_assy_inch_1_2_button_head];

screw_assy_inch_socket_head_list = [screw_assy_inch_2_socket_head,
                               screw_assy_inch_3_socket_head,
                               screw_assy_inch_4_socket_head,
                               screw_assy_inch_5_socket_head,
                               screw_assy_inch_6_socket_head,
                               screw_assy_inch_8_socket_head,
                               screw_assy_inch_10_socket_head,
                               screw_assy_inch_1_4_socket_head,
                               screw_assy_inch_5_16_socket_head,
                               screw_assy_inch_3_8_socket_head,
                               screw_assy_inch_1_2_socket_head];

screw_assy_inch_flat_head_list = [screw_assy_inch_2_flat_head,
                             screw_assy_inch_3_flat_head,
                             screw_assy_inch_4_flat_head,
                             screw_assy_inch_5_flat_head,
                             screw_assy_inch_6_flat_head,
                             screw_assy_inch_8_flat_head,
                             screw_assy_inch_10_flat_head,
                             screw_assy_inch_1_4_flat_head,
                             screw_assy_inch_5_16_flat_head,
                             screw_assy_inch_3_8_flat_head,
                             screw_assy_inch_1_2_flat_head];
                             
screw_assy_metric_button_head_list = [screw_assy_M3_button_head,
                                 screw_assy_M4_button_head,
                                 screw_assy_M5_button_head,
                                 screw_assy_M6_button_head,
                                 screw_assy_M8_button_head,
                                 screw_assy_M10_button_head];
                                 
screw_assy_metric_socket_head_list = [screw_M2p5_socket_head,
                                 screw_assy_M3_socket_head,
                                 screw_assy_M4_socket_head,
                                 screw_assy_M5_socket_head,
                                 screw_assy_M6_socket_head,
                                 screw_assy_M8_socket_head,
                                 screw_assy_M10_socket_head];
                                 
screw_assy_metric_flat_head_list = [screw_assy_M3_flat_head,
                               screw_assy_M4_flat_head,
                               screw_assy_M5_flat_head,
                               screw_assy_M6_flat_head,
                               screw_assy_M8_flat_head,
                               screw_assy_M10_flat_head];

//screw(h=20, head_drop=0, type=screw_inch_botton_head_list[0], washer_type=0, poly=false, $fn=0, hole=false);

module test_screws(screw_assy_list) {
  translate ( [0, -screw_head_top_dia(screw_assy_screw(screw_assy_list[0])), 0])
  for (i=[0:len(screw_assy_list)-1]) {
    translate ( [0, add_screw_dia(screw_assy_list, i) + i, 0])
      screw_assy(h=20, head_drop=0, screw_assy_type=screw_assy_list[i], use_washer=-1, poly=false, $fn=0);
  }
}

module test_screw_holes(screw_assy_list) {
  translate ( [0, -screw_head_top_dia(screw_assy_screw(screw_assy_list[0])), 0])
  for (i=[0:len(screw_assy_list)-1]) {
    translate ( [0, add_screw_dia(screw_assy_list, i) + i, 0])
      screw_assy_hole(h=30, length=0, head_drop=1, screw_assy_type=screw_assy_list[i], use_washer=-1, hole_support=true, allowance=-1, horizontal=false);
  }
}

// screw tests
test_screws(screw_assy_inch_button_head_list);
translate ( [screw_head_top_dia(screw_assy_screw(screw_assy_inch_button_head_list[len(screw_assy_inch_button_head_list)-1]))+1, 0, 0])
  test_screws(screw_assy_inch_socket_head_list);
translate ( [screw_head_top_dia(screw_assy_screw(screw_assy_inch_button_head_list[len(screw_assy_inch_button_head_list)-1])) + screw_head_top_dia(screw_assy_screw(screw_assy_inch_socket_head_list[len(screw_assy_inch_socket_head_list)-1])) + 1, 0, 0])
  test_screws(screw_assy_inch_flat_head_list);

// hole tests
translate([0, 0, 30])
difference() {
  translate ([-15, -10, 0])
    cube ([70, 160, 30]);
  render(convexity = 4)
  test_screw_holes(screw_assy_inch_button_head_list);
  render(convexity = 4)
  translate ( [screw_head_top_dia(screw_assy_screw(screw_assy_inch_button_head_list[len(screw_assy_inch_button_head_list)-1]))+1, 0, 0])
    test_screw_holes(screw_assy_inch_socket_head_list);
  render(convexity = 4)
  translate ( [screw_head_top_dia(screw_assy_screw(screw_assy_inch_button_head_list[len(screw_assy_inch_button_head_list)-1])) + screw_head_top_dia(screw_assy_screw(screw_assy_inch_socket_head_list[len(screw_assy_inch_socket_head_list)-1])) + 1, 0, 0])
    test_screw_holes(screw_assy_inch_flat_head_list);
}