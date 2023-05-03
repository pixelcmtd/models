SCAD = $(wildcard *.scad)
STL = $(SCAD:.scad=.stl)
CSG = $(SCAD:.scad=.csg)
PNG = $(SCAD:.scad=.png)
DXF = $(SCAD:.scad=.dxf)

all: $(CSG) $(STL) $(DXF) README.md

%.stl: %.csg
	OPENSCADPATH=lib openscad $< -o $@

%.csg: %.scad
	OPENSCADPATH=lib openscad $< -o $@

%.png: %.csg
	OPENSCADPATH=lib openscad $< --render --imgsize 1024,1024 --colorscheme BeforeDawn -o $@

%.2d.scad: %.stl
	echo 'projection() import("$<");' > $@

%.dxf: %.2d.scad
	OPENSCADPATH=lib openscad $< -o $@

clean:
	rm -f $(STL) $(CSG) $(PNG) *.gx *.gcode *.cnc README.md

README.md: README.template.md $(SCAD) $(PNG) Makefile
	for x in $(SCAD) ; do echo "\n## [`echo $$x | sed 's/\.scad$$//'`]($$x)\n\n`grep '^/// ' $$x`\n\n<img width=200px height=200px src=`echo $$x | sed 's/\.scad$$/.png/'` />" ; done | sed 's/^\/\/\/ //' | cat README.template.md - > README.md

.PHONY: all clean
