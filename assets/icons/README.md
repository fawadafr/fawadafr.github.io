# PWA Icons

## Source Files

- `icon.svg` - Source SVG icon (512x512)

## Required PNG Sizes

The following PNG icons are needed for full PWA support:
- 72x72, 96x96, 128x128, 144x144, 152x152
- 192x192, 384x384, 512x512

## Generating Icons

### Method 1: Local Generation (requires ImageMagick)

```bash
./scripts/generate-pwa-icons.sh
```

### Method 2: Manual Generation

Use any SVG-to-PNG converter (e.g., Inkscape, GIMP, online tools) to export `icon.svg` at the required sizes.

### Method 3: Temporary SVG Fallback

Until PNG icons are generated, browsers will fall back to the SVG icon or default behavior.

## Icon Design

The icon features:
- Blue background (#2563EB - brand accent color)
- "FR" initials in Fira Code monospace font
- Subtle grid pattern for technical aesthetic
- White text (#FAFAFA) for contrast

## Testing

Test PWA icon display:
1. **Chrome DevTools:** Application > Manifest
2. **Mobile:** Add to home screen and check icon
3. **Lighthouse:** PWA audit checks for proper icons
