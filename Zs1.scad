/// a handheld Zs1/7/8 signal
use <CMSL.scad>;
$fn = 50;

// VF1 = 2.4
// VF2 = 1.8
// V1 = 2.6
// V2 = 3.2
// R1 = 2.6 / 0.04 = 65
// R2 = 3.2 / 0.04 = 80
// R11 = 2.6 / 0.12 = 21.67
// R22 = 3.2 / 0.12 = 26.67
// P11 = 2.6 * 0.12 = 3.2
// P22 = 3.2 * 0.12 = 4.8

module CountersunkScrewsAndInserts(h) {
  for(x = [3.5, 96.5])
    for(y = [3.5, 96.5])
      translate([x, y, 0]) {
      cylinder(3, d=6);
      translate([0, 0, 2.999])
      CMCountersunk(l=8.5, ds=2.5);
      translate([0, 0, h])
      CMInsertM2(o=0);
    }
}

difference() {
  CMRoundCube([100, 100, 60], r=3, 3d=true);
  difference() {
    translate([5, 5, 7])
      CMRoundCube([90, 90, 49], r=3, 3d=false);
    for(x = [20, 80])
    translate([x, 50, 52])
      cylinder(5, d=10);
  }

  translate([10, 10, 0])
    cube([24, 16, 5]);
  translate([12, 12, 0])
    cube([20, 12, 10]);

  for(y = [41, 60, 79])
    translate([60, y, 7.5])
      CMInsertM3(l=6.5);

  for(t = [[15, 85, 20], [50, 15, 20], [85, 85, 20]])
    translate(t)
    cylinder(39.5, d=18);
  for(x = [20, 80])
    translate([x, 50, 52])
    CMInsertM4S(o=0);

  CountersunkScrewsAndInserts(7);
  translate([0, 100, 60])
    rotate([180, 0, 0])
    CountersunkScrewsAndInserts(10);

  //translate([-1, -1, -1])
  //  cube([102, 102, 8.01]);
  //translate([-1, -1, 7.001])
  //  cube([102, 102, 43]);
  //translate([-1, -1, 49.999])
  //  cube([102, 102, 11]);
}
