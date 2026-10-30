#!/bin/zsh
# BayasBooth — mod kiosk + cetak terus (tanpa dialog) untuk macOS
# Dwiklik fail ini. Untuk keluar: Cmd+Q
DIR="$(cd "$(dirname "$0")" && pwd)"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ ! -x "$CHROME" ]; then echo "Google Chrome tidak dijumpai di /Applications"; read; exit 1; fi
pkill -f "BayasBoothProfile" 2>/dev/null; sleep 1
"$CHROME" --kiosk --kiosk-printing \
  --user-data-dir="$HOME/.BayasBoothProfile" \
  --autoplay-policy=no-user-gesture-required \
  --disable-features=Translate --no-first-run \
  "file://$DIR/index.html#booth" >/dev/null 2>&1 &
