/// Feet for my keyboard to stand on an HDMI switch and Composite converter in
/// addition to my PS4.
$fn = 500;

union() {
  cylinder(d=40, h=10);
  translate([50, 0, 0])
    cylinder(d=40, h=25);
}
