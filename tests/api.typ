#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 5pt)
#let P = orthographic(5, 4, 3)
#picture(size: 5cm, projection: P,
  draw(Arc3-angles(O, 1, 90, 0, 90, 120, normal: Z, n: 6), red + 1pt, Arrows3),
  draw(arc3(O, X, Y, normal: Z), blue),
  draw(apply(reflect3(O, X, Z), line3(O, (0.5, 1, 0.5))), heavygreen),
  draw(surface(torus(1, 0.3, n: 8), n: 16), color-add(palered, white).transparentize(30%)),
  draw(graph3(t => (t, t * t, t * t * t), -1, 1, n: 20, join: ".."), pen(blue, 0.5pt, dashed)),
  label($A$, (1, 1, 1), pair-scale(2, E)),
  dot((1, 1, 1), red),
  draw(circle3((0, 0, 0.5), 0.5, normal: (1, 1, 1)), Dotted),
  draw(apply(compose(shift(0, 0, -1), scale3(0.3)), unitcube), lightgray, meshpen: black),
)
#repr(project((1, 2, 3), P: P)) \
#repr(length3(spline3(X, Y, Z))) #repr(arclength(unitcircle3))
