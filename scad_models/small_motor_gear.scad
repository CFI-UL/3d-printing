use <mcad/involute_gears.scad>

hole_diameter = 6;
full_length = 100;
max_height = 12;

size_ratio = 0.45;
circular_pitch = 300;

// small gear
sm_diameter = full_length * size_ratio;
sm_teeth = sm_diameter / (circular_pitch / 180);

echo("lg_teeth", lg_teeth);
echo("sm_teeth", sm_teeth);
echo("ratio", lg_teeth / sm_teeth);

union() {

    gear(sm_teeth, circular_pitch=circular_pitch, bore_diameter=hole_diameter, rim_thickness=8, hub_thickness=5, $fn=100);
    translate([0, 4.5, 2.5]) {
        cube([5, 5, 5], center=true);
    }
}