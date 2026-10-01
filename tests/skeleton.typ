#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 10pt)
#let P = orthographic(5, 4, 3)
#grid(columns: 3, gutter: 12pt,
  // default sphere skeleton (12 transverse + 2 longitudinal) 
  picture(size: 5cm, projection: P,
    draw(sphere(O, 1), blue + 0.5pt),
  ),
  // silhouette + skeleton pieces
  {
    let b = sphere(O, 1)
    let s = skeleton(b, m: 1, P: P)
    picture(size: 5cm, projection: P,
      draw(surface(b), withopacity(paleblue, 0.5)),
      draw(silhouette(b, P: P), black + 1pt),
      draw(s.transverse.back, dashed), draw(s.transverse.front, red),
      draw(s.longitudinal.back, dashed), draw(s.longitudinal.front, green),
    )
  },
  // perspective sphere
  picture(size: 5cm, projection: perspective(5, 4, 3),
    draw(surface(sphere(O, 1)), withopacity(paleblue, 0.5)),
    draw(sphere(O, 1), m: 5, frontpen: blue, backpen: pen(blue, linetype("8 8")), longitudinalpen: nullpen),
    draw(silhouette(sphere(O, 1)), black + 1pt),
  ),
  // labelled axes drawn as paths with arrows
  {
    let a = 1.5
    picture(size: 5cm, projection: P,
      draw(surface(sphere(O, 1)), withopacity(paleblue, 0.5)),
      draw(Label($x$, align: N), line3(O, vmul(a, X)), red, Arrow3),
      draw(Label($y$, align: N), line3(O, vmul(a, Y)), green, Arrow3),
      draw(Label($z$, align: E), line3(O, vmul(a, Z)), blue, Arrow3),
      dot((vmul(a, X), vmul(a, Y), vmul(a, Z))),
      dot(Label($O$), O),
    )
  },
  // unitcone and unitcylinder with limits + axes
  picture(size: 5cm, projection: P,
    limits(O, (1, 1, 1)),
    draw(unitcone, withopacity(palegreen, 0.7)),
    draw(cone(O, 1, 1, Z, 1), black),
    xaxis3($x$, Arrow3), yaxis3($y$, Arrow3), zaxis3($z$, Arrow3),
  ),
  // cylinder scaled + hemisphere
  picture(size: 5cm, projection: P,
    draw(apply(zscale3(2), unitcylinder), withopacity(paleblue, 0.6)),
    draw(apply(shift(0, 0, 2), unithemisphere), withopacity(palered, 0.8)),
    draw(cylinder(O, 1, 2), black),
  ),
)
