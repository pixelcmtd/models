/// A welding station consisting of four KYOCERA AVX SCCY68B407SSB capacitors
/// in series and two 0AWG with M8 end...shoe...things
///
/// This is probably the worst best way of welding.
use <CMSL.scad>;
$fn = 100;

d = 35 + 1.5;
l = 68 + 2;
r = 5;

difference() {
  union() {
    CMRoundCube([d*2+r*1.5, d*2+r*1.5, l+r], r=r, 3d=false);
    translate([0, r-50, l-r*2]) CMRoundCube([d*2+r*1.5, 50, r*3], r=r, 3d=false);
    translate([(d*2+r*1.5)/2-r/2, r-50, l]) CMRoundCube([r, 50-r, 2*r], r=r/2, 3d=true);

    // ugliest hack ever, because the CMRoundCube api still sucks
    translate([0, -r, l-r*2]) cube([r, 2*r, r*3]);
    translate([d*2+r*0.5, -r, l-r*2]) cube([r, 2*r, r*3]);
  }

  for(x = [r/2+d/2, r+3*d/2]) {
    for(y = [r/2+d/2, r+3*d/2])
      translate([x, y, r])
        cylinder(l, d=d);

    translate([x, -25, l+r]) CMInsertM8();
  }

  // TODO: a hold-down mechanism better than the old hack
  //translate([d*2, d+r*0.75, l+r]) CMInsertM3();
  //translate([d+r*0.75, d+r*0.75, l+r]) CMInsertM3();
  //translate([r*1.5, d+r*0.75, l+r]) CMInsertM3();
}

// this was an interesting idea, but 8AWG wires and solder work fine
//module strip(l) {
//linear_extrude(1)
//difference() {
//square([r, l]);
//translate([r/2, r/2]) circle(d=2);
//translate([r/2, l-r/2]) circle(d=2);
//}
//}
// this part was the hold-down mechanism bracket thing
//difference() {
//  CMRoundCube([d*2+r*1.5, 3*r, 1], 3d=false, r=r);
//  translate([d*2, 1.5*r]) cylinder(1, d=4);
//  translate([d+r*0.75, 1.5*r]) cylinder(1, d=4);
//  translate([r*1.5, 1.5*r]) cylinder(1, d=4);
//}
//
//translate([4*r, 0]) strip(60);
//translate([5.5*r, 0]) strip(45);
//translate([7*r, 0]) strip(27);
//translate([8.5*r, 0]) strip(45);
//translate([10*r, 0]) strip(60);
