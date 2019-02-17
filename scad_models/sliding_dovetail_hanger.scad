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

module corner_piece(side) {
    intersection() {
        cube([side, side, side], center=true);
        new_side = sqrt(pow(side, 2) + pow(side, 2));
        translate([-side / 2, 0, -side / 2]) {
            rotate([0, 45, 0]) { 
                cube([new_side, new_side, new_side], 
                    center=true); 
            }
        }
    }
}

module top_piece() {
    cube([top_height, module_depth, module_width], 
                  center=true);
}

module front_piece() {
    
    
   cube([module_height - top_height, 
            front_depth, 
            module_width],
            center=true);
    
    difference() {
        translate([-top_height / 2, module_height / 2 + front_depth / 2, 0]) {
            rotate([-90, 0, 90]) { 
                corner_piece(module_height);
            }
        }
        
        translate([module_height / 4 + 2, module_height / 4 + 4, 0]) {
            cylinder(50, r=module_height / 3, $fn=3, center=true);
        }
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