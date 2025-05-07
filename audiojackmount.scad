/// A mount for a ¼" audio jack, held in place by something like a headphone
/// holder. Currently used below my booth.
use <CMSL.scad>;
$fn = 100;
// https://cdn-reichelt.de/documents/datenblatt/C160/S2_ENG_DATASHEET.pdf

difference() {
  CMBox([40, 40, 25], wall=2, fronttext=[]);
  translate([20, 20, 0])
    cylinder(2, d=11.11);
}
translate([-20, 0, 0])
  cube([80, 2, 25]);
