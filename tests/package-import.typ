// Check the package-style public entrypoint and grouped module aliases.
#import "@preview/solids3d:0.4.0": three, college, graph3mod
#set page(width: auto, height: auto, margin: 6pt)
#let tetra = college.regular-tetrahedron(radius: 1)
#three.picture(
  width: 5cm,
  projection: three.orthographic(5, 4, 3),
  three.draw(tetra, three.withopacity(three.paleblue, 0.75)),
)
#graph3mod.graph3-plot(t => (t, t * t, t), -1, 1, n: 16, axes: false, size: 4cm)
