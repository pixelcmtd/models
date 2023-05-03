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

/// NOTE: this api will be broken until it is good
module CMBox(size=[50, 50, 37.5], wall=1, fronttext=[],
    textsize=1.5, font="Liberation Mono", textdepth=1.5) {
  size = is_num(size) ? [size, size, size] : size;
  wall = is_num(wall) ? [wall, wall, wall] : wall;
  // TODO: inverted text if depth < 0
  union() {
    difference() {
      cube([size.x, size.y, size.z]);
      translate([wall.x, wall.y, wall.z])
        cube([size.x - wall.x * 2, size.y - wall.y * 2, size.z+1]);
    }
    translate([wall.x, 0, size.z-wall.z]) {
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

/// NOTE: only use this in applications where you are fine with it changing
///       (the teeth aren't straight, which we'll probably fix)
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

// TODO: angle halfes
module CMAngleConnector(w=5, h1=10, h2=10, thickness=3, angle=90) {
  union() {
    translate([0, 0, -w])
      linear_extrude(thickness)
      difference() {
        square([h1, w]);
        translate([h1, w/2])
          children();
      }
    rotate([0, angle, 0])
      linear_extrude(thickness)
      difference() {
        square([h2, w]);
        translate([h2, w/2])
          children();
      }
  }
}
