#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 10pt)
// fig_cb02: annulus extruded
#let p = (reverse(unitcircle3), apply(scale3(0.5), unitcircle3))
#picture(size: 6cm, projection: perspective(camera: (4, 4, 7), up: Z),
  limits(O, (1.5, 1.5, 2)),
  draw(surface(p, planar: true), red),
  draw(surface(apply(shift(Z), p), planar: true), red),
  draw(extrude(reverse(unitcircle3), Z), lightgray),
  draw(extrude(apply(scale3(0.5), unitcircle3), Z), lightgray),
  xaxis3($x$, Arrow3), yaxis3($y$, Arrow3), zaxis3($z$, Arrow3),
)
// fig_bb01 cone sections with labelled dimension arrows
#{
  let (r, h, s, sr) = (4.0, 10.0, 8.0, 5.0)
  let x = r * s / h
  let xr = r * sr / h
  let (s1, s2) = (sr - 0.1, sr + 0.2)
  let (x1, x2) = (r * s1 / h, r * s2 / h)
  let a = revolution(line3(O, (x, 0, s)), Z)
  let b = revolution(line3((x, 0, s), (r, 0, h)), Z)
  let w = revolution(line3((x1, 0, s1), (x2, 0, s2), (0, 0, s2)), Z)
  picture(width: 7.5cm, projection: orthographic(0, -30, 5),
    draw(surface(a, 4), withopacity(lightblue, 0.5)),
    draw(surface(b), withopacity(white, 0.5)),
    draw(line3((-r - 1, 0, 0), (r + 1, 0, 0))),
    draw(line3(O, (0, 0, h + 1)), dashed),
    draw(surface(w), withopacity(blue, 0.5)),
    draw(circle3((0, 0, s2), x2)), draw(circle3((0, 0, s1), x1)),
    draw($x$, line3((xr, 0, 0), (xr, 0, sr)), red, Arrow3),
    draw($r$, line3((0, 0, sr), (xr, 0, sr)), N, red),
    draw([4], line3((0, 0, h), (r, 0, h)), N, red),
    draw([10], line3((r, 0, 0), (r, 0, h)), red, Arrow3),
    draw([8], line3((-x, 0, 0), (-x, 0, s)), W, red, Arrow3),
  )
}
#picture(size: 5cm, projection: orthographic(0, 10, 5), light: light(paleyellow, (5, -5, 10), (0, 0, -10)),
  draw(sphere(1, n: 8 * nslice), m: 10, frontpen: blue + 0.8pt, backpen: pen(linetype("8 0"), blue, 0.8pt), longitudinalpen: nullpen),
  draw(surface(sphere(1, n: 4 * nslice), n: 24), withopacity(palegreen, 0.9)),
)
