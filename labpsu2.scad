/// very rough prototype of a case for my second lab psu
use <CMSL.scad>;
$fn = 100;

// board: 66 x 48 x 21
// holes: 60 x 42 x 4

module Deltron551Cutout() {
  circle(d=8.2);
  hull() {
    circle(d=2.4);
    translate([0, 4.5])
      circle(d=2.4);
  }
}

w = 2;
r = 1;

union() {
  difference() {
    union() {
      translate([-5, 0, 0])
        CMRoundBox([85+w*2, 50+w*2, 30+w], wall=w, r=r, 3d=false, fronttext=[]);
      for(x = [4, 64])
        for(y = [4, 46])
          translate([w+x, w+y, 0])
            cylinder(5, d=8);
    }
    for(x = [4, 64])
      for(y = [4, 46])
        translate([w+x, w+y, 5])
          CMInsertM3S();
    translate([w+4, -r, 5])
      CMRoundCube([60, w+r*2, 30+r], r=r, 3d=true);
    translate([-5-r, w+24, 5])
      CMRoundCube([2*w+85+r*2, 16, 30+r], r=r, 3d=true);
  }
  translate([0, 50+w*3, 0])
    difference() {
      CMFrame([[w+4, 5], [w+4, w*2+45], [w+4, w+46], [w+70, w+46], [w+74, w+46], [w+70, w+5], [w+74, w+5], [0, 5], [0, 45+w*2], [78+w, 45+w*2], [78+w, w+5]], r=r, h=w, w=10, 3d=false);
      for(x = [4, 64])
        for(y = [4, 46])
          translate([w+x, w+y, 0]) {
            translate([0, 0, w/2])
              cylinder(w/2, d=8);
            cylinder(w, d=4);
          }
      for(y = [(50-19.05)/2, (50+19.05)/2])
        translate([w+74, w+y])
          linear_extrude(w)
          Deltron551Cutout();
    }
}
