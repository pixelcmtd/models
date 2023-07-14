/// A pipe to pass your filament through.
/// Now very FlashForge Finder (v1) specific.

$fn = 100;

difference() {
  union() {
    cube([25, 80, 5]);
    translate([25, 60, 0])
      cube([30, 20, 5]);
    translate([47, 75, -11])
      cube([5, 5, 11]);
    translate([25, 75, -30])
      cube([5, 5, 30]);
  }
  translate([37.5, 70, 0])
    cylinder(h=5, d=8);
  for(x = [5, 20])
    translate([x, 5, 0])
      cylinder(h=5, r=2.5);
  for(p = [[49.5, -8], [27.5, -27]])
    translate([p.x, 80, p.y])
      rotate([90, 0, 0])
      cylinder(h=5, d=4);
}
