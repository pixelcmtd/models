/// a shitty duct to attach a hose to a window
$fn = 200;

difference() {
  union() {
    cylinder(50, d=70);
    cylinder(8, d=100);
  }
  cylinder(50, d=60);

  for(x = [-45, 45])
    translate([x, 0, 0])
      cylinder(8, d=4);
  for(y = [-45, 45])
    translate([0, y, 0])
      cylinder(8, d=4);
}
