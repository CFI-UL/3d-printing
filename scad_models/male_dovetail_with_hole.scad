use <MCAD/gears.scad>

block_depth = 35;
block_width = 20;
block_height = 30;
dovetail_radius_female = 10;
dovetail_radius_male = 9;

cylinder(block_height, r=dovetail_radius_male, $fn=3,
center=true);

translate([block_width / 2 + 3, 3.5, 0]) {
    difference() {
        cube([block_width, block_depth, 
           block_height], center=true);
        
        hole_diameter = 7;
        cylinder(block_height + 1, d=hole_diameter, center=true);
    }
}