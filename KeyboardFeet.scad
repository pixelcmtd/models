/// Feet for my keyboard to stand on the desk,
/// with enough space to route cables below it.
$fn = 500;

for(x = [0, 45])
  for(y = [0, 45])
    translate([x, y, 0])
      cylinder(20, d=39);
