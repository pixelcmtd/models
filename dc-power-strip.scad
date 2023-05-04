/// A power strip consisting of three Neutrik powerCON TRUE1 (TOP) connectors
/// and a (currently unused) switch.
// https://www.neutrik.com/media/12866/download/st-nac3fpx-st-top.PDF?v=1
// the switch is 30.5 * 14 * 2 and 24 * 12 * 13
use <CMSL.scad>;
$fn = 100;

difference() {
  translate([-2, -20, 0])
    CMRoundCube(size=[35.4+4, 35.4*3+4*2+14, 22], r=5, 3d=false, center=false);

  for(i = [0:2]) {
    translate([0, 35.4*i, 0])
      CMRoundCube(size=[35.4, 35.4, 4.5], r=5, 3d=false, center=false);
    translate([35.4/2, i*35.4+35.4/2, 0])
      cylinder(22, d=28.7);
    for(x = [0, 24.4])
      for(y = [0, 24.4])
        translate([5.5+x, i*35.4+5.5+y, 4.5])
          CMInsertM3(o=0);
  }

  // these are eyeball values, TODO: calculate
  translate([33, -15, 0])
    rotate([0, 0, 90]) {
      translate([0, 0, 0])
        cube([14, 30.5, 2]);
      translate([(14-12)/2, (30.5-24)/2, 0])
        cube([12, 24, 22]);
      translate([(14-12)/2, 0.5/2, 5])
        cube([12, 30, 17]);
    }

  for(y = [35.4, 2*35.4])
    for(z = [7, 15])
      translate([35.4+2, y, z])
        rotate([180, 90, 0])
        CMCountersunk(l=50, ds=4, dk=8, k=5);
}
