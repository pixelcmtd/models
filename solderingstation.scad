/// A way of mounting a soldering iron,
/// assuming you have a metal bracket to hold it.
use <CMSL.scad>;
$fn = 100;

union() {
  translate([45, 0, 0])
    difference() {
      CMRoundCube([5, 200, 20], r=2);
      for(y = [25:50:175])
        translate([0, y, 15])
          rotate([0, 90, 0])
          CMCountersunk(l=5, ds=4);
    }
  difference() {
    translate([0, 0, -5])
      CMRoundCube([50, 200, 10], r=2);
    for(x = [10, 33])
      translate([x, 33, 5])
        CMInsertM3();
  }
}
