/// a mediocre 120mm fan grill
use <CMSL.scad>;
$fn = 100;

h = 2;

difference() {
  CMRoundCube([120, 120, h], r=5, 3d=false);
  CMFanHoles120()
    cylinder(h, d=4);
  intersection() {
    translate([120/2, 120/2, 0])
      cylinder(h, d=118);
    for(x = [0:8:120])
      translate([x, 0, 0])
        cube([7, 120, h]);
    for(y = [0:8:120])
      translate([0, y, 0])
        cube([120, 7, h]);
  }
}
