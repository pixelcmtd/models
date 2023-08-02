/// I felt my variac could use some handles, so I printed some.
///
/// ### Ingredients
///
/// - [a variac](https://eur.vevor.com/variable-transformer-c_10755/variable-transformer-2000va-power-supply-voltage-transformer-converter-220v-p_010539394485) (buy it from somewhere else for cheaper)
/// - 4×SM4×16
/// - 4×WM4
use <CMSL.scad>;
$fn = 100;

difference() {
  union() {
    for(y = [0, 97]) {
      translate([0, y, 0])
        CMRoundCube([10, 10, 10], r=3, 3d=false);
      translate([0, y, 1])
        CMRoundCube([30, 10, 9], r=3, 3d=false);
      translate([20, y, 1])
        CMRoundCube([10, 10, 39], r=3, 3d=false);
    }
    translate([20, 0, 35])
      CMRoundCube([10, 107, 10], r=3, 3d=true);
  }
  for(y = [5, 102])
    translate([5, y, 0])
      cylinder(10, d=4.5);
}
