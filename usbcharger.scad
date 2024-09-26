/// ### Ingredients
///
/// - n×charging module (2×[USB-PD module](https://aliexpress.com/item/4000186077208.html) in the given version)
/// - m×wood screw M3×h (2~6×wood screw M3×>20)
use <CMSL.scad>;
$fn = 100;

size = [50, 19, 15, 3.4];
n = 2;
w = 3;

for(i = [1:n])
  translate([0, (size.y+w)*i, 0])
    difference() {
      union() {
        CMBox([size.x + w*2, size.y + w*2, size.z + w], wall=w, fronttext=[]);
        for(x = [w, size.x + w])
          for(y = [w, size.y + w])
            translate([x, y, w])
              cylinder(size[3], d=w);
        translate([0, 0, size.z + w])
          cube([size.x + w*2, size.y + w*2, w]);
      }
      // TODO: better cutout
      translate([0, w*1.5, w])
        cube([size.x + w*2, size.y - w, size.z]);
      for(x = [w, size.x+w])
        for(y = [w/2, size.y+w*3/2])
          translate([x, y, size.z + w*2])
            rotate([180, 0, 0])
            CMCountersunk(l=size.z+w*2, ds=3.25);
    }
