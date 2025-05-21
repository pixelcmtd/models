/// A TEC-powered mini fridge
use <CMSL.scad>;
$fn = 10;

w = 100;
h = 240;

union() {
  difference() {
    CMRoundBox([w, w, h], wall=10, r=5, fronttext=[
        "CMBadFridge v0.2.2",
        "",
        "> cat README",
        "Properly install cooler!",
        "Properly install TEC!",
        "Properly install fins!",
        "Properly install fan!",
        "Firmly attach top!",
        "",
        "====================",
        " DON'T FUCK IT UP!! ",
        "====================",
    ], textsize=4, font="Liberation Mono", textdepth=3);

    translate([-5, w/4-5/2, h-2])
      CMRoundCube([20, 5, 4], r=2);

    for(x = [5, w-5])
      for(y = [5, w-5])
        translate([x, y, h])
          CMInsertM3();
    translate([5, w/2, h])
      CMInsertM3();
    translate([w-5, w/2, h])
      CMInsertM3();
    translate([w/2, 5, h])
      CMInsertM3();
    translate([w/2, w-5, h])
      CMInsertM3();
  }
  translate([w*1.1, 0, 0])
    difference() {
      CMRoundCube([w, w, 15], 3d=false, r=5);

      translate([(w-41)/2, (w-41)/2, 0])
        cube([41, 41, 15]);
      translate([(w-41-15)/2, (w+41)/2, 15-8/2])
        rotate([90, 0, 0])
        CMRoundCube([15, 8, 41], r=5, 3d=false);

      translate([(w-50)/2, w/2, 0])
        CMInsertM3(o=0);
      translate([w/2, (w-50)/2, 0])
        CMInsertM3(o=0);
      translate([(w+50)/2, w/2, 0])
        CMInsertM3(o=0);
      translate([w/2, (w+50)/2, 0])
        CMInsertM3(o=0);

      for(x = [-50, +50])
        for(y = [-50, +50])
          translate([(w+x)/2, (w+y)/2, 15])
            CMInsertM3(l=15);

      for(x = [5, w-5])
        for(y = [5, w-5])
          translate([x, y, 0])
            cylinder(15, d=4);
      translate([5, w/2, 0])
        cylinder(15, d=4);
      translate([w-5, w/2, 0])
        cylinder(15, d=4);
      translate([w/2, 5, 0])
        cylinder(15, d=4);
      translate([w/2, w-5, 0])
        cylinder(15, d=4);
    }
  translate([w*2.2, 0, 0])
    difference() {
      CMRoundCube([60, 60, 15], r=5, 3d=false);
      translate([30, 30, 0])
        cylinder(15, d=58);

      for(x = [5, 55])
        for(y = [5, 55])
          translate([x, y, 0])
            cylinder(15, d=5);
    }
}
