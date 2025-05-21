/// a kind of oven/furnace that can be built very easily and
/// is only designed for temps up to about 100C (depending on material choice)

use <CMSL.scad>;
$fn = 10;

width = 140;
height = 80;
wall = 5;
boxtext = [
  // TODO: figure out how to calculate this
  "BadOven 140×140×80×5 v0.2",
  "Copyright 2023 chrissx Media",
  "All rights reserved.",
  "",
  "$ cat README",
  "Welcome to the chrissx Media BadOven™!",
  "Please install your heating wires",
  "and power supply facilities before use.",
];

union() {
  difference() {
    CMRoundBox([width+wall*4, width+wall*4, wall*5], r=wall/2, wall=wall*2, fronttext=[]);
    translate([width/2+wall*2, width/2+wall*2, 0])
      cylinder(wall*2, d=2);

    for(s = [[wall*5, 4], [wall, 8]]) {
      for(x = [wall, width+wall*3])
        for(y = [wall, width+wall*3])
          translate([x, y, 0])
            cylinder(s.x, d=s.y);
      translate([width/2+wall*2, wall, 0])
        cylinder(s.x, d=s.y);
      translate([wall, width/2+wall*2, 0])
        cylinder(s.x, d=s.y);
      translate([width/2+wall*2, width+wall*3, 0])
        cylinder(s.x, d=s.y);
      translate([width+wall*3, width/2+wall*2, 0])
        cylinder(s.x, d=s.y);
    }
  }

  translate([width+wall*6, 0, 0]) {
    difference() {
      CMRoundBox([width+wall*4, width+wall*4, height-wall], wall=[wall*2, wall*2, wall],
          r=wall/2, fronttext=boxtext, font="Liberation Mono", textsize=4.5);

      translate([wall, wall*2, wall])
        CMRoundCube([wall*2, wall*2, height-2*wall], r=wall/2, 3d=false);
      translate([-wall, wall*2, height-wall*2])
        CMRoundCube([wall*4, wall*2, 2*wall], r=wall/2);

      translate([wall, wall, height-wall])
        CMInsertM3();
      translate([width+wall*3, wall, height-wall])
        CMInsertM3();
      translate([wall, width+wall*3, height-wall])
        CMInsertM3();
      translate([width+wall*3, width+wall*3, height-wall])
        CMInsertM3();
      translate([width/2+wall*2, wall, height-wall])
        CMInsertM3();
      translate([wall, width/2+wall*2, height-wall])
        CMInsertM3();
      translate([width/2+wall*2, width+wall*3, height-wall])
        CMInsertM3();
      translate([width+wall*3, width/2+wall*2, height-wall])
        CMInsertM3();
    }
  }
}
