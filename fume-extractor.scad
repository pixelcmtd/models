/// A fume extractor for soldering etc.
///
/// ### Ingredients
///
/// - 4× 120mm fans
/// - 4× 120×120×10 carbon filters
/// - 16× IM3S
use <CMSL.scad>;
$fn = 50;

size = [2, 2];

difference() {
  CMRoundCube([size.x*122+8, size.y*122+8, 45], r=7.5, 3d=false);
  translate([4, 4, 0])
    CMRoundCube([size.x*122, size.y*122, 25], r=5, 3d=false);
  for(x = [0:122:122*(size.x-1)])
    for(y = [0:122:122*(size.y-1)]) {
      translate([x+5, y+5, 25]) {
        CMRoundCube([120, 120, 5], r=35, 3d=false);
        CMFanHoles120()
          CMInsertM3S(o=0);
      }
      translate([x+4.5, y+4.5, 30])
        cube([121, 121, 11]);
      translate([x+5, y+5, 40])
        CMRoundCube([120, 120, 5], r=20, 3d=false);
    }
  translate([0, 4, 0])
    cube([9, 2, 25]);
}
