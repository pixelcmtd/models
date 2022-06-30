SCAD = $(wildcard *.scad)
STL = $(SCAD:.scad=.stl)
PNG = $(SCAD:.scad=.png)

all: $(STL) README.md

%.stl: %.scad
	openscad $< -o $@

%.png: %.scad
	openscad $< --imgsize 1024,1024 -o $@

clean:
	rm -f $(PNG) $(STL) *.gx README.md

README.md: README.template.md $(PNG) $(SCAD)
	for x in $(SCAD) ; do echo "\n## $$x\n\n`grep '^/// ' $$x`\n\n<img width=100px height=100px src=`echo $$x | sed 's/\.scad$$/.png/'` />" ; done | sed 's/^\/\/\/ //' | cat README.template.md - > README.md

.PHONY: all clean
