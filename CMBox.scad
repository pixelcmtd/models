union() {
  difference() {
    translate([-25, -25, -22.5]) {
      cube([50, 50, 37.5]);
    }
    translate([-24, -24, -21.5]) {
      cube([48, 48, 38]);
    }
  }
  translate([-24, -24, 5.5]) {
    rotate([90, 0, 0]) {
      linear_extrude(1.5) {
        lines = [
          "CMBox rev. 1",
          "Copyright 2021 chrissx Media",
          "All rights reserved.",
          "",
          "> ls",
          "No such command.",
        ];
        endidx = len(lines) - 1;
        offset_y = 3 * endidx / 2;
        for (i = [0 : endidx]) {
          translate([0 , -i * 3 + offset_y, 0]) {
            text(lines[i], 2, font = "Liberation Mono", valign = "top", halign = "left");
          }
        }
      }
    }
  }
}
