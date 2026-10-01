#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 8pt)

#let P = orthographic(5, 4, 3)
#let spine = line3(
  (-1.5, 0, -0.5), (-0.8, 0.25, 0.4), (0, 0, 0),
  (0.8, -0.25, -0.4), (1.5, 0, 0.5),
)
#let capped = tube3(spine, width: 0.22, n: 10, caps: true, color: paleblue)
#let positional = tube(spine, 0.18, 8)
#assert(capped.kind == "surface")
#assert(positional.kind == "surface")
#assert(capped.patches.len() == 42)

#let loop = line3(
  (1, 0, 0), (0, 1, 0), (-1, 0, 0), (0, -1, 0), cyclic: true,
)
#let loop-tube = tube3(loop, width: 0.15, n: 8)
#assert(loop-tube.patches.len() == 32)

#let curve = spline3((-1, 0, 0), (0, 1, 1), (1, 0, 0))
#let curved-tube = tube3(curve, width: 0.12, n: 6, samples: 3)
#assert(curved-tube.patches.len() == 36)

#picture(size: 8cm, projection: P,
  draw(surface(capped), withopacity(paleblue, 0.75)),
  draw(surface(positional), withopacity(palegreen, 0.35)),
)
