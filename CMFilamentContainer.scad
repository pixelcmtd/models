/// A little thing to hold your filament spools
/// when they don't fit in your printer.

difference() {
  union() {
    cylinder(4, r=32.5);
    cylinder(65, r=25);
  }
  cylinder(65, r=3);
  translate([0, 0, 4])
    cylinder(57, r=22);
}
