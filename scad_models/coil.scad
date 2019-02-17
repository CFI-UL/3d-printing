hole_depth      = 20;
hole_diameter   = 6;
module hole() {
    cylinder(hole_depth, d=hole_diameter, $fn=100, center=true);
}

string_hole_diameter   = 3;
string_hole_depth      = 20;

module string_hole() {
    cylinder(string_hole_depth, d=string_hole_diameter, 
    center=true);
}

ring_diameter = 30;
ring_height   = 2;
module ring() {
    cylinder(ring_height, d=ring_diameter, center=true);
}

small_section_diameter  = 15;
part_one_depth          = 6;
string_hole_y_offset    = small_section_diameter / 3;
string_hole_z_offset    = 0;
ring1_z_offset          = part_one_depth / 2 + ring_height / 2;

module part_one() {

    difference() {
        union() { 
            cylinder(part_one_depth, 
                 d=small_section_diameter, center=true);
             translate([0, 0, ring1_z_offset]) { ring(); }
        }
        hole();
        
        translate([0, string_hole_y_offset, string_hole_z_offset]) {
            rotate([0, 90, 0]) { string_hole(); }
        }
        
    }
}

module part_two() {
    difference() {
        union() { 
            cylinder(part_one_depth, 
                 d=small_section_diameter, center=true);
             translate([0, 0, ring1_z_offset]) { ring(); }
        }
        hole();
    }
}

part_one();
translate([ring_diameter + 1, 0, 0]) { part_two(); }