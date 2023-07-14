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
    for(x = [0, 100])
      for(y = [0, 100])
        translate([x, y, 0])
          cylinder(5, d=5);
    for(x = [12.5, 87.5])
      for(y = [12.5, 87.5])
        translate([x, y, 0])
          cylinder(5, d=5);
  }

  translate([-45, -45])
    difference() {
      cube([200, 200, 50]);
      translate([100, 100, 0])
        cylinder(50, d=190);

      for(x = [15, 185])
        for(y = [15, 185])
          translate([x, y, 45])
            cylinder(5, d=5);

      for(x = [22.5, 177.5])
        for(y = [22.5, 177.5])
          translate([x, y, 45])
            cylinder(5, d=5);

      for(x = [0, 200])
        for(y = [0, 200])
          translate([x, y, 0])
            cylinder(45, d=90);
    }
}
