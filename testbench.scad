/// A PC test bench that supports ATX, Micro-ATX, DTX, Mini-ITX and probably many more.
///
/// Extra parts needed:
/// - M3 Inserts (l < 7.5)
/// - M3 Spacers (l ≥ 90)
/// - M3 Countersunk Screws (8 < l < 12 should be a good idea, depending on your spacers)
/// - M3 Screws (l ≤ 10, depending on your mainboard and pcie slot thicknesses)
use <CMSL.scad>;
$fn = 10;

posts = [         // names according to the ATX & mATX specs
  //[16.5, 6.4],    // K
  [141, 6.4],     // L
  [298.5, 6.4],   // M
  //[16.5, 78.7],   // G
  //[74.9, 78.7],   // R
  //[95.3, 78.7],   // S
  [141, 78.7],    // H
  [298.5, 78.7],  // J
  //[16.5, 233.7],  // A
  //[95.3, 233.7],  // B
  [141, 233.7],   // C
  [298.5, 210.8], // F
];
n_p = 2;

union() {
  difference() {
    union() {
      difference() {
        CMFrame(concat(posts, [[5+20.32*(7-n_p), 250], [150, 250], [5+20.32*(7-n_p), 248], [150, 248]]), r=5, h=5, w=10, 3d=false);
        for(c = posts)
          translate(c)
            CMInsertM3(o=0);
      }

      for(pos = posts)
        difference() {
          translate([pos.x, pos.y, 5])
            cylinder(15, d=10);
          translate([pos.x, pos.y, 20])
            CMInsertM3(15);
        }

      // TODO: ssd mounting posts
      //translate([150, 0, 5])
      //difference() {
      //CMRoundCube([1, 6, 12], r=0.5);
      //translate([0, 1, 0])
      //CMRoundCube([1, 4, 11], r=0.5);
      //}

      translate([4.17+20.32*(7-n_p)-1, 244, 0])
        CMRoundCube([9.95/2+1, 10, 18], r=2);
      for(i = [0:n_p-2])
        translate([4.17+20.32*(6-i)-9.95/2, 244, 0])
          CMRoundCube([9.95, 10, 18], r=2);
      translate([4.17+20.32*7-9.95/2-1, 244, 0])
        CMRoundCube([9.95/2+1, 10, 18], r=2);

      for(i = [0:n_p])
        translate([4.17+20.32*(7-i)-1, 246, 0])
          CMRoundCube([2, 8, 113], r=1);
    }
    for(i = [0:n_p])
      translate([4.17+20.32*(7-i), 248, 0])
        CMInsertM3(o=0);
  }

  translate([0, 246, 110])
    difference() {
      translate([3.17+20.32*(7-n_p), 0, 0])
        CMRoundCube([6.23+20.32*n_p-4.23, 8, 10], r=1, 3d=false);

      for(i = [0:n_p-1])
        translate([22.48+20.32*(6-i), 4.22, 10])
          CMInsertM3();
    }

  translate([0, 300, 0])
    union() {
      difference() {
        union() {
          CMFrame(posts, r=5, h=4, w=10, 3d=false);
          linear_extrude(4)
            hull()
            for(p = [[141, 250], [298.5, 250], [141, 78.7], [298.5, 78.7], [141, 233.7], [298.5, 210.8]])
              translate(p)
                circle(r=5);
        }

        for(pos = posts)
          translate([pos.x, pos.y, 0])
            CMCountersunk(l=4, ds=3, dk=6, k=4);
        for(i = [0:n_p])
          translate([4.17+20.32*(7-i), 248, 0])
            CMCountersunk(l=4, ds=3, dk=6, k=4);
      }

      // TODO: detachable psu mount
      translate([291, 239, 0])
        rotate([90, 0, 180])
        difference() {
          for(p = [[6, 80], [120, 6], [144, 80]])
            translate([p.x-7/2, 0, 0])
              CMRoundCube([7, p.y+7, 4], r=7/2, 3d=false);
          for(p = [[6, 16], [6, 80], [120, 6], [144, 80]])
            translate([p.x, p.y+7/2, 0])
              cylinder(4, d=4);
        }
    }
}
