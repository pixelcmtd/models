/// A PC test bench that supports ATX, Micro-ATX, DTX, Mini-ITX and probably many more.
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
        linear_extrude(5)
          union() {
            //difference() {
  // TODO: only make the itx part solid (CMFrame(?, r, h, w, 3d=false))
            hull()
              for(p = concat([[141, 250], [298.5, 250]], posts))
                translate(p)
                  circle(r=5);
            //for(x = [0:12:160])
            //  for(y = [0:12:240])
            //    translate([141+x, 8+y])
            //      circle(d=9, $fn=6);
            //for(x = [0+12/2:12:160])
            //  for(y = [0+12/2:12:240])
            //    translate([141+x, 8+y])
            //      circle(d=9, $fn=6);
            //}
            //for(p = posts)
            //  translate(p)
            //    circle(d=10);
            hull()
              for(p = [[4.17+20.32*(7-n_p)-1, 248], [141, 248]])
                translate(p)
                  circle(r=7);
          }

        for(pos = posts)
          translate([pos.x, pos.y, 0])
            CMCountersunk(l=5, ds=3, dk=6, k=4);
        for(i = [0:n_p])
          translate([4.17+20.32*(7-i), 248, 0])
            CMCountersunk(l=5, ds=3, dk=6, k=4);
      }

      //for(pos = posts)
      //  if(pos != [141, 233.7])
      //    translate([pos.x, pos.y, 0])
      //      cylinder(120, d=6);

      //translate([20.32*(7-n_p), 246-6/2, 0])
      //  CMRoundCube([20.32*n_p, 6, 125], r=6/2, 3d=false);

      //translate([298.5-6/2, 78.7-5, 0])
      //  CMRoundCube([6, 210.8-78.7+10, 125], r=6/2, 3d=false);

      translate([291, 239, 0])
        rotate([90, 0, 180])
        difference() {
          union() {
            translate([6-10/2, 0, 0])
              CMRoundCube([10, 80+10, 5], r=5, 3d=false);
            translate([120-10/2, 0, 0])
              CMRoundCube([10, 6+10, 5], r=5, 3d=false);
            translate([144-10/2, 0, 0])
              CMRoundCube([10, 80+10, 5], r=5, 3d=false);
          }
          translate([6, 16+5, 0])
            cylinder(5, d=5);
          translate([6, 80+5, 0])
            cylinder(5, d=5);
          translate([120, 6+5, 0])
            cylinder(5, d=5);
          translate([144, 80+5, 0])
            cylinder(5, d=5);
        }
    }
}
