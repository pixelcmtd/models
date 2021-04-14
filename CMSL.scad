/*
CMSL - The chrissx Media SCAD library
Copyright 2021 chrissx Media, Chris Häußler
For licensing information please refer to the 2nd version of the
GNU General Public License, as found in the repository you should have
obtained this file from, at https://github.com/chrissxYT/models.
*/

module CMMultiLineText(lines = [], size = 10, font = "Liberation Mono",
                       halign = "left", valign = "baseline",
                       direction = "ltr", hspace = 1, vspace = 3) {
  translate([0, -size, 0]) {
    for (i = [0 : len(lines) - 1]) {
      translate([0 , (-i - 0.5) * vspace, 0]) {
        text(text=lines[i], size=size, font=font, valign=valign, halign=halign,
             direction=direction, spacing=hspace);
      }
    }
  }
}

module CMBox(width=50, height=37.5, wall=1,
             fronttext=[], textsize=1.5, font="Liberation Mono", textdepth=2) {
  inner = width - wall * 2;
  union() {
    difference() {
      cube([width, width, height]);
      translate([wall, wall, wall]) {
        cube([inner, inner, height+1]);
      }
    }
    translate([wall, 0, height-wall]) {
      rotate([90, 0, 0]) {
        linear_extrude(textdepth) {
          CMMultiLineText(fronttext, size=textsize, vspace=textsize, font=font);
        }
      }
    }
  }
}
