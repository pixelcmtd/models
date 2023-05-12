/// A welding station consisting of four KYOCERA AVX SCCY68B407SSB capacitors
/// in series and two 0AWG with M8 end...shoe...things
///
/// This is probably the worst best way of welding.
use <CMSL.scad>;
$fn = 100;

d = 35 + 1.5;
l = 68 + 2;
w = 25;
r = d/3 - w/3;

difference() {
  union() {
    translate([0, r-40, 0]) CMRoundCube([d*2+r*1.5, d*2+r*1.5+40-r, l+r], r=r, 3d=false);
    translate([d/2+r/2+w/2, r-40, l]) CMRoundCube([d+r/2-w, 40-r, 3*r], r=r, 3d=true);
    translate([0, r-40, l]) CMRoundCube([r/2+d/2-w/2, 40-r, 3*r], r=r, 3d=true);
    translate([d*3/2+r+w/2, r-40, l]) CMRoundCube([r/2+d/2-w/2, 40-r, 3*r], r=r, 3d=true);
  }

  for(x = [r/2+d/2, r+3*d/2]) {
    for(y = [r/2+d/2, r+3*d/2])
      translate([x, y, r])
        cylinder(l, d=d);

    translate([x, -15, l+r]) CMInsertM8();
  }

  // TODO: a hold-down mechanism better than the old hack
  //translate([d*2, d+r*0.75, l+r]) CMInsertM3();
  //translate([d+r*0.75, d+r*0.75, l+r]) CMInsertM3();
  //translate([r*1.5, d+r*0.75, l+r]) CMInsertM3();
}
