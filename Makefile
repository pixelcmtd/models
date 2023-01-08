SCAD = $(wildcard *.scad)
STL = $(SCAD:.scad=.stl)
CSG = $(SCAD:.scad=.csg)
PNG = $(SCAD:.scad=.png)

all: $(STL) $(CSG) README.md

%.stl: %.scad
	openscad $< -o $@

%.csg: %.scad
	openscad $< -o $@

%.png: %.scad
	openscad $< --render --imgsize 1024,1024 -o $@

clean:
	rm -f $(PNG) $(STL) *.gx README.md

README.md: README.template.md $(PNG) $(SCAD) Makefile
	for x in $(SCAD) ; do echo "\n## [`echo $$x | sed 's/\.scad$$//'`]($$x)\n\n`grep '^/// ' $$x`\n\n<img width=200px height=200px src=`echo $$x | sed 's/\.scad$$/.png/'` />" ; done | sed 's/^\/\/\/ //' | cat README.template.md - > README.md

.PHONY: all clean
