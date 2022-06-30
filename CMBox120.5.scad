/// A 120²x70 CMBox with a wall-thickness of 5.

use <lib/CMSL.scad>

boxtext = [
  "CMBox 120.5",
  "Copyright 2021 chrissx Media",
  "All rights reserved.",
  "",
  "$ dir",
  "cmsh: command not found: dir",
];

CMBox(width=120, height=70, wall=5,
      fronttext=boxtext, font="Liberation Mono", textsize=4);
