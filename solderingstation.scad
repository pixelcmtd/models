/// A way of mounting soldering irons,
/// assuming you have metal brackets.
use <CMSL.scad>;
$fn = 50;

n = 1;

union() {
  translate([50 * n, 0, 0])
    difference() {
      CMRoundCube([5, 220, 20], r=2.5);
      for(y = [10:50:160])
        translate([0, y, 15])
          rotate([0, 90, 0])
          CMCountersunk(l=5, ds=4);
    }
  difference() {
    translate([0, 0, -5])
      CMRoundCube([5+50*n, 220, 10], r=2.5);
    translate([2.5, 106, -3])
      CMRoundCube([50*n-5, 45, 10], r=2.5);
    for(x = [50/2-23/2:23:50*(n-1)+50/2+23/2])
      translate([x, 65, 5])
        CMInsertM3();
  }
}
