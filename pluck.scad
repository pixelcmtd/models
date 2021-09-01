$fn = 60;

scale([15, 15, 15])
union() {
mirror([0, 0, 1])
rotate_extrude()
difference() {
    scale([1, 0.15, 1])
    circle();
    translate([-1, 0, 0])
    square();
    translate([-1, -1, 0])
    square();
    translate([0, -1, 0])
    square();
}

rotate_extrude()
difference() {
    scale([1, 0.15, 1])
    circle();
    translate([-1, 0, 0])
    square();
    translate([-1, -1, 0])
    square();
    translate([0, -1, 0])
    square();
}
}
