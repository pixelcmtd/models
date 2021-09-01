SCAD = $(wildcard *.scad)

all: $(SCAD:.scad=.stl)

%.stl: %.scad
	openscad $< -o $@
