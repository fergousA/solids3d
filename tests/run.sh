#!/bin/sh
# Compile every test file (from the package root):  sh tests/run.sh
set -u
cd "$(dirname "$0")/.." || exit 1
OUT="$(mktemp -d "${TMPDIR:-/tmp}/solids3d-tests.XXXXXX")"
trap 'rm -rf "$OUT"' EXIT HUP INT TERM
status=0
for f in tests/*.typ; do
  printf '%s ... ' "$f"
  if typst compile --root . "$f" "$OUT/$(basename "$f" .typ).pdf"; then
    echo ok
  else
    echo FAILED
    status=1
  fi
done
exit "$status"
