use <MCAD/gears.scad>

block_depth = 35;
block_width = 50;
block_height = 30;
dovetail_radius_female = 10;
dovetail_radius_male = 9;
pin_height = 75;
pin_diameter = 10;
holder_diameter = pin_diameter / 2;
holder_height = pin_height + 5;
module dovetail() {
    
    cylinder(block_height, r=dovetail_radius_male, $fn=3,
    center=true);
    
    difference() {
        translate([28, 3.5, 0]) {
            cube([block_width, block_depth, 
               block_height], center=true);
        }
        translate([50,0,0]) {
            cylinder(block_height + 2, 
                    r=dovetail_radius_female, $fn=3,
                    center=true);
        }
    }
    
    translate([26, 28, 0]) {
        rotate([90, 0, 0]) {
            difference() {
                cylinder(pin_height, d=pin_diameter, $fn=100,
                        center=true);
                cylinder(holder_height, d=holder_diameter, 
                        center=true);
            }
        }
    }
}

module holder() {
    cylinder(5, d1=holder_diameter, d2=holder_diameter-1);
    cylinder(2, d=pin_diameter + 5);
    
}
    
rotate([90, 0, 0]) { dovetail(); }
translate([0, 50, -15]) { holder(); } 