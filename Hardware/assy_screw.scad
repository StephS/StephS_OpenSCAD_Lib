// Stored assemblies for standard screws

include <conf_screws.scad>
include <conf_nuts.scad>
include <conf_washers.scad>

// [ screw, washer, fender_washer, nut, jam_nut, name]

// accessor functions
function screw_assy_screw(type) = type[0];
function screw_assy_washer(type) = type[1];
function screw_assy_fender_washer(type) = type[2];
function screw_assy_nut(type) = type[3];
function screw_assy_jam_nut(type) = type[4];
function screw_assy_name(type) = type[5];

//************* Generic Metric Button Head screws *************
screw_assy_M3_button_head =  [  screw_M3_button_head,  washer_M3,  washer_fender_M3,  nut_M3,  nut_jam_M3,  "(Generic) Metric M3 Button Head Screw Assembly"];
screw_assy_M4_button_head =  [  screw_M4_button_head,  washer_M4,  washer_fender_M4,  nut_M4,  nut_jam_M4,  "(Generic) Metric M4 Button Head Screw Assembly"];
screw_assy_M5_button_head =  [  screw_M5_button_head,  washer_M5,  washer_fender_M5,  nut_M5,  nut_jam_M5,  "(Generic) Metric M5 Button Head Screw Assembly"];
screw_assy_M6_button_head =  [  screw_M6_button_head,  washer_M6,  washer_fender_M6,  nut_M6,  nut_jam_M6,  "(Generic) Metric M6 Button Head Screw Assembly"];
screw_assy_M8_button_head =  [  screw_M8_button_head,  washer_M8,  washer_fender_M8,  nut_M8,  nut_jam_M8,  "(Generic) Metric M8 Button Head Screw Assembly"];
screw_assy_M10_button_head = [ screw_M10_button_head, washer_M10, washer_fender_M10, nut_M10, nut_jam_M10, "(Generic) Metric M10 Button Head Screw Assembly"];

//************* Generic Metric Socket Head screws *************
screw_assy_M2p5_socket_head =  [ screw_M2p5_socket_head, washer_M2p5, washer_fender_M2p5, nut_M2p5, nut_jam_M2p5, "(Generic) Metric M2.5 Socket Head Screw Assembly"];
screw_assy_M3_socket_head =    [   screw_M3_socket_head,   washer_M3,   washer_fender_M3,   nut_M3,   nut_jam_M3,   "(Generic) Metric M3 Socket Head Screw Assembly"];
screw_assy_M4_socket_head =    [   screw_M4_socket_head,   washer_M4,   washer_fender_M4,   nut_M4,   nut_jam_M4,   "(Generic) Metric M4 Socket Head Screw Assembly"];
screw_assy_M5_socket_head =    [   screw_M5_socket_head,   washer_M5,   washer_fender_M5,   nut_M5,   nut_jam_M5,   "(Generic) Metric M5 Socket Head Screw Assembly"];
screw_assy_M6_socket_head =    [   screw_M6_socket_head,   washer_M6,   washer_fender_M6,   nut_M6,   nut_jam_M6,   "(Generic) Metric M6 Socket Head Screw Assembly"];
screw_assy_M8_socket_head =    [   screw_M8_socket_head,   washer_M8,   washer_fender_M8,   nut_M8,   nut_jam_M8,   "(Generic) Metric M8 Socket Head Screw Assembly"];
screw_assy_M8_socket_head_dbl_washer =    [   screw_M8_socket_head,   washer_M8_double,   washer_fender_M8,   nut_M8,   nut_jam_M8,   "(Generic) Metric M8 Socket Head Screw Assembly"];
screw_assy_M10_socket_head =   [  screw_M10_socket_head,  washer_M10,  washer_fender_M10,  nut_M10,  nut_jam_M10,  "(Generic) Metric M10 Socket Head Screw Assembly"];

//************* Generic Metric Flat Head screws *************
//                    [screw_dia, head_bottom_dia, head_top_dia, head_height, name]
screw_assy_M3_flat_head =  [  screw_M3_flat_head,  washer_M3,  washer_fender_M3,  nut_M3,  nut_jam_M3,  "(Generic) Metric M3 Flat Head Screw Assembly"];
screw_assy_M4_flat_head =  [  screw_M4_flat_head,  washer_M4,  washer_fender_M4,  nut_M4,  nut_jam_M4,  "(Generic) Metric M4 Flat Head Screw Assembly"];
screw_assy_M5_flat_head =  [  screw_M5_flat_head,  washer_M5,  washer_fender_M5,  nut_M5,  nut_jam_M5,  "(Generic) Metric M5 Flat Head Screw Assembly"];
screw_assy_M6_flat_head =  [  screw_M6_flat_head,  washer_M6,  washer_fender_M6,  nut_M6,  nut_jam_M6,  "(Generic) Metric M6 Flat Head Screw Assembly"];
screw_assy_M8_flat_head =  [  screw_M8_flat_head,  washer_M8,  washer_fender_M8,  nut_M8,  nut_jam_M8,  "(Generic) Metric M8 Flat Head Screw Assembly"];
screw_assy_M10_flat_head = [ screw_M10_flat_head, washer_M10, washer_fender_M10, nut_M10, nut_jam_M10, "(Generic) Metric M10 Flat Head Screw Assembly"];

//************* 8020inc(inch) screws *************
// http://www.3dcontentcentral.com/parts/supplier/80%2020-Inc/9/14/620.aspx
//                            [screw_dia, head_bottom_dia, head_top_dia, head_height, name]
screw_assy_8020_1_4_flange_head =  [  screw_8020_1_4_flange_head,  washer_inch_1_4, washer_fender_inch_1_4_od_1_2,  nut_inch_1_4,  nut_jam_inch_1_4,     "8020inc #3066 #3342 #3390 1/4-20 Flange Screw Assembly"];
screw_assy_8020_5_16_flange_head = [ screw_8020_5_16_flange_head, washer_inch_5_16,       washer_fender_inch_5_16, nut_inch_5_16, nut_jam_inch_5_16,          "8020inc #3330 #3340 5/16-18 Flange Screw Assembly"];
screw_assy_8020_1_4_button_head =  [  screw_8020_1_4_button_head,  washer_inch_1_4, washer_fender_inch_1_4_od_1_2,  nut_inch_1_4,  nut_jam_inch_1_4,            "8020inc #3059 1/4-20 Button Head Screw Assembly"];
screw_assy_8020_5_16_button_head = [ screw_8020_5_16_button_head, washer_inch_5_16,       washer_fender_inch_5_16, nut_inch_5_16, nut_jam_inch_5_16,           "8020inc #3104 5/16-18 Button Head Screw Assembly"];
screw_assy_8020_1_4_socket_head =  [  screw_8020_1_4_socket_head,  washer_inch_1_4, washer_fender_inch_1_4_od_1_2,  nut_inch_1_4,  nut_jam_inch_1_4,            "8020inc #3058 1/4-20 Socket Head Screw Assembly"];
screw_assy_8020_5_16_socket_head = [ screw_8020_5_16_socket_head, washer_inch_5_16,       washer_fender_inch_5_16, nut_inch_5_16, nut_jam_inch_5_16,           "8020inc #3106 5/16-18 Socket Head Screw Assembly"];
screw_assy_8020_1_4_flat_head =    [    screw_8020_1_4_flat_head,  washer_inch_1_4, washer_fender_inch_1_4_od_1_2,  nut_inch_1_4,  nut_jam_inch_1_4,  "8020inc #3400 1/4-20 CounterSunk Flat Head Screw Assembly"];
screw_assy_8020_5_16_flat_head =   [   screw_8020_5_16_flat_head, washer_inch_5_16,       washer_fender_inch_5_16, nut_inch_5_16, nut_jam_inch_5_16, "8020inc #3410 5/16-18 CounterSunk Flat Head Screw Assembly"];

//************* Generic (inch) Button Head screws *************
//                                                 [screw_dia, head_bottom_dia, head_top_dia, head_height, name]
screw_assy_inch_2_button_head =    [    screw_inch_2_button_head,    washer_inch_2,                            -1,    nut_inch_2,                -1,   "(Generic) (inch) #2 Button Head Screw Assembly"];
screw_assy_inch_3_button_head =    [    screw_inch_3_button_head,    washer_inch_3,                            -1,    nut_inch_3,                -1,   "(Generic) (inch) #3 Button Head Screw Assembly"];
screw_assy_inch_4_button_head =    [    screw_inch_4_button_head,    washer_inch_4,                            -1,    nut_inch_4,                -1,   "(Generic) (inch) #4 Button Head Screw Assembly"];
screw_assy_inch_5_button_head =    [    screw_inch_5_button_head,    washer_inch_5,                            -1,    nut_inch_5,                -1,   "(Generic) (inch) #5 Button Head Screw Assembly"];
screw_assy_inch_6_button_head =    [    screw_inch_6_button_head,    washer_inch_6,                            -1,    nut_inch_6,                -1,   "(Generic) (inch) #6 Button Head Screw Assembly"];
screw_assy_inch_8_button_head =    [    screw_inch_8_button_head,    washer_inch_8,          washer_fender_inch_8,    nut_inch_8,                -1,   "(Generic) (inch) #8 Button Head Screw Assembly"];
screw_assy_inch_10_button_head =   [   screw_inch_10_button_head,   washer_inch_10,         washer_fender_inch_10,   nut_inch_10,                -1,  "(Generic) (inch) #10 Button Head Screw Assembly"];
screw_assy_inch_1_4_button_head =  [  screw_inch_1_4_button_head,  washer_inch_1_4, washer_fender_inch_1_4_od_1_2,  nut_inch_1_4,  nut_jam_inch_1_4,  "(Generic) (inch) 1/4 Button Head Screw Assembly"];
screw_assy_inch_5_16_button_head = [ screw_inch_5_16_button_head, washer_inch_5_16,       washer_fender_inch_5_16, nut_inch_5_16, nut_jam_inch_5_16, "(Generic) (inch) 5/16 Button Head Screw Assembly"];
screw_assy_inch_3_8_button_head =  [  screw_inch_3_8_button_head,  washer_inch_3_8,        washer_fender_inch_3_8,  nut_inch_3_8,  nut_jam_inch_3_8,  "(Generic) (inch) 3/8 Button Head Screw Assembly"];
screw_assy_inch_1_2_button_head =  [  screw_inch_1_2_button_head,  washer_inch_1_2,        washer_fender_inch_1_2,  nut_inch_1_2,  nut_jam_inch_1_2,  "(Generic) (inch) 1/2 Button Head Screw Assembly"];

//************* Generic (inch) Socket Head screws *************
//                                                 [screw_dia, head_bottom_dia, head_top_dia, head_height, name]
screw_assy_inch_2_socket_head =    [    screw_inch_2_socket_head,    washer_inch_2,                            -1,    nut_inch_2,                -1,   "(Generic) (inch) #2 Socket Head Screw Assembly"];
screw_assy_inch_3_socket_head =    [    screw_inch_3_socket_head,    washer_inch_3,                            -1,    nut_inch_3,                -1,   "(Generic) (inch) #3 Socket Head Screw Assembly"];
screw_assy_inch_4_socket_head =    [    screw_inch_4_socket_head,    washer_inch_4,                            -1,    nut_inch_4,                -1,   "(Generic) (inch) #4 Socket Head Screw Assembly"];
screw_assy_inch_5_socket_head =    [    screw_inch_5_socket_head,    washer_inch_5,                            -1,    nut_inch_5,                -1,   "(Generic) (inch) #5 Socket Head Screw Assembly"];
screw_assy_inch_6_socket_head =    [    screw_inch_6_socket_head,    washer_inch_6,                            -1,    nut_inch_6,                -1,   "(Generic) (inch) #6 Socket Head Screw Assembly"];
screw_assy_inch_8_socket_head =    [    screw_inch_8_socket_head,    washer_inch_8,          washer_fender_inch_8,    nut_inch_8,                -1,   "(Generic) (inch) #8 Socket Head Screw Assembly"];
screw_assy_inch_10_socket_head =   [   screw_inch_10_socket_head,   washer_inch_10,         washer_fender_inch_10,   nut_inch_10,                -1,  "(Generic) (inch) #10 Socket Head Screw Assembly"];
screw_assy_inch_1_4_socket_head =  [  screw_inch_1_4_socket_head,  washer_inch_1_4, washer_fender_inch_1_4_od_1_2,  nut_inch_1_4,  nut_jam_inch_1_4,  "(Generic) (inch) 1/4 Socket Head Screw Assembly"];
screw_assy_inch_5_16_socket_head = [ screw_inch_5_16_socket_head, washer_inch_5_16,       washer_fender_inch_5_16, nut_inch_5_16, nut_jam_inch_5_16, "(Generic) (inch) 5/16 Socket Head Screw Assembly"];
screw_assy_inch_3_8_socket_head =  [  screw_inch_3_8_socket_head,  washer_inch_3_8,        washer_fender_inch_3_8,  nut_inch_3_8,  nut_jam_inch_3_8,  "(Generic) (inch) 3/8 Socket Head Screw Assembly"];
screw_assy_inch_1_2_socket_head =  [  screw_inch_1_2_socket_head,  washer_inch_1_2,        washer_fender_inch_1_2,  nut_inch_1_2,  nut_jam_inch_1_2,  "(Generic) (inch) 1/2 Socket Head Screw Assembly"];

//************* Generic (inch) Flat Head (countersunk) Screws *************
//                                               [screw_dia, head_bottom_dia, head_top_dia, head_height, name]
screw_assy_inch_2_flat_head =    [    screw_inch_2_flat_head,    washer_inch_2,                            -1,    nut_inch_2,                -1,   "(Generic) (inch) #2 Flat Head Screw Assembly"];
screw_assy_inch_3_flat_head =    [    screw_inch_3_flat_head,    washer_inch_3,                            -1,    nut_inch_3,                -1,   "(Generic) (inch) #3 Flat Head Screw Assembly"];
screw_assy_inch_4_flat_head =    [    screw_inch_4_flat_head,    washer_inch_4,                            -1,    nut_inch_4,                -1,   "(Generic) (inch) #4 Flat Head Screw Assembly"];
screw_assy_inch_5_flat_head =    [    screw_inch_5_flat_head,    washer_inch_5,                            -1,    nut_inch_5,                -1,   "(Generic) (inch) #5 Flat Head Screw Assembly"];
screw_assy_inch_6_flat_head =    [    screw_inch_6_flat_head,    washer_inch_6,                            -1,    nut_inch_6,                -1,   "(Generic) (inch) #6 Flat Head Screw Assembly"];
screw_assy_inch_8_flat_head =    [    screw_inch_8_flat_head,    washer_inch_8,          washer_fender_inch_8,    nut_inch_8,                -1,   "(Generic) (inch) #8 Flat Head Screw Assembly"];
screw_assy_inch_10_flat_head =   [   screw_inch_10_flat_head,   washer_inch_10,         washer_fender_inch_10,   nut_inch_10,                -1,  "(Generic) (inch) #10 Flat Head Screw Assembly"];
screw_assy_inch_1_4_flat_head =  [  screw_inch_1_4_flat_head,  washer_inch_1_4, washer_fender_inch_1_4_od_1_2,  nut_inch_1_4,  nut_jam_inch_1_4,  "(Generic) (inch) 1/4 Flat Head Screw Assembly"];
screw_assy_inch_5_16_flat_head = [ screw_inch_5_16_flat_head, washer_inch_5_16,       washer_fender_inch_5_16, nut_inch_5_16, nut_jam_inch_5_16, "(Generic) (inch) 5/16 Flat Head Screw Assembly"];
screw_assy_inch_3_8_flat_head =  [  screw_inch_3_8_flat_head,  washer_inch_3_8,        washer_fender_inch_3_8,  nut_inch_3_8,  nut_jam_inch_3_8,  "(Generic) (inch) 3/8 Flat Head Screw Assembly"];
screw_assy_inch_1_2_flat_head =  [  screw_inch_1_2_flat_head,  washer_inch_1_2,        washer_fender_inch_1_2,  nut_inch_1_2,  nut_jam_inch_1_2,  "(Generic) (inch) 1/2 Flat Head Screw Assembly"];