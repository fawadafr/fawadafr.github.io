#!/bin/bash
#
# PWA Icon Generator
# Generates PNG icons from SVG source at all required sizes
#
# Usage: ./scripts/generate-pwa-icons.sh
#

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "PWA ICON GENERATOR"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check for ImageMagick
if ! command -v convert >/dev/null 2>&1; then
  echo "❌ ImageMagick not installed"
  echo "   Install: brew install imagemagick (macOS) or apt-get install imagemagick (Linux)"
  exit 1
fi

SOURCE_SVG="assets/icons/icon.svg"
OUTPUT_DIR="assets/icons"

if [ ! -f "$SOURCE_SVG" ]; then
  echo "❌ Source SVG not found: $SOURCE_SVG"
  exit 1
fi

echo "Source: $SOURCE_SVG"
echo "Output: $OUTPUT_DIR"
echo ""

# PWA icon sizes (as per Web App Manifest spec)
SIZES=(72 96 128 144 152 192 384 512)

echo "Generating icons..."
for size in "${SIZES[@]}"; do
  output_file="$OUTPUT_DIR/icon-${size}x${size}.png"
  echo "  Creating ${size}x${size}..."
  convert -background none -resize "${size}x${size}" "$SOURCE_SVG" "$output_file"
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "ICON GENERATION COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Generated ${#SIZES[@]} icon sizes"
ls -lh "$OUTPUT_DIR"/*.png | awk '{print "  " $9 " - " $5}'
echo ""
echo "✓ PWA icons ready for deployment!"
