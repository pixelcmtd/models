/// a backplate for older intel sockets (75²)
use <CMSL.scad>;
$fn = 100;

union() {
  CMFrame([[5, 5], [5, 80], [80, 5], [80, 80]], r=5, h=10, w=10, 3d=false);

  for(x = [5, 80])
    for(y = [5, 80])
      difference() {
        translate([x, y, 10])
          cylinder(10, d=10);
        translate([x, y, 20])
          CMInsertM3(l=10);
      }
}
