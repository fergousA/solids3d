#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 10pt)
#let P = orthographic(5, 4, 3)
#let s = sphere(O, 1)
#let moved-sphere = apply(shift(1, 2, 3), s)
#assert("geom" in moved-sphere)
#assert(moved-sphere.geom.center == (1.0, 2.0, 3.0))
#let moved-surface = apply(shift(1, 2, 3), surface(s))
#assert("geom" in moved-surface)
#assert(moved-surface.geom.center == (1.0, 2.0, 3.0))
#grid(columns: 3, gutter: 12pt,
  // sphere skeleton
  picture(size: 5cm, projection: P,
    draw(surface(sphere(O, 1)), withopacity(paleblue, 0.5)),
    draw(sphere(O, 1), m: 5, frontpen: blue, backpen: pen(blue, linetype("8 8")), longitudinalpen: nullpen),
  ),
  // cone
  {
    let (r, h) = (1, 2)
    let (pO, pS, pA) = (O, (0, 0, h), (r, 0, 0))
    let CoRev = cone(pO, r, h, Z, 1)
    picture(size: 5cm, projection: P,
      draw(surface(CoRev), withopacity(lightred, 0.5)),
      draw(CoRev, blue + 1pt),
      label($S$, pS, N),
      dot(Label($O$, align: SE), pO),
      draw((line3(pS, pO), line3(pO, pA)), dashed),
    )
  },
  // unitbox
  picture(size: 5cm, projection: P,
    draw(unitbox, blue),
    dot(unitbox, red),
    xaxis3(Label($(1,0,0)$, 1), Arrow3), yaxis3(Label($(0,1,0)$, 1), Arrow3), zaxis3(Label($(0,0,1)$, 1), Arrow3),
  ),
  // pyramid
  {
    let (A, B, C, D, S) = ((1, 0, 0), (0, 1, 0), (-1, 0, 0), (0, -1, 0), (0, 0, 1.5))
    let faces = (line3(A, B, S, cyclic: true), line3(B, C, S, cyclic: true), line3(C, D, S, cyclic: true), line3(D, A, S, cyclic: true), line3(A, B, C, D, cyclic: true))
    picture(size: 5cm, projection: P,
      draw(surface(faces), withopacity(palegreen, 0.6)),
      draw(faces, black),
      dot(Label($A$, align: S), A), dot(Label($B$, align: E), B), dot(Label($C$, align: W), C), dot(Label($D$, align: S), D), dot(Label($S$, align: N), S),
    )
  },
  // torus
  {
    let t = torus(2, 0.6, n: 16)
    picture(size: 5cm, projection: orthographic(6, 4, 3),
      draw(surface(t, n: 32), withopacity(paleyellow, 0.8)),
      draw(t, m: 0, n: 32, frontpen: black + 0.4pt, longitudinalpen: nullpen),
    )
  },
  // frustum + cylinder
  {
    let (r1, r2, h1, h2) = (1.0, 0.6, 1.0, 0.8)
    let p1 = line3(O, (r1, 0, 0), (r1, 0, h1), (r2, 0, h1))
    let p2 = line3((r2, 0, h1), (r2, 0, h1 + h2), (0, 0, h1 + h2))
    let (R1, R2) = (revolution(p1, Z), revolution(p2, Z))
    picture(size: 5cm, projection: P,
      draw(surface(R1), withopacity(palecyan, 0.7)),
      draw(surface(R2), withopacity(palered, 0.7)),
      draw(R1, black), draw(R2, black),
    )
  },
)
