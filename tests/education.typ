#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 8pt)

#let A = O
#let B = (2, 0, 0)
#let C = (2, 1, 0)
#let D = (0, 1, 0)
#let E0 = (0, 0, 1.5)
#let S0 = (0, 0, 2)
#let p = cuboid(length: 2, width: 1, height: 1.5)
#let q = regular-pyramid(radius: 1, height: 2, n: 4)
#picture(width: 7cm, projection: orthographic(5, 4, 3),
  draw(p, withopacity(paleblue, 0.7)),
  draw(box3(A, (2, 1, 1.5)), black),
  point3($A$, A, align: SW), point3($B$, B, align: SE, dx: 2pt, dy: -1pt),
  vertex3($C$, C, align: NE, pen: red, dx: 0.08, dy: 0.05),
  dimension3([2 cm], A, B, offset: (0, -0.4, 0), align: S, pen: blue),
  // The dimension and arrow shaft may be dashed while the retained
  // attachments use an independent dotted pen.
  dimension3([style], A, B, offset: (0, -0.65, 0), align: S,
    pen: pen(blue, dashed), extension-pen: pen(red, dotted)),
  // With no offset lines, arrows start directly at the translated endpoints.
  dimension3([direct], A, B, offset: (0, -0.9, 0), align: S,
    pen: pen(green, dotted), extensions: false),
  // Oblique projected cote: the math/unit content must follow its line.
  dimension3($d = 2 "cm"$, B, (3, 1.4, 0), offset: (0, 0, -0.3), align: N, pen: green, dx: 0.1, dy: 0.04),
  segment-label3([AC], A, C, offset: (0, 0, -0.35), pen: blue),
  dimension3([1.5 cm], A, E0, offset: (-0.4, 0, 0), align: W, pen: blue),
  callout3([arête], B, (3, -0.5, 0.5), pen: red),
  edge-code3(A, B, count: 1, pen: red),
  equal-edges3(((A, B), (D, C)), count: 1, pen: red),
  draw(q, withopacity(palegreen, 0.7)),
  callout3([sommet], S0, (1.5, 0, 2.3), pen: red),
  right-angle3(B, A, E0, pen: blue),
  angle-mark3(B, A, C, radius: 0.24, pen: blue, label: [$alpha$], align: N),
)

// The same annotation options also go through the native Typst backend.
#picture(width: 7cm, projection: orthographic(5, 4, 3), backend: "typst",
  draw(line3(A, B), black),
  dimension3($2 "cm"$, A, B, offset: (0, -0.35, 0),
    pen: pen(blue, dashed), extension-pen: pen(red, dotted)),
  dimension3([direct], A, B, offset: (0, -0.62, 0),
    pen: pen(green, dotted), extensions: false),
  right-angle3(B, A, E0, pen: blue),
)
