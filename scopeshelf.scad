use <CMSL.scad>;
$fn = 100;

module layer(h, 3d=false) {
  for(x = [0, w+r*2])
    translate([x, 0, 0])
      CMRoundCube([r*2, d, h+r], r=r, 3d=false);
  translate([0, 0, h])
    CMRoundCube([w+r*4, d, r*2], r=r, 3d=3d);
}

module Deltron551Cutout() {
  circle(d=8.2);
  hull() {
    circle(d=2.4);
    translate([0, 4.5])
      circle(d=2.4);
  }
}

w = 333;
d = 200;
r = 3;

difference() {
  union() {
    CMRoundCube([w+r*4, d, r*2], r=r, 3d=false);
    translate([0, 0, r*2]) {
      layer(19);
      translate([w+r*3-20, 0, 0])
        CMRoundCube([20+r, r*2, 19], r=r, 3d=false);
    }
    translate([0, 0, r*4+19]) {
      // https://www.owontechnology.eu/product/1329058/owon-ag1052f-50mhz-2-ch-arbitrary-waveform-generator
      layer(110);
      translate([w-235, 0, 0])
        CMRoundCube([r*2, d, 110], r=r/2, 3d=false);
    }
    translate([0, 0, r*6+19+110]) {
      // https://www.owontechnology.eu/product/4703647/owon-xdm1041-55-000-counts-bench-type-digital-multimeter
      layer(88);
      // https://ae01.alicdn.com/kf/S4761e737865c4b8a87bc26967031d9b9C.jpg
      translate([r/2, 0, 0])
        CMRoundCube([130+r/2, r+2.5, 88], r=r/2, 3d=false);
      // TODO: meter blocker
    }
    translate([0, d-r*2, r*8+19+110+88-69])
      CMRoundCube([w+r*4, r*2, 69], r=r, 3d=true);
    translate([0, 0, r*8+19+110+88]) {
      // ThinkPad X220, ca. 300x200x240
      layer(240, 3d=true);
      // usb hub ca 187x45x20x177x25x4 (manually measured)
      translate([r*2+w/2-45/2, d-r*2, 0])
        CMRoundCube([45, r*2, 240+r], r=r, 3d=false);
    }
  }
  for(x = [r, w+r*3])
    for(y = [r, d-r])
      translate([x, y, 0])
        CMInsertM2(r*8+19+110+88+5.7, o=0);
  translate([w+r*2.5-20/2, r*2, r*2+19/2])
    rotate([90, 0, 0])
    linear_extrude(r*2)
    Deltron551Cutout();
  // https://ae01.alicdn.com/kf/S4761e737865c4b8a87bc26967031d9b9C.jpg (inner is 120x50, front 2.5)
  // TODO: enlarge both quite a bit
  translate([r*2, 0, r*6+19+110+88/2-55/2])
    cube([125, 2.5, 55]);
  translate([r*2+4/2, 2.5, r*6+19+110+88/2-55/2+4/2])
    cube([125-4, r, 55-4]);
  for(x = [-25/2, +25/2])
    for(z = [-177/2, +177/2])
      translate([r*2+w/2+x, d, r*8+19+110+88+240/2+z])
        rotate([90, 0, 0])
        CMInsertM4S(o=0);
  for(x = [-320/2, +320/2])
    translate([r*2+w/2+x, d, r*8+19+110+88-69/2])
      rotate([90, 0, 0])
      CMInsertM3S(o=0);
  // TODO: put to the side
  for(x = [(w-235)/2-23/2:23:(w-235)/2+23/2])
    translate([x, 65, r*4+19])
      CMInsertM3();
}
