#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 10pt)
#let P = orthographic(5, 4, 3)
#picture(size: 5cm, projection: P, light: White,
      draw(apply(shift(-1.2, 0, 0), unitsphere), material(diffuse: red, specular: white, shininess: 0.9)),
      draw(apply(shift(1.2, 0, 0), unitsphere), material(diffuse: royalblue, emissive: rgbf(0.1, 0.1, 0.3))),
      draw(apply(shift(0, 0, -1.4), apply(scale3(2.5), unitdisk)), withopacity(palegreen, 0.9), nolight),
)
#picture(size: 5cm, projection: P,
      draw(apply(shift(-1.2, 0, 0), unitsphere), material(diffuse: red, specular: white, shininess: 0.9)),
      draw(apply(shift(1.2, 0, 0), unitsphere), material(diffuse: royalblue, emissive: rgbf(0.1, 0.1, 0.3))),
      draw(apply(shift(0, 0, -1.4), apply(scale3(2.5), unitdisk)), withopacity(palegreen, 0.9), nolight),
)
