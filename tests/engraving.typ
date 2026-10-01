#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 4pt)
#let L = light((-1, 0.9, 1.1))
#let P = orthographic(5, 4, 3)
#picture(size: 5cm, projection: P, style: "engraving", light: L, engraved(sphere((0, 0, 0), 1)))
#picture(size: 5cm, projection: P, style: "engraving", engraving: engraving(wave: (amplitude: 0.4pt, length: 10pt), angle: 20, spacing: 2.6pt, cross: false), light: L,
  engraved(torus(1, 0.38)))
#picture(size: 5cm, projection: P, style: "engraving", engraving: engraving(paper: white, ink: rgb("#1b3a6b")), light: L,
  engraved(cone((0, 0, 0), 1, 1.6, Z, 1), edges: linewidth(0.4)), engraved(cylinder((2.2, 0, 0), 0.7, 1.2, Z, 1)))
