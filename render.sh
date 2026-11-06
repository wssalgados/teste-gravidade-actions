#!/bin/bash
# Renderiza os 240 frames em paralelo (4 trabalhadores) — 30 fps.
set -e
cd "$(dirname "$0")"
CHROME=$(find chrome -name chrome -type f -path "*chrome-linux64*" | head -1)
mkdir -p frames
render_range() {
  local start=$1 end=$2
  for i in $(seq $start $end); do
    t=$(awk "BEGIN { printf \"%.3f\", $i / 30 }")
    f=$(printf "frames/f%03d.png" $i)
    if [ ! -f "$f" ]; then
      "$CHROME" --headless=new --no-sandbox --disable-gpu \
        --use-angle=swiftshader --enable-unsafe-swiftshader \
        --hide-scrollbars --window-size=720,1280 \
        --screenshot="$f" "file://$PWD/cena.html?t=$t" >/dev/null 2>&1
    fi
  done
}
render_range 0 59 & render_range 60 119 & render_range 120 179 & render_range 180 239 &
wait
echo RENDER-DONE
