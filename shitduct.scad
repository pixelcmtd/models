/// a shitty duct to attach a hose to a window
$fn = 200;

difference() {
  union() {
    cylinder(50, d=70);
    cylinder(8, d=100);
  }
  cylinder(50, d=60);

  translate([45, 0, 0])
    cylinder(8, d=4);
  translate([-45, 0, 0])
    cylinder(8, d=4);
  translate([0, 45, 0])
    cylinder(8, d=4);
  translate([0, -45, 0])
    cylinder(8, d=4);
}
