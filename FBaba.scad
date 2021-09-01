linear_extrude(10) {
  union() {
    square([6, 47]);
    translate([0, 20])
    square([26, 6]);
    translate([0, 41])
    square([26, 6]);
  }
}
