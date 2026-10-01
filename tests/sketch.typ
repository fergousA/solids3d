#import "../lib.typ": *

#set page(width: 8cm, height: 5cm, margin: 4pt)

#let a = sketch-random(seed: 17, index: 4)
#let b = sketch-random(seed: 17, index: 4)
#assert.eq(a, b)
#assert(sketch-noise(0.25, y: 0.75, seed: 17) >= 0)
#assert(sketch-noise(0.25, y: 0.75, seed: 17) <= 1)

#let scene = ctx => {
  (
    (ctx.rect)((0, 0), (100, 100), fill: vintage-paper, stroke: none),
    (ctx.line)((5, 5), (95, 95), stroke: vintage-ink, width: 0.8),
    (ctx.circle)((50, 50), 12, fill: none, stroke: vintage-ink, width: 0.8),
  )
}

#sketch(width: 7cm, height: 4cm, seed: 17, draw: scene)
#text[Static sketch API: ok]
