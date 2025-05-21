/// holds smol spools (designed for electrical tape)
$fn = 100;

d = 22;
h = 240;
b = 60;
w = 5;

difference() {
  union() {
    cylinder(w, d=b);
    cylinder(h, d=d);
  }
  cylinder(h, d=d-w);
}
