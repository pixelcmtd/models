/// Nail lamp/dryer using a custom PCB that will be published at some point
use <CMSL.scad>;
$fn = 50;
size = [120, 85, 40];
wall = 5;

difference() {
  CMRoundCube([size.x + wall*2, size.y + wall, size.z + wall], r=wall, 3d=false);
  translate([wall, -wall, wall])
    CMRoundCube([size.x, size.y + wall, size.z + wall], r=wall);
  for(x = [wall*3/4, size.x + wall*5/4])
    for(y = [wall/2, size.y + wall/4])
      translate([x, y, size.z + wall])
        CMInsertM2();
}

translate([0, size.y * 1.1, 0])
  difference() {
    CMRoundCube([size.x + wall*2, size.y + wall, 15 + wall], r=wall, 3d=false);
    difference() {
      translate([wall, wall, wall])
        CMRoundCube([size.x, size.y - wall, 15 + wall], r=wall);
      for(xoff = [-5, 12])
        translate([3*size.x/4+xoff, size.y-28, 0])
          cube([5, 28+wall/2, 15 + wall]);
      translate([3*size.x/4, size.y-28, 0])
        cube([12, 5, 10 + wall]);
      translate([3*size.x/4, size.y-13, 0])
        cube([12, 13, 3.5 + wall]);
    }
    for(x = [wall*3/4, size.x + wall*5/4])
      for(y = [wall/2, size.y + wall/4])
        translate([x, y, 0]) {
          cylinder(13.5, d=8);
          cylinder(20, d=3);
        }
    translate([size.x/4, size.y+wall/4, 9 + wall/2 - 16/2])
      cube([24, 5, 16]);
    translate([size.x/4+2, size.y-wall, 9 + wall/2 - 12/2])
      cube([20, 2*wall, 12]);
    translate([3*size.x/4, size.y-2, 6 + wall])
      cube([12, 7, 10 + wall]);
    translate([3*size.x/4, size.y-22, wall-2])
      cube([12, 8, wall]);
  }

//translate([0, size.y * 1.1, 0])
//  difference() {
//    CMRoundCube([size.x + wall*2, size.y + wall, wall/2], r=wall, 3d=false);
//    for(x = [wall*3/4, size.x + wall*5/4])
//      translate([x, size.y + wall/4, 0])
//        cylinder(wall/2, d=2.5);
//    for(x = [wall+10/2:10:size.x])
//      for(y = [10/2:10:size.y-10/2])
//        translate([x, y, 0])
//          cylinder(wall/2, d=5, $fn=$fn/2);
//  }
