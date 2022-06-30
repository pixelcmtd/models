/// A cup that can fit a can of Monster or be used otherwise.

$fn = 20;
difference() {
  cylinder(140, d=75);
  cylinder(137, d=69);
  cube([40, 40, 1000], true);
}
