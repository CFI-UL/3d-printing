use <MCAD/gears.scad>

block_depth = 35;
block_width = 20;
block_height = 30;
dovetail_radius_male = 9;
plate_depth = 160;
plate_width = 130;
plate_height = 5;

module dovetail() {
    
    cylinder(block_height, r=dovetail_radius_male, $fn=3,
    center=true);
    
    difference() {
        translate([block_width / 2 + 3, 3.5, 0]) {
            cube([block_width, block_depth, 
               block_height], center=true);
        }
    }
}

module plate(width, depth, height) {
    
    difference() {
        hole_padding = 20;
        cube([width, depth, height], center=true);
        
        
        for (j = [0:5]) {
            for (i = [0:3]) {
                translate([block_width - (plate_width/2) + j * hole_padding, 
                            i * hole_padding, 0]) {
                    cylinder(h=100, d=10, center=true);
                }
            }
            
            for (i = [0:3]) {
                translate([block_width - (plate_width/2) + j * hole_padding, 
                            -i * hole_padding, 0]) {
                    cylinder(h=100, d=10, center=true);
                }
            }
        }
    }
}

rotate([90, 0, 0]) { dovetail(); }
translate([0, plate_depth - block_depth + 6, 0]) {
    rotate([90, 0, 0]) { dovetail(); }
}

translate([plate_width / 2 + 3, plate_depth / 2 - block_depth / 2 + 3, - block_height  / 2]) {
    plate(plate_width, plate_depth, plate_height);
}