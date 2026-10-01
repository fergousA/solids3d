// Simple API: fig(), paint(), cube(), brick(), brace3(), view names and styles.
#import "../lib.typ": *

#let views = ("iso", "front", "back", "side", "left", "top", "bottom", "low", "high", (30, 40))
#for v in views { fig(cone(1, 1.5), size: 2cm, view: v) }
#fig(sphere(1), cylinder(0.5, 1.2, c: (2, 0, 0)), cone(0.5, 1, c: (-2, 0, 0)), torus(0.8, 0.25, c: (0, 2, 0)), size: 4cm)
#fig(paint(sphere(1), orange), cube(1, c: (2, 0, 0.5)), brick(1, 2, 1, c: (-2, 0, 0.5)), size: 4cm, persp: true)
#for st in ("shaded", "engraving", "banknote", "etching", "vintage", "pencil") { fig(torus(1, 0.4), size: 2.4cm, style: st) }
#fig(trefoil(), size: 3cm)
#fig(figure-eight(), size: 3cm, knot-style: "gap", tube: 8pt)
#fig(hopf-link(), size: 3cm)
#fig(..borromean(), size: 3cm)
#fig(torus-knot(2, 5), size: 3cm, view: "top")
#fig(cone(1, 1.8), brace3((0, 0, 0), (0, 0, 1.8), $h$), brace3((-1, 0, 0), (1, 0, 0), $2r$, flip: true), size: 4cm)
#fig(brick(3, 2, 1.4), brace3((-1.5, 1, -0.7), (1.5, 1, -0.7), $a$, kind: "paren", outside: false, distance: 10pt), size: 4cm)
#fig(sphere(1), draw(circle3(O, 1, normal: X), linewidth(1pt)), size: 3cm)
#fig(sphere(1), size: 3cm, view: view-projection((10, 20), persp: true))
