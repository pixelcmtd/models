SCAD = $(wildcard *.scad)
STL = $(SCAD:.scad=.stl)

all: $(STL)

%.stl: %.scad
	openscad $< -o $@

clean:
	rm -f $(STL) *.gx

.PHONY: all clean
