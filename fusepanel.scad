/// A simple box for mounting DIN rail circuit breakers.
use <CMSL.scad>;
$fn = 100;

// https://imgv2-2-f.scribdassets.com/img/document/301531090/original/606068a285/1626791748?v=1

du = 2;
wall = 5;
fuse_height = 100;

union() {
  difference() {
    union() {
      cube([du * 18, 35, 1]);
      translate([0, 4, 0])
        CMRoundCube([du * 18, 27, 7.5], r=0.8);
    }
    for(x = [10, du * 18 - 10])
      translate([x, 35/2, 0])
        CMCountersunk(7.5, ds=4);
  }
  translate([0, 40, 0])
    difference() {
      CMRoundBox(size=[du * 18 + wall * 3, fuse_height + wall * 3, 52 + wall], wall=wall, r=1, 3d=false, fronttext=[]);
      for(x = [wall * 1.5 + 10, wall * 1.5 + du * 18 - 10])
        translate([x, fuse_height/2 + wall * 1.5, 0])
          cylinder(wall, d=4);
      for(x = [wall/2, du * 18 + wall * 2.5])
        for(y = [wall/2, fuse_height + wall * 2.5])
          translate([x, y, 52 + wall])
            CMInsertM2();
      translate([wall * 1.5, -wall, wall + 20])
        CMRoundCube([du * 18, fuse_height + wall * 5, 12], r=wall);
    }
  translate([du * 18 + wall * 4, 40, 0])
    difference() {
      CMRoundCube([du * 18 + wall * 3, fuse_height + wall * 3, wall], r=1, 3d=false);
      translate([wall, fuse_height/2 + wall - 45/2, 0])
        cube([du * 18 + wall, 45 + wall, 5]);
      for(x = [wall/2, du * 18 + wall * 2.5])
        for(y = [wall/2, fuse_height + wall * 2.5]) {
          translate([x, y, 0])
            cylinder(wall, d=2.5);
          translate([x, y, wall/2])
            cylinder(wall/2, d=5);
        }
    }
}
