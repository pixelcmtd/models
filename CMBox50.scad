use <CMSL.scad>

boxtext = [
  "CMBox 1.1",
  "Copyright 2021 chrissx Media",
  "All rights reserved.",
  "",
  "> ls",
  "No such command.",
];

CMBox(width=50, height=37.5, wall=1, fronttext=boxtext, font="Liberation Mono");
