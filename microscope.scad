/// a microscope for your phone
$fn = 100;

union() {
  difference() {
    cube([85, 60, 10]);
    translate([30, 30, 0])
      cylinder(5.6, d=55);
    translate([30, 30, 0])
      cube([3.5, 30, 5]);
    translate([61.5, 27.5, 0])
      cube([20, 5, 5]);
  }

  translate([0, 29, 10])
    cube([85, 31, 60]);

  translate([-38, -18, 50])
    difference() {
      cube([126, 78, 20]);
      translate([4, 3, 0])
        cube([118, 44, 16]);
      translate([4, 5, 0])
        cube([118, 40, 20]);
    }

  translate([-25, 0, 40])
    union() {
      sphere(d=20);
      cylinder(30, d=12);
    }

  translate([25, 0, 40])
    union() {
      sphere(d=20);
      cylinder(30, d=12);
    }

  translate([75, 0, 40])
    union() {
      sphere(d=20);
      cylinder(30, d=12);
    }
}
