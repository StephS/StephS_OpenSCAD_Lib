
// extrusion parameters
// width=0
// slot_width=1
// slot_inner_width=2
// thin_wall=3
// center_square=4
// hole_dia=5

//************* extrusion access functions *************
function extrusion_width(type)  = type[0];
function extrusion_slot_width(type)  = type[1];
function extrusion_slot_inner_width(type)  = type[2];
function extrusion_thin_wall(type) = type[3];
function extrusion_center_square(type) = type[4];
function extrusion_hole_dia(type) = type[5];
function extrusion_corner_square_width(type) = (extrusion_width(type)-extrusion_slot_inner_width(type))/2;
function extrusion_wall_width(type)=(extrusion_width(type)-extrusion_slot_width(type))/2;

// 10 series 8020 (inch)
conf_ex_8020_10s = [25.4, 6.477, 14.859, 2.21, 9.02, 5.2];

// 15 series 8020 (inch)
conf_ex_8020_15s = [38.1, 8.128, 20.574, 2.21, 13.487, 6.655];

// 20 series 8020
conf_ex_8020_20s = [20, 5.26, 11.99, 1.5, 7.31, 4.19];

// 25 series 8020
conf_ex_8020_25s = [25, 6.5, 14.86, 2.14, 8.1, 5];

// 30 series 8020
conf_ex_8020_30s = [30, 8.13, 16.5, 2.55, 11.67, 6.5];

// Misumi 2020
conf_ex_misumi_2020 = [20, 6, 12, 2, 8, 4.2];