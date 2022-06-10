difference() {
  union() {
    translate([-5, 0, 0])
      cube([85, 20, 5]);
    translate([0, 20, 0])
      cube([75, 5, 30]);
    translate([-5, 20, 0])
      cube([5, 20, 30]);
    translate([75, 20, 0])
      cube([5, 20, 30]);
    translate([-5, 20, 30])
      cube([85, 20, 5]);
  }
  translate([5, 5, 0])
    cylinder(h=5, r=2.5);
  translate([70, 5, 0])
    cylinder(h=5, r=2.5);
  translate([5, 15, 0])
    cylinder(h=5, r=2.5);
  translate([70, 15, 0])
    cylinder(h=5, r=2.5);
}
