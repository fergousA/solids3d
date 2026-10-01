#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 8pt)
#set text(font: "DejaVu Sans", lang: "ar", dir: rtl)
#let ltr-measure = text(dir: ltr)[$d = 3 "cm"$]
#picture(width: 6cm, projection: orthographic(5, 4, 3),
  draw(cuboid(length: 3, width: 2, height: 1.5), withopacity(paleblue, .7)),
  draw(line3(O, (3, 2, 1.5)), pen(gray(0.35), 0.5pt, dashed)),
  point3([A], O, align: SW),
  // RTL label with an explicitly isolated LTR math/unit fragment.
  dimension3([الطول = #ltr-measure], O, (3, 0, 0), offset: (0, -.4, 0), align: S, pen: blue),
  callout3([الرأس], (3, 2, 1.5), (4, 2, 2), align: W, pen: red),
)
