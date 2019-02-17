// "front" refers to the side facing inside the room
// "back" refers to the side facing outside the room
// "top" refers to the top of the door

// door
door_depth  = 45;

// top
top_height  = 5;

// front
front_depth = 5;

// back  
back_depth  = 10;
    
// module
module_depth   = door_depth + front_depth + back_depth;
module_height   = 30;
module_width    = 30;

// hole
hole_diameter   = 10;
hole_depth      = front_depth + 10;

module hole() {
    rotate([90, 0, 0]) {
        cylinder(hole_depth, d=hole_diameter, center);
    }
}

module top_piece() {
    cube([top_height, module_depth, module_width], 
                  center=true);
}

module front_piece() {
    difference() {
        cube([module_height - top_height, 
                    front_depth, 
                    module_width],
                    center=true);
        translate([0, hole_depth / 2, 0]) { hole(); }
    }
}
    
module back_piece() {
    cube([module_height - top_height, back_depth,
                   module_width],
                   center=true);
}

union() {
    top_piece();
    
    translate([module_height / 2, 
               module_depth / 2 - front_depth / 2, 0]) {
        front_piece(); 
    }
    
    translate([module_height / 2, 
               - module_depth / 2 + back_depth / 2, 0]) {
        back_piece();
    }
}