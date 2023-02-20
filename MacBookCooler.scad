/// Successor to MacBookMount
/// Externally water cools your MacBook (if you made it uncompliant)

$fn = 50;

rotate([-90, 0, 0]) {
  difference() {
    cube([330, 315, 200]);
    translate([0, 5, 20])
      cube([325, 305, 175]);
    translate([5, 80, 5])
      cube([315, 225, 190]);
    translate([325, 42.5, 45])
      rotate([0, 90, 0])
      cylinder(5, d=50);

    translate([40, 5, 70])
      rotate([90, 0, 0])
      cylinder(5, d=4);
    translate([40, 5, 138.5])
      rotate([90, 0, 0])
      cylinder(5, d=4);
    translate([130, 5, 70])
      rotate([90, 0, 0])
      cylinder(5, d=4);
    translate([130, 5, 138.5])
      rotate([90, 0, 0])
      cylinder(5, d=4);
    translate([233.5, 5, 70])
      rotate([90, 0, 0])
      cylinder(5, d=4);
    translate([233.5, 5, 138.5])
      rotate([90, 0, 0])
      cylinder(5, d=4);

    translate([130, 10, 195])
      rotate([0, 0, 90])
      cylinder(5, d=5);
    translate([130, 130, 195])
      rotate([0, 0, 90])
      cylinder(5, d=5);
    translate([10, 10, 195])
      rotate([0, 0, 90])
      cylinder(5, d=5);
    translate([10, 130, 195])
      rotate([0, 0, 90])
      cylinder(5, d=5);

    translate([320, 10, 195])
      rotate([0, 0, 90])
      cylinder(5, d=5);
    translate([320, 130, 195])
      rotate([0, 0, 90])
      cylinder(5, d=5);
    translate([200, 10, 195])
      rotate([0, 0, 90])
      cylinder(5, d=5);
    translate([200, 130, 195])
      rotate([0, 0, 90])
      cylinder(5, d=5);

    translate([260, 70, 195])
      cylinder(5, d=120);

    translate([140, 5, 195])
      cube([50, 130, 5]);

    translate([148.5, 66, 5])
      cube([28, 14, 15]);
  }
}
