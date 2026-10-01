#import "../lib.typ": *

#set page(width: 18cm, height: 12cm, margin: 5pt)
#let P = orthographic(6, 3, 2)
#let q = unitcube

// Explicit pens exercise the public pencil API without changing picture's
// ordinary default rendering.
#let pencil-scene = (
  draw(surface(q), meshpen: pencil-pen(paint: deepblue),
    stipple: vintage-stipple(count: 18, max-patch-count: 12, seed: 3, min-size: 0.010, max-size: 0.018)),
  pencil-draw(line3((0, 0, 0), (1, 1, 1)),
    pen: pencil-pen(paint: deepblue), arrow: Arrow3),
)

#grid(columns: 4, gutter: 4pt,
  picture(width: 4cm, projection: P, style: "pencil", ..pencil-scene),
  picture(width: 4cm, projection: P, style: "vintage",
    draw(surface(q), hatch: vintage-hatch(cross: true),
      stipple: vintage-stipple(count: 16, seed: 7))),
  vintage-picture(width: 4cm, projection: P,
    vintage-shaded(sphere(O, 1), hatch: vintage-hatch(),
      outline: (plain: true, paint: vintage-ink, thickness: 0.55pt)),
    draw(line3((0, 0, 0), (1, 1, 1)), pencil-pen()),
  ),
  pencil-picture(width: 4cm, projection: P, backend: "typst", ..pencil-scene),
)
