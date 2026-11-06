#!/bin/bash
# Renderiza os 120 frames da cena (8s a 15 fps) com Chrome headless.
set -e
cd "$(dirname "$0")"
CHROME=$(find chrome -name chrome -type f -path "*chrome-linux64*" | head -1)
if [ -z "$CHROME" ]; then echo "Chrome não encontrado. Rode: npx -y @puppeteer/browsers install chrome@stable"; exit 1; fi
mkdir -p frames
for i in $(seq 0 119); do
  t=$(awk "BEGIN { printf \"%.3f\", $i / 15 }")
  f=$(printf "frames/f%03d.png" $i)
  if [ ! -f "$f" ]; then
    "$CHROME" --headless=new --no-sandbox --disable-gpu \
      --use-angle=swiftshader --enable-unsafe-swiftshader \
      --hide-scrollbars --window-size=720,1280 \
      --screenshot="$f" "file://$PWD/cena.html?t=$t" >/dev/null 2>&1
  fi
done
echo RENDER-DONE
