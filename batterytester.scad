/// BoM:
/// - Battery thingy: https://ae01.alicdn.com/kf/Sce4b29949b7449bdba2574988b619db5S.jpg
/// - HS100: https://media.digikey.com/pdf/Data%20Sheets/Ohmite%20PDFs/HS_Resistors.pdf
/// - 2x 12×20 switch: https://ae01.alicdn.com/kf/Sc5bd4ec7b2de49d798a1bf6e7486f891l.jpg
/// or Earu MTS-103
/// - any combination of M4 screws and spacers (4x CM4×40; 2x CM4×40, 2x SM4×8; etc)
/// - 1x CM3×8 (battery thingy)
/// - 2x SM3×~20 (Vin/GND)
/// - 2x NM3 (Vin/GND)
///
/// HS100 is overkill, but easier to mount rn.

use <CMSL.scad>;
$fn = 100;

union() {
  difference() {
    CMRoundBox([110, 90, 40], wall=[5, 5, 5], r=5, 3d=false);
    translate([2, 2, 35])
      CMRoundCube([106, 86, 5], r=5, center=false, 3d=false);
    for(x = [(110-35)/2, (110+35)/2])
      for(y = [12, 12+37])
        translate([x, y, 5])
          CMInsertM4S();
    translate([110/2, 12+37/2, 1])
      linear_extrude(4)
      text("meow", size=10, valign="center", halign="center");
  }
  difference() {
    translate([2.2, 2.2, 35])
      CMRoundCube([105.6, 85.6, 5], r=5, center=false, 3d=false);
    translate([110/2, 90-3-17/2, 40])
      CMInsertM3S();
    for(x = [(110-58)/2, (110+58)/2])
      translate([x, 90-6-17/2, 35])
        cylinder(5, d=2.8);
    for(x = [(110-105/2-20)/2, (110+105/2-20)/2])
      translate([x, 5.5, 35])
        cube([20, 12, 5]);
    translate([110/2, 5.5+12/2, 35])
      cylinder(5, d=6.5);
    for(x = [12.5, 110-12.5]) {
      translate([x, 25, 35])
        cylinder(5, d=3.3);
      translate([x, 90-25, 35])
        cylinder(5, d=5.5);
    }
    translate([12.5, 20, 35])
      linear_extrude(5)
      text("Vin", size=3, valign="center", halign="center");
    translate([110-12.5, 20, 35])
      linear_extrude(5)
      text("GND", size=3, valign="center", halign="center");
    translate([(110-105/2)/2, 21.5, 35])
      linear_extrude(5)
      text("Charge", size=3, valign="center", halign="center");
    translate([(110+105/2)/2, 21.5, 35])
      linear_extrude(5)
      text("Load", size=3, valign="center", halign="center");
    translate([110/2, 90/2, 35])
      linear_extrude(5)
      text("UwU", size=17.5, valign="center", halign="center");
    for(x = [(110-35)/2, (110+35)/2])
      for(y = [12, 12+37])
        translate([x, y, 40])
          rotate([0, 180, 0])
          CMCountersunk(40, 4.5);
  }
}
