use <MCAD/gears.scad>

motor_width = 43;
motor_height = 43;
motor_depth = 33;

block_depth = 38;
block_width = motor_width + 30;
block_height = 30;

dovetail_radius_female = 10;
dovetail_radius_male = 9;
offset_from_center = block_depth / 2 - 14;

module screw() {
    screw_diameter = 4;
    rotate([90, 0, 0]) { cylinder(50, d=screw_diameter, center=true); }
}

// base
module base() {
    difference() {
        
        // Base
        translate([0, offset_from_center, 0]) {
            cube([block_width, block_depth, block_height], center=true);
        }
        
        // Dovetail 1
        translate([block_width / 2 - 3,0,0]) {
            cylinder(block_height + 2, 
                    r=dovetail_radius_female, $fn=3,
                    center=true);
        }
        
        // Dovetail 2
        translate([-block_width / 2 + 3, 0, 0]) {
            rotate([0, 180, 0]) {
                cylinder(block_height + 2, 
                r=dovetail_radius_female, $fn=3,
                center=true);
            }
        }
        
        // Motor section
        translate([0, offset_from_center - (block_depth - motor_depth) / 2, 0]) {
            cube([motor_width, motor_depth, motor_height], center=true);
        }
    }
    
    // Plate section
    translate([0, 
        offset_from_center + block_depth / 2 - 
        (block_depth - motor_depth) / 2]) {
         
        cube([motor_width, block_depth - motor_depth, motor_height], 
            center=true);
    }
    
}

module full_piece() {
    difference() {
        base();

        large_hole_diameter = 23;
        rotate([90, 0, 0]) {
            cylinder(100, d=large_hole_diameter, center=true);
        }
       

        screw_offset = 6;

        // Upper left
        translate([motor_width / 2 - screw_offset, 0, 
                   motor_height / 2 - screw_offset]) {
            screw();
        }

        // Upper right
        translate([-motor_width / 2 + screw_offset, 0, 
                   motor_height / 2 - screw_offset]) {
            screw();
        }

        // Lower right
        translate([-motor_width / 2 + screw_offset, 0, 
                   -motor_height / 2 + screw_offset]) {
            screw();
        }

        // Lower left
        translate([motor_width / 2 - screw_offset, 0, 
                   -motor_height / 2 + screw_offset]) {
            screw();
        }
    }
}

full_piece();
