padding = 15;
single_plate_size = 42;
offset = single_plate_size + padding;
plate_width = 4;

difference() {
    cube([42,plate_width,42]);
    translate([5,30,5])
        rotate([90,0,0]) cylinder(h=100,r=2.5,center = false, $fn= 100);
    translate([5,30,37])
        rotate([90,0,0]) cylinder(h=100,r=2.5,center = false, $fn= 100);
    translate([37,30,5])
        rotate([90,0,0]) cylinder(h=100,r=2.5,center = false, $fn= 100);
    translate([37,30,37])
        rotate([90,0,0]) cylinder(h=100,r=2.5,center = false, $fn= 100);
    translate([21,10,21])
        rotate([90,0,0]) cylinder(h=100,r=12,center = false, $fn= 100); //12.5?
}

difference() {
    translate([16,0,42]) cube([10, plate_width ,10]);
    translate([21,10,47]) rotate([90,0,0]) cylinder(h=50,r=2,center = false, $fn= 100);
}

difference() {
    motor_width = 42;
    motor_height = 42;
    motor_depth = 42;
    translate([0, 0, - single_plate_size]) {
        cube([motor_width, motor_depth + plate_width, motor_height]);
        
    }

    rotate([0, 90, 0]) {
        translate([motor_width - 2, motor_width / 2, motor_width / 2 ]) {
            cylinder(50, r=10, $fn=3, center=true);
        }
    }
}
