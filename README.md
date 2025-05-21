# models

Models for CNC (3DP, Laser, Milling). Some are official chrissx Media projects,
some are just my personal goofing around.

BoMs use the
[CMSFC](https://gist.github.com/pixelcmtd/e563df3891d0242b0eebf33e270d5591)
abbreviations.

## [audiojackmount](audiojackmount.scad)

A mount for a ¼" audio jack, held in place by something like a headphone
holder. Currently used below my booth.

<img width=200px height=200px src=audiojackmount.png />

## [BabasRing](BabasRing.scad)

A gear that babaEX needed once.

<img width=200px height=200px src=BabasRing.png />

## [badoven](badoven.scad)

a kind of oven/furnace that can be built very easily and
is only designed for temps up to about 100C (depending on material choice)

<img width=200px height=200px src=badoven.png />

## [batterytester](batterytester.scad)

BoM:
- Battery thingy: https://ae01.alicdn.com/kf/Sce4b29949b7449bdba2574988b619db5S.jpg
- HS100: https://media.digikey.com/pdf/Data%20Sheets/Ohmite%20PDFs/HS_Resistors.pdf
- 2x 12×20 switch: https://ae01.alicdn.com/kf/Sc5bd4ec7b2de49d798a1bf6e7486f891l.jpg
or Earu MTS-103
- any combination of M4 screws and spacers (4x CM4×40; 2x CM4×40, 2x SM4×8; etc)
- 1x CM3×8 (battery thingy)
- 2x SM3×~20 (Vin/GND)
- 2x NM3 (Vin/GND)

HS100 is overkill, but easier to mount rn.

<img width=200px height=200px src=batterytester.png />

## [boost-case](boost-case.scad)

Case for [XL6019](https://de.aliexpress.com/item/4000197777372.html) boost
converter

<img width=200px height=200px src=boost-case.png />

## [CMBox120.5](CMBox120.5.scad)

A 120²x70 CMBox with a wall-thickness of 5.

<img width=200px height=200px src=CMBox120.5.png />

## [CMBox50.2](CMBox50.2.scad)

A 50²x37.5 CMBox with a wall-thickness of 2.

<img width=200px height=200px src=CMBox50.2.png />

## [CMBoxSchoolAmp](CMBoxSchoolAmp.scad)

An 82²x35 CMBox with a wall-thickness of 6
made to be close to the SchoolAmp project.

<img width=200px height=200px src=CMBoxSchoolAmp.png />

## [CMFilamentContainer](CMFilamentContainer.scad)

A little thing to hold your filament spools
when they don't fit in your printer.

<img width=200px height=200px src=CMFilamentContainer.png />

## [CMMountedFilamentPipe](CMMountedFilamentPipe.scad)

A pipe to pass your filament through.
Now very FlashForge Finder (v1) specific.

<img width=200px height=200px src=CMMountedFilamentPipe.png />

## [FBaba](FBaba.scad)

F

<img width=200px height=200px src=FBaba.png />

## [FanMount](FanMount.scad)

A structure that allows you to mount a 200mm fan to a VESA mount.

<img width=200px height=200px src=FanMount.png />

## [fridge](fridge.scad)

A TEC-powered mini fridge

<img width=200px height=200px src=fridge.png />

## [fume-extractor](fume-extractor.scad)

A fume extractor for soldering etc.

### Ingredients

- 4× 120mm fans
- 4× 120×120×10 carbon filters
- 16× IM3S

<img width=200px height=200px src=fume-extractor.png />

## [fusepanel](fusepanel.scad)

A simple box for mounting DIN rail circuit breakers.

<img width=200px height=200px src=fusepanel.png />

## [KeyboardFeet](KeyboardFeet.scad)

Feet for my keyboard to stand on the desk,
with enough space to route cables below it.

<img width=200px height=200px src=KeyboardFeet.png />

## [labpsu2](labpsu2.scad)

very rough prototype of a case for my second lab psu

<img width=200px height=200px src=labpsu2.png />

## [MacBookCooler](MacBookCooler.scad)

Successor to MacBookMount
Externally water cools your MacBook (if you made it uncompliant)

<img width=200px height=200px src=MacBookCooler.png />

## [PCFoot](PCFoot.scad)

feet for my pc, LEL

<img width=200px height=200px src=PCFoot.png />

## [SimpleMonsterCooler](SimpleMonsterCooler.scad)



<img width=200px height=200px src=SimpleMonsterCooler.png />

## [UsbHolder](UsbHolder.scad)

A mounting bracket for everything you can think of,
but mainly an Anker PowerPort.

<img width=200px height=200px src=UsbHolder.png />

## [dc-power-strip](dc-power-strip.scad)

A power strip consisting of three Neutrik powerCON TRUE1 (TOP) connectors
and a (currently unused) switch.

<img width=200px height=200px src=dc-power-strip.png />

## [microscope](microscope.scad)

a microscope for your phone

<img width=200px height=200px src=microscope.png />

## [nd](nd.scad)

Nail lamp/dryer using a custom PCB that will be published at some point

<img width=200px height=200px src=nd.png />

## [oldintelbackplate](oldintelbackplate.scad)

a backplate for older intel sockets (75²)

<img width=200px height=200px src=oldintelbackplate.png />

## [scopeshelf](scopeshelf.scad)



<img width=200px height=200px src=scopeshelf.png />

## [shitduct](shitduct.scad)

a shitty duct to attach a hose to a window

<img width=200px height=200px src=shitduct.png />

## [solderingstation](solderingstation.scad)

A way of mounting soldering irons,
assuming you have metal brackets.

<img width=200px height=200px src=solderingstation.png />

## [SpoolHolder](SpoolHolder.scad)

A spool holder (for filament spools that don't have filament on them).

Designed by babaEX.

<img width=200px height=200px src=SpoolHolder.png />

## [spoolholder2](spoolholder2.scad)

holds smol spools (designed for electrical tape)

<img width=200px height=200px src=spoolholder2.png />

## [testbench](testbench.scad)

A PC test bench that supports ATX, Micro-ATX, DTX, Mini-ITX and probably many more.

### Ingredients

- IM3×<7.5
- AM3×≥90 Spacers
- CM3 (8 < l < 12 should be a good idea, depending on your spacers)
- SM3×≤10 (depending on your mainboard and pcie slot thicknesses)

<img width=200px height=200px src=testbench.png />

## [usbcharger](usbcharger.scad)

### Ingredients

- n×charging module (2×[USB-PD module](https://aliexpress.com/item/4000186077208.html) in the given version)
- m×wood screw M3×h (2~6×wood screw M3×>20)

<img width=200px height=200px src=usbcharger.png />

## [variachandle](variachandle.scad)

I felt my variac could use some handles, so I printed some.

### Ingredients

- [a variac](https://eur.vevor.com/variable-transformer-c_10755/variable-transformer-2000va-power-supply-voltage-transformer-converter-220v-p_010539394485) (buy it from somewhere else for cheaper)
- 4×SM4×16
- 4×WM4

<img width=200px height=200px src=variachandle.png />

## [weldingstation](weldingstation.scad)

A welding station consisting of four KYOCERA AVX SCCY68B407SSB capacitors
in series and two 0AWG with M8 end...shoe...things
This is probably the worst best way of welding.

<img width=200px height=200px src=weldingstation.png />
