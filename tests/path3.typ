#import "../src/path3.typ": *
#let p = spline3(X, Y, vneg(X), vneg(Y), cyclic: true)
// circle through 4 points: control distance should be ~0.5523
#let d = vabs(vsub(p.post.at(0), X))
#repr(d) \
#repr(point(p, 0.5)) \
#repr(vabs(point(p, 0.5))) \
#repr(arclength(p)) (2pi = #repr(2*calc.pi)) \
#repr(reltime(p, 0.5)) \
#let q = line3(O, X, (1,1,0))
#repr(arclength(q)) #repr(point(q, 1.5)) #repr(dir(q, 1.5)) \
#let s = subpath(p, 0.5, 2.5)
#repr(s.nodes.len()) #repr(point(s, 0)) #repr(point(s, 2)) \
#let c = Circle3(O, 2, normal: Z, n: 8)
#repr(c.cyclic) #repr(c.nodes.len()) #repr(arclength(c)) \
#let a = Arc3(O, X, Y, normal: Z, n: 3)
#repr(a.nodes) \
#let g = guide3(O, "..", (1,1,0), "..", (2,0,0))
#repr(g.post) \
#repr(unitcircle3.nodes) #repr(unitcircle3.post.at(0)) \
#let t = graph3(u => (u, u*u, 0), 0, 1, n: 4, join: "..")
#repr(t.nodes.len()) #repr(arclength(t))
