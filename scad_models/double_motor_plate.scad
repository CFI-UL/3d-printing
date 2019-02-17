padding = 15;
single_plate_size = 42;
offset = single_plate_size + padding;
difference() {
    cube([42,4,42 + offset]);
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
    
    translate([5,30,5+offset])
        rotate([90,0,0]) cylinder(h=100,r=2.5,center = false, $fn= 100);
    translate([5,30,37+offset])
        rotate([90,0,0]) cylinder(h=100,r=2.5,center = false, $fn= 100);
    translate([37,30,5+offset])
        rotate([90,0,0]) cylinder(h=100,r=2.5,center = false, $fn= 100);
    translate([37,30,37+offset])
        rotate([90,0,0]) cylinder(h=100,r=2.5,center = false, $fn= 100);
    translate([21,10,21+offset])
        rotate([90,0,0]) cylinder(h=100,r=12,center = false, $fn= 100); //12.5?
}

difference() {
    translate([0,0,-10]) cube([10,2,10]);    
    translate([5,30,-5]) rotate([90,0,0]) cylinder(h=50,r=2,center = false, $fn= 100);
}

difference() {
    translate([32, 0, -10]) cube([10,2,10]);
    translate([37,30,-5]) rotate([90,0,0]) cylinder(h=50,r=2,center = false, $fn= 100);
}

difference() {
    translate([16,0,42 + offset]) cube([10,2 ,10]);
    translate([21,10,47 + offset]) rotate([90,0,0]) cylinder(h=50,r=2,center = false, $fn= 100);
}
