use <mcad/gears.scad>

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
        linear_extrude(max_height / 3, center=true) {
            gear(lg_teeth, circular_pitch);
        }

        translate([0, 0, max_height / 3 + 1 ]) {
            rotate([0, 0, 0]) {
                linear_extrude(max_height / 3 * 2, center=true) {
                    gear(sm_teeth, circular_pitch=circular_pitch);
                }
            }
        }
    }

    // hole
    cylinder(max_height + 100, d=hole_diameter, center=true);
}