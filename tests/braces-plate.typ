#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 4pt)
#plate(title: "Essai", subtitle: "sous-titre", number: "II", caption: [Légende], width: 9cm,
  picture(size: 5cm, projection: orthographic(5, 3, 3), light: light((-1, 1, 1)),
    draw(box3((0, 0, 0), (3, 2, 1.4)), black),
    brace3((0, 0, 0), (3, 0, 0), offset: (0, -0.15, 0), label: $3$, flip: true),
    brace3((3, 0, 0), (3, 2, 0), offset: (0.15, 0, 0), kind: "paren", label: $2$, flip: true),
    brace3((3, 2, 0), (3, 2, 1.4), offset: (0.15, 0.15, 0), label: $h$)))
#plate(border: false, ornament: false, [sans cadre])
