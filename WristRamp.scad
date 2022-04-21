$fn = 8;

difference() {
  linear_extrude(75)
    polygon([[0,0],[0,7],[85,7]]);

  translate([3.5,4,0])
    cylinder(75,r=1);

  translate([10,4,0])
    cylinder(75,r=1);
}
