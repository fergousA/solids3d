#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 8pt)

#let P = orthographic(5, 4, 3)
#let wave = surface-grid(
  (u, v) => (u, v, 0.22 * calc.sin(2 * u) * calc.cos(2 * v)),
  -1.5, 1.5, -1.5, 1.5,
  nu: 12, nv: 12,
)
#let hf = heightfield((x, y) => 0.18 * (x * x - y * y), -1, 1, -1, 1, nx: 8, ny: 8)
#let vertices = ((0, 0, 0), (1, 0, 0), (1, 1, 0), (0, 1, 0), (0, 0, 1), (1, 0, 1), (1, 1, 1), (0, 1, 1))
#let faces = ((0, 1, 2, 3), (4, 7, 6, 5), (0, 4, 5, 1), (1, 5, 6, 2), (2, 6, 7, 3), (3, 7, 4, 0))
#let cube = surface-mesh(vertices, faces, smooth: false)
#let edges = mesh-edges(vertices, faces)
#let boundary-edges = mesh-edges(vertices, faces, boundary: true)
#let analytic = surface-grid((u, v) => (u, v, 0), 0, 1, 0, 1, nu: 2, nv: 2, normal: Z, color: red)
#let one-based = surface-mesh(vertices, ((1, 2, 3, 4),), indices: "one", normal: Z, color: orange)
#let periodic = surface-grid(
  (u, v) => ((1 + 0.25 * calc.cos(v)) * calc.cos(u), (1 + 0.25 * calc.cos(v)) * calc.sin(u), 0.25 * calc.sin(v)),
  0, 2 * calc.pi, 0, 2 * calc.pi, nu: 8, nv: 6, cyclic-u: true, cyclic-v: true,
)

#grid(columns: 3, gutter: 8pt,
  picture(width: 5cm, projection: P,
    draw(wave, withopacity(paleblue, 0.9), meshpen: pen(black, 0.25pt)),
  ),
  picture(width: 5cm, projection: P,
    draw(hf, withopacity(paleyellow, 0.9), meshpen: pen(black, 0.25pt)),
  ),
  picture(width: 5cm, projection: P,
    draw(cube, withopacity(palegreen, 0.85), orange),
    draw(edges, pen: black),
  ),
)
#repr(wave.patches.len()) #repr(cube.patches.len()) #repr(periodic.patches.len())
#repr(edges.len()) #repr(boundary-edges.len())
