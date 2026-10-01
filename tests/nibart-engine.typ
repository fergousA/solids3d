#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 4pt)
#let P = orthographic(5, 4, 3)
#let sc(e) = picture(size: 4cm, projection: P, style: "vintage", draw(sphere((0, 0, 0), 1), black), draw(cone((2.2, 0, 0), 0.6, 1.4, Z, 1), black))
#sc("nibart")
