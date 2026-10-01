#!/usr/bin/env python3
"""Build the solids3d manual as ONE pdf.

Typst keeps every figure in memory until the end of a compilation; the manual has
about a hundred figures, so it is compiled chapter by chapter (docs/manual.typ
--input part=...) and the pieces are merged with pypdf (bookmarks included), then
the page numbers are stamped.   pip install pypdf

usage:  python3 docs/build-manual.py LANG(en|fr) NS(preview|local) OUT.pdf
"""
import json, os, subprocess, sys, tempfile
from pypdf import PdfReader, PdfWriter

lang, ns, out = sys.argv[1:4]
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PARTS = ["part1", "ref-fig", "ref-solids", "ref-paths", "ref-view", "ref-styles",
         "ref-ornaments", "ref-edu", "part3"]
tmp = tempfile.mkdtemp(prefix="s3man-")

def typst(dst, *inputs):
    cmd = ["typst", "compile", "--root", ROOT, "--input", f"lang={lang}", "--input", f"ns={ns}"]
    for kv in inputs:
        cmd += ["--input", kv]
    cmd += [os.path.join(ROOT, "docs", "manual.typ"), dst]
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0:
        sys.exit(r.stderr)

def flat(reader, items=None, level=1, acc=None):
    acc = [] if acc is None else acc
    for it in (reader.outline if items is None else items):
        if isinstance(it, list):
            flat(reader, it, level + 1, acc)
        else:
            acc.append((level, it.title, reader.get_destination_page_number(it)))
    return acc

FRONT = 3
readers, toc, start = [], [], FRONT + 1
for p in PARTS:
    f = os.path.join(tmp, p + ".pdf")
    print("  chapter", p, flush=True)
    typst(f, f"part={p}")
    r = PdfReader(f)
    readers.append((p, r, start))
    for (lv, title, pg) in flat(r):
        toc.append([lv, title, start + pg])
    start += len(r.pages)
total = start - 1

tocfile = os.path.join(ROOT, "docs", "_toc.json")
json.dump(toc, open(tocfile, "w"), ensure_ascii=False)
try:
    ff = os.path.join(tmp, "front.pdf")
    typst(ff, "part=front", "toc=/docs/_toc.json")
finally:
    os.remove(tocfile)
rf = PdfReader(ff)
assert len(rf.pages) == FRONT, f"front matter has {len(rf.pages)} pages, expected {FRONT}"

w = PdfWriter()
w.append(rf)
for p, r, s in readers:
    w.append(r, import_outline=True)
w.add_metadata({"/Title": f"solids3d — manual ({lang})", "/Author": "FERGOUS Abdelhak"})

sf = os.path.join(tmp, "stamp.pdf")
typst(sf, "part=stamp", f"n={total}")
st = PdfReader(sf)
for i, page in enumerate(w.pages):
    page.merge_page(st.pages[i])
w.write(out)
print("wrote", out, total, "pages")
