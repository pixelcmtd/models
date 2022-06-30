/// A pipe to pass your filament through.

difference() {
    union() {
        cube([25, 80, 5]);
        translate([25, 60, 0])
            cube([25, 20, 5]);
        translate([37.5, 70, -25])
            cylinder(h=30, r=5);
    }
    translate([37.5, 70, -25])
        cylinder(h=30, r=4);
    translate([5, 5, 0])
        cylinder(h=5, r=2.5);
    translate([20, 5, 0])
        cylinder(h=5, r=2.5);
}
