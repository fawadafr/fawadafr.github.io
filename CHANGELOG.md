# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

**Note:** This changelog tracks development features, infrastructure changes, and site functionality. Content updates (blog posts, speaking engagements, data files) are tracked via RSS feeds.

## [Unreleased]

## [1.0.0] - 2025-11-15

### Added
- **Progressive Web App (PWA) Support**
  - PWA manifest with app metadata, icons, and shortcuts
  - Service Worker with offline-first caching strategy
  - Install prompt with floating install button
  - 8 icon sizes (72px to 512px) generated from SVG source
  - Cache updates every hour for static assets

- **Client-Side Search Functionality**
  - lunr.js search engine with real-time results
  - Search overlay UI with keyboard shortcuts (press `/` to focus)
  - Indexed content: blog posts, pages, data files
  - Configurable field boost values

- **Theme Toggle (Light/Dark Mode)**
  - Automatic system preference detection via `prefers-color-scheme`
  - User preference persistence with localStorage
  - Sun/moon toggle icon in header
  - Smooth color transitions on theme switch

- **Related Posts System**
  - Latent Semantic Indexing (LSI) via classifier-reborn
  - Configurable post count (default: 3)
  - Chronological fallback when LSI disabled
  - Analytics tracking for related post clicks

- **Asset Optimization Pipeline**
  - Automated CSS minification via csso-cli (~30-40% reduction)
  - Automated HTML minification via html-minifier-terser (~15-25% reduction)
  - Non-fatal error handling (won't block deployment)
  - Local testing script: `scripts/optimize-assets.sh`

- **Comprehensive Documentation Suite**
  - User Manual: Feature documentation, deployment, troubleshooting
  - Customization Guide: Design system, CSS architecture, styling
  - PRD Implementation Report: Feature status and technical details
  - Editorial Calendar: Content planning and publishing schedule
  - CLAUDE.md: Project overview and quick reference for Claude Code

- **Analytics & Tracking**
  - Google Analytics 4 integration (GA4)
  - Custom event tracking: contact clicks, social clicks, outbound links, related post clicks, PWA events
  - Page view and session tracking

- **SEO & Structured Data**
  - Schema.org JSON-LD for Person and Article types
  - BreadcrumbList schema for navigation
  - Open Graph and Twitter Card meta tags
  - Generic social sharing image placeholder

- **GitHub Actions Deployment**
  - Automated build and deploy on push to main
  - Asset optimization in CI/CD pipeline
  - Custom domain support (lab.fawad.ai)
  - Email notifications for build failures

### Changed
- Migrated to custom theme (no remote theme dependency)
- Organized CSS using SMACSS methodology (base, layouts, components)
- Implemented fluid typography system with clamp() functions
- Updated design tokens with CSS custom properties

### Fixed
- HTML minification made less aggressive and non-fatal
- Corrected HTML minification command syntax in build pipeline
- Service Worker caching strategy optimized for offline support

### Infrastructure
- Jekyll 3.10.0 with github-pages gem
- Ruby 3.x compatible
- Node.js dependencies for asset optimization
- PWA icon generation script

---

## Version History

### Versioning Strategy

This project uses date-based versioning for major releases:
- **Major release** (X.0.0): Significant new features or breaking changes
- **Minor release** (X.Y.0): New features without breaking changes
- **Patch release** (X.Y.Z): Bug fixes and minor improvements

### How to Update This Changelog

When making changes to the project:

1. Add changes under `[Unreleased]` section
2. Use these categories:
   - `Added` for new features
   - `Changed` for changes in existing functionality
   - `Deprecated` for soon-to-be removed features
   - `Removed` for removed features
   - `Fixed` for bug fixes
   - `Security` for security-related changes
   - `Infrastructure` for build/deployment changes

3. When releasing, move unreleased changes to a new version section
4. Update the version number in this file and relevant project files

### Example Entry Format

```markdown
## [Unreleased]

### Added
- New search filter for tags and categories

### Fixed
- Theme toggle not persisting on Safari

## [1.1.0] - 2025-12-01

### Added
- Newsletter subscription form
- RSS feed for speaking engagements
```

---

## Links

- [Repository](https://github.com/fawadafr/fawadafr.github.io)
- [Live Site](https://lab.fawad.ai)
- [Issues](https://github.com/fawadafr/fawadafr.github.io/issues)
- [User Manual](docs/user-manual.md)
- [Customization Guide](docs/customization-guide.md)
