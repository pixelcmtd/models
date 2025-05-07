/// Case for [XL6019](https://de.aliexpress.com/item/4000197777372.html) boost
/// converter
use <CMSL.scad>;
$fn = 10;

size = [50 + 1, 28 + 1, 20];
wall = [5, 5, 5];

union() {
  difference() {
    CMRoundBox([size.x + wall.x*2, size.y + wall.y*2, size.z + wall.z], wall=wall, r=2.5, 3d=false, fronttext=[]);
    for(x = [0, size.x + wall.x*2 - 5])
      translate([x, size.y/2 + wall.y - 10/2, wall.z])
        cube([5, 10, 20]);
    for(x = [wall.x+4, wall.x+size.x-4])
      for(y = [wall.y+4, wall.y+size.y-4])
        translate([x, y, 5])
          CMInsertM3S();
  }
  translate([0, 40, 0])
    difference() {
      CMRoundCube([size.x + wall.x*2, size.y + wall.y*2, wall.z], r=2.5, 3d=false);
      for(p = [[wall.x+4, wall.y+4], [wall.x+size.x-4, wall.y+size.y-4]]) {
        translate([p.x, p.y, size.z/2])
          cylinder(size.z/2, d=7);
        translate([p.x, p.y, 0])
          cylinder(size.z, d=3.5);
      }
    }
}
