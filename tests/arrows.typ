#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 10pt)
#let P = orthographic(5, 4, 3)
#picture(size: 5cm, projection: P,
  limits(O, (1, 1, 1)),
  draw(unitcone, withopacity(palegreen, 0.7)),
  draw(cone(O, 1, 1, Z, 1), black),
  xaxis3($x$, Arrow3), yaxis3($y$, Arrow3), zaxis3($z$, Arrow3),
)
#picture(size: 5cm, projection: P,
  draw(Label($x$, align: N), line3(O, vmul(1.4, X)), red, Arrow3),
  draw(Label($y$, align: N), line3(O, vmul(1.4, Y)), green + 1pt, Arrow3),
  draw(Label($z$, align: E), line3(O, vmul(1.4, Z)), blue, Arrow),
  draw(Arc3(O, vmul(0.7, X), vmul(0.7, Y), normal: Z, n: 8), black, Arrows3),
)
