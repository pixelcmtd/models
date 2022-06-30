/// A very simple clamp that was used to attach a desk pad to a desk once.

difference() {
  cube([36, 10, 20]);
  translate([3, 0, 0])
    cube([30, 10, 17]);
}
