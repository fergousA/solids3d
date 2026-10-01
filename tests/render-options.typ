// Rendering options: shading (smooth / flat), silhouette refinement,
// backends (svg / typst), translucent groups, global z-sorting.
#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 5pt)

#let P = orthographic(6, 3, 2)
#let scene = (
  draw(surface(cylinder(O, 1, 2)), lightblue),
  draw(surface(sphere((0, 0, 3.2), 1)), withopacity(orange, 0.5)),
  draw(apply(shift(-2.6, 0.5, 0), unitcube), withopacity(blue, 0.6), orange),
  label($O$, O, align: SW),
)

#grid(columns: 3, gutter: 6pt,
  picture(width: 4cm, projection: P, ..scene),
  picture(width: 4cm, projection: P, shading: "flat", ..scene),
  picture(width: 4cm, projection: P, refine: false, ..scene),
  picture(width: 4cm, projection: P, backend: "typst", ..scene),
  picture(width: 4cm, projection: P, backend: "typst", shading: "flat", refine: false, ..scene),
  picture(width: 4cm, projection: P, zsort: "global", ..scene),
  picture(width: 4cm, projection: perspective(8, 4, 3), ..scene),
  picture(width: 4cm, projection: perspective(8, 4, 3), light: White, draw(surface(sphere(O, 1)), red)),
  picture(width: 4cm, projection: P, light: nolight, draw(surface(sphere(O, 1)), withopacity(red, 0.4)), draw(silhouette(sphere(O, 1)), black)),
)
