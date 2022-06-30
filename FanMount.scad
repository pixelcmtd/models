/// A structure that allows you to mount a 200mm fan to a VESA mount.

$fn = 100;

union() {
  difference() {
    union() {
      translate([-7.5, -17.5, 0])
      rotate(45)
      cube([190, 15, 5]);
      translate([-22.5, 110, 0])
      rotate(-45)
      cube([190, 15, 5]);
    }
    cylinder(h=5, r=2.5);
    translate([100, 0, 0]) cylinder(h=5, r=2.5);
    translate([100, 100, 0]) cylinder(h=5, r=2.5);
    translate([0, 100, 0]) cylinder(h=5, r=2.5);
    translate([12.5, 12.5, 0]) cylinder(h=5, r=2.5);
    translate([87.5, 12.5, 0]) cylinder(h=5, r=2.5);
    translate([87.5, 87.5, 0]) cylinder(h=5, r=2.5);
    translate([12.5, 87.5, 0]) cylinder(h=5, r=2.5);
  }

  translate([-45, -45])
    difference() {
      cube([200, 200, 50]);
      translate([100, 100, 0]) cylinder(h=50, r=95);

      translate([15, 15, 45]) cylinder(h=5, r=2.5);
      translate([15, 185, 45]) cylinder(h=5, r=2.5);
      translate([185, 15, 45]) cylinder(h=5, r=2.5);
      translate([185, 185, 45]) cylinder(h=5, r=2.5);

      translate([22.5, 22.5, 45]) cylinder(h=5, r=2.5);
      translate([22.5, 177.5, 45]) cylinder(h=5, r=2.5);
      translate([177.5, 22.5, 45]) cylinder(h=5, r=2.5);
      translate([177.5, 177.5, 45]) cylinder(h=5, r=2.5);

      translate([0, 0, 0]) cylinder(h=45, r=45);
      translate([0, 200, 0]) cylinder(h=45, r=45);
      translate([200, 0, 0]) cylinder(h=45, r=45);
      translate([200, 200, 0]) cylinder(h=45, r=45);
    }
}
