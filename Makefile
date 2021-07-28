SCAD = $(wildcard *.scad)
STL  = $(SCAD:.scad=.stl)

all: $(STL)

%.stl: %.scad
	openscad $< -o $@
