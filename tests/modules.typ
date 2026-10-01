// Public Asymptote-inspired facade modules and additional collège builders.
#import "../three.typ": *
#import "../three-surface.typ": *
#import "../three-light.typ": *
#import "../graph3.typ": graph3-plot
#import "../college.typ": *
#import "../obj3.typ": obj
#set page(width: auto, height: auto, margin: 8pt)

#let P = orthographic(5, 4, 3)
#let v = cuboid-vertices(length: 3, width: 2, height: 1.5)
#let tetra = regular-tetrahedron(radius: 1)
#let octa = regular-octahedron(radius: 1)
#let frustum = frustum3(bottom-radius: 1, top-radius: 0.6, height: 1.5, n: 12)
#let prism = right-prism3(base: 2, width: 1, height: 1.5)

#grid(columns: 3, gutter: 8pt,
  picture(width: 5cm, projection: P,
    draw(tetra, withopacity(paleblue, 0.75)),
    diagonal3(v.A, v.G),
  ),
  picture(width: 5cm, projection: P,
    draw(octa, withopacity(palegreen, 0.75)),
    draw(cuboid-edges(v), black),
  ),
  picture(width: 5cm, projection: P,
    draw(frustum, withopacity(paleyellow, 0.8)),
    draw(prism, withopacity(palered, 0.5)),
  ),
)
#graph3-plot(t => (t, t * t, t * t * t), -1, 1, size: 5cm, n: 20)
#repr(material(diffuse: red, specular: white))
#repr(obj("v 0 0 0\nv 1 0 0\nv 0 1 0\nf 1 2 3\n"))
