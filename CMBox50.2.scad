use <CMSL.scad>

boxtext = [
  "CMBox 50.2",
  "Copyright 2021 chrissx Media",
  "All rights reserved.",
  "",
  "> ls",
  "No such program.",
];

CMBox(width=50, height=37.5, wall=2, fronttext=boxtext, font="Liberation Mono");