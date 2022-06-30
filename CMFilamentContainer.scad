/// A little thing to hold your filament spools
/// when they don't fit in your printer.

difference() {
    union() {
        linear_extrude(4)
            circle(32.5);
        linear_extrude(65)
            circle(25);
    }
    linear_extrude(65)
        circle(3);
    translate([0, 0, 4])
        linear_extrude(57)
        circle(22);
}
