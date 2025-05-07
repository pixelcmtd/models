/// A spool holder (for filament spools that don't have filament on them).
///
/// Designed by babaEX.
$fn = 100;

union() {
  for(x = [-55, 55])
    translate([x, -55, 0])
      difference() {
        cylinder(300, d=50);
        cylinder(300, d=46);
      }

  cylinder(4, d=100);
  cylinder(34, d=45.6);

  translate([0, 75, 0])
    difference() {
      cylinder(60, d=45.6);
      cylinder(60, d=40);
    }
}
