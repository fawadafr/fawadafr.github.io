#!/bin/bash
#
# Local Asset Optimization Script
# Mirrors GitHub Actions optimization pipeline for local testing
#
# Usage: ./scripts/optimize-assets.sh
#

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "LOCAL ASSET OPTIMIZATION"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if _site exists
if [ ! -d "_site" ]; then
  echo "❌ Error: _site directory not found"
  echo "   Run 'bundle exec jekyll build' first"
  exit 1
fi

# Check for required tools
echo "Checking for required tools..."
command -v csso >/dev/null 2>&1 || { echo "❌ csso-cli not installed. Run: npm install -g csso-cli"; exit 1; }
command -v html-minifier >/dev/null 2>&1 || { echo "❌ html-minifier-terser not installed. Run: npm install -g html-minifier-terser"; exit 1; }
command -v cwebp >/dev/null 2>&1 || { echo "⚠️  webp not installed. Skipping WebP conversion. Install: brew install webp (macOS) or apt-get install webp (Linux)"; }
command -v mogrify >/dev/null 2>&1 || { echo "⚠️  ImageMagick not installed. Skipping image optimization. Install: brew install imagemagick (macOS) or apt-get install imagemagick (Linux)"; }
echo "✓ Required tools checked"
echo ""

# Get initial size
INITIAL_SIZE=$(du -sh _site | cut -f1)
echo "Initial site size: $INITIAL_SIZE"
echo ""

# Optimize CSS
echo "Optimizing CSS files..."
CSS_COUNT=0
find _site -name "*.css" -type f | while read file; do
  echo "  Minifying: $file"
  csso "$file" --output "$file"
  CSS_COUNT=$((CSS_COUNT + 1))
done
echo "✓ CSS optimization complete"
echo ""

# Optimize HTML
echo "Optimizing HTML files..."
HTML_COUNT=0
find _site -name "*.html" -type f | while read file; do
  echo "  Minifying: $file"
  html-minifier-terser \
    --collapse-whitespace \
    --remove-comments \
    --remove-optional-tags \
    --remove-redundant-attributes \
    --remove-script-type-attributes \
    --remove-tag-whitespace \
    --use-short-doctype \
    --minify-css true \
    --minify-js true \
    "$file" -o "$file" 2>/dev/null
  HTML_COUNT=$((HTML_COUNT + 1))
done
echo "✓ HTML optimization complete"
echo ""

# Convert to WebP (if cwebp is available)
if command -v cwebp >/dev/null 2>&1; then
  echo "Converting images to WebP..."
  WEBP_COUNT=0
  find _site -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | while read img; do
    if [ -f "$img" ]; then
      webp_img="${img%.*}.webp"
      echo "  Converting: $(basename $img) -> $(basename $webp_img)"
      cwebp -q 85 "$img" -o "$webp_img" 2>/dev/null || true
      WEBP_COUNT=$((WEBP_COUNT + 1))
    fi
  done
  echo "✓ WebP conversion complete"
  echo ""
fi

# Optimize original images (if mogrify is available)
if command -v mogrify >/dev/null 2>&1; then
  echo "Optimizing original images..."
  find _site -type f \( -name "*.jpg" -o -name "*.jpeg" \) -exec mogrify -strip -quality 85 {} \; 2>/dev/null
  find _site -type f -name "*.png" -exec mogrify -strip {} \; 2>/dev/null
  echo "✓ Image optimization complete"
  echo ""
fi

# Get final size
FINAL_SIZE=$(du -sh _site | cut -f1)

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "OPTIMIZATION COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "CSS files minified: $(find _site -name "*.css" | wc -l | tr -d ' ')"
echo "HTML files minified: $(find _site -name "*.html" | wc -l | tr -d ' ')"
echo "WebP images created: $(find _site -name "*.webp" | wc -l | tr -d ' ')"
echo ""
echo "Initial size: $INITIAL_SIZE"
echo "Final size:   $FINAL_SIZE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✓ Assets optimized successfully!"
echo "  Preview optimized site: bundle exec jekyll serve --skip-initial-build"
