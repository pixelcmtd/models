/*
 * CMSL - The chrissx Media SCAD library
 * Copyright 2021-2023 chrissx Media, P. C. Häußler
 * For licensing information please refer to the 2nd version of the GNU General
 * Public License, as found in the repository you should have obtained this file
 * from, at <https://github.com/pixelcmtd/models/tree/master/LICENSE>.
 */

module CMMultiLineText(lines = [], size = 10, font = "Liberation Mono",
    halign = "left", valign = "baseline",
    direction = "ltr", hspace = 1, vspace = 3) {
  translate([0, -size]) {
    for (i = [0 : len(lines) - 1]) {
      translate([0, (-i - 0.5) * vspace]) {
        text(text=lines[i], size=size, font=font, valign=valign, halign=halign,
            direction=direction, spacing=hspace);
      }
    }
  }
}

module CMBox(width=50, height=37.5, wall=1, fronttext=[],
    textsize=1.5, font="Liberation Mono", textdepth=1.5) {
  inner = width - wall * 2;
  union() {
    difference() {
      cube([width, width, height]);
      translate([wall, wall, wall])
        cube([inner, inner, height+1]);
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

module CMRoundCube(size=1, r=0.25, 3d=true, center=false) {
  size = is_num(size) ? [size, size, size] : size;
  center = is_bool(center) ? [center, center, center] : center;
  translate([center.x ? -size.x/2 : 0, center.y ? -size.y/2 : 0, center.z ? -size.z/2 : 0])
    if(3d)
      hull()
        for(p = [[r, r, r],
            [r, r, size.z - r],
            [r, size.y - r, r],
            [r, size.y - r, size.z - r],
            [size.x - r, r, r],
            [size.x - r, r, size.z - r],
            [size.x - r, size.y - r, r],
            [size.x - r, size.y - r, size.z - r]])
          translate(p)
              sphere(r=r);
    else
      linear_extrude(size.z)
        hull()
        for(p = [[r, r],
            [r, size.y - r],
            [size.x - r, r],
            [size.x - r, size.y - r]])
          translate(p)
              circle(r=r);
}

module CMRing(inner=0.5, outer=1, height=1) {
  linear_extrude(height) {
    difference() {
      circle(outer);
      circle(inner);
    }
  }
}

/// only use this in applications where you are fine with it changing
// TODO: make the teeth straight
module CMGear(inner=0.5, outer=1, height=1, n=5, thickness=0.5, width=0.5) {
  union() {
    CMRing(inner, outer, height);
    for(i = [0:n])
      rotate([0,0,i*360/n])
        translate([inner,0,0])
        cube([outer-inner+thickness, width, height]);
  }
}
