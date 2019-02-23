use <mcad/involute_gears.scad>

hole_diameter = 12;
full_length = 100;
max_height = 12;

size_ratio = 0.25;
circular_pitch = 300;

// small gear
sm_diameter = full_length * size_ratio;
sm_teeth = sm_diameter / (circular_pitch / 180);

// large gear
lg_diameter = full_length * (1 - size_ratio);
lg_teeth = lg_diameter / (circular_pitch / 180);

echo("lg_teeth", lg_teeth);
echo("sm_teeth", sm_teeth);
echo("ratio", lg_teeth / sm_teeth);

difference() {
    union() {
        gear(number_of_teeth=lg_teeth, 
        circular_pitch=circular_pitch,
        rim_width=max_height / 3, circles=5);
        
     cylinder(max_height + 4, d1=20, d2=40);
     translate([0, 0, max_height / 3 + 10]) {
        cylinder(max_height / 3 * 2, d=hole_diameter + 2, center=true);
     }
    }
   

    // hole
    cylinder(max_height + 100, d=hole_diameter, center=true);
}