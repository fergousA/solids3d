#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 10pt)
#let P = orthographic(5, 4, 3)
#let cube = "v 0 0 0\nv 1 0 0\nv 1 1 0\nv 0 1 0\nv 0 0 1\nv 1 0 1\nv 1 1 1\nv 0 1 1\ng bottom\nf 1 4 3 2\ng top\nf 5 6 7 8\ng sides\nf 1 2 6 5\nf 2 3 7 6\nf 3 4 8 7\nf 4 1 5 8\n"
#picture(size: 5cm, projection: P, zsort: "global",
  draw(surface(plane((3, 0, 0), (0, 3, 0), (-1.5, -1.5, 0))), withopacity(lightgray, 0.9)),
  draw(apply(shift(-0.9, 0.2, 0), unithemisphere), withopacity(palecyan, 0.9)),
  draw(apply(shift(0.3, -0.9, 0), obj(cube, colors: (top: palered, bottom: palered, sides: paleyellow))), meshpen: black),
)
#picture(size: 5cm, projection: P,
  draw(surface(plane((3, 0, 0), (0, 3, 0), (-1.5, -1.5, 0))), withopacity(lightgray, 0.9)),
  draw(apply(shift(-0.9, 0.2, 0), unithemisphere), withopacity(palecyan, 0.9)),
  draw(apply(shift(0.3, -0.9, 0), obj(cube, colors: (top: palered, bottom: palered, sides: paleyellow))), meshpen: black),
)
