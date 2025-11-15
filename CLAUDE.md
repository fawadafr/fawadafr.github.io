# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Documentation Reference

This file provides a quick reference for development. For comprehensive documentation:

- **[User Manual](docs/user-manual.md)** - Complete feature documentation, content authoring, deployment, and troubleshooting
- **[Customization Guide](docs/customization-guide.md)** - Design system, CSS architecture, styling, and theming
- **[Monitoring Guide](docs/monitoring-guide.md)** - Build quality metrics, monitoring dashboard, and quality tracking
- **[PRD Implementation Report](docs/prd-implementation-report.md)** - Feature implementation status and technical details
- **[Editorial Calendar](docs/editorial-calendar.md)** - Content planning and publishing schedule
- **[CHANGELOG](CHANGELOG.md)** - Development feature changelog and version history

## Project Overview

This is a Jekyll-based executive personal website for Fawad Rashidi, hosted on GitHub Pages. The site showcases executive leadership experience, thought leadership, speaking engagements, and board service readiness.

**Key Features:**
- Progressive Web App (PWA) with offline support
- Client-side search (lunr.js)
- Light/dark theme toggle
- Related posts (LSI)
- Automated asset optimization
- Google Analytics 4 tracking
- Data-driven content (board positions, certifications, media appearances)

## Development Commands

### Local Development
```bash
bundle install                    # Install dependencies
bundle exec jekyll serve          # Start local dev server at http://localhost:4000
bundle exec jekyll serve --drafts # Include draft posts in preview
bundle exec jekyll build --lsi    # Build with Latent Semantic Indexing for related posts
```

### Asset Optimization (Local Testing)
```bash
chmod +x scripts/optimize-assets.sh  # Make executable (first time only)
./scripts/optimize-assets.sh         # Test CSS/HTML optimization locally
```

### PWA Icon Generation
```bash
cd assets/icons
./scripts/generate-pwa-icons.sh  # Generate PNG icons from SVG source
```

### HTML Validation
```bash
npm install                       # Install validation dependencies (first time only)
npm run validate:html             # Validate HTML files in source (before Jekyll build)
npm run validate:html:site        # Validate HTML files in _site (after Jekyll build)
```

**Automatic Validation:**
- Pre-commit hook validates HTML before allowing commits
- GitHub Actions validates HTML during deployment
- Build fails if HTML syntax errors are detected

**Common Validation Errors:**
```bash
# ❌ Wrong: Malformed HTML comment
<\!-- Comment -->

# ✅ Correct: Valid HTML comment
<!-- Comment -->

# ❌ Wrong: Unclosed tag
<div>Content

# ✅ Correct: Properly closed tag
<div>Content</div>
```

### Build Quality Monitoring
```bash
npm run build:report                  # Generate build quality report (last 30 runs)
npm run build:report:detailed         # Detailed report (last 50 runs)
./scripts/build-quality-report.sh 100 # Custom number of runs
```

**Metrics Tracked:**
- Success/failure rates
- Trend analysis (recent vs. earlier builds)
- Recent failures with dates and IDs
- Recommendations based on success rate

**See:** [Monitoring Guide](docs/monitoring-guide.md) for comprehensive build quality tracking

### IDE Integration

**VS Code Configuration:**
- `.vscode/settings.json` - HTML validation, formatting, Jekyll support
- `.vscode/extensions.json` - Recommended extensions (html-validate, Jekyll syntax, etc.)
- `.vscode/tasks.json` - Quick commands (serve, build, validate)
- `.editorconfig` - Cross-editor code style consistency

**Recommended VS Code Extensions:**
- `html-validate.vscode-html-validate` - Real-time HTML validation
- `ginfuru.ginfuru-vscode-jekyll-syntax` - Jekyll/Liquid syntax support
- `yzhang.markdown-all-in-one` - Markdown editing

**Quick Commands (VS Code):**
- `Cmd+Shift+B` - Start Jekyll server
- `Cmd+Shift+P` → "Run Task" → Select task

### GitHub Pages Deployment
The site automatically deploys via GitHub Actions when changes are pushed to the `main` branch. No manual build commands required.

**Deployment includes:**
- Jekyll build
- HTML validation (html-validate, blocks deployment on errors)
- CSS minification (csso-cli, ~30-40% reduction)
- HTML minification (html-minifier-terser, ~15-25% reduction)
- Automatic publishing to https://lab.fawad.ai

## Site Architecture

### Core Configuration
- **_config.yml**: Central Jekyll configuration including site metadata, theme settings, navigation structure, social links, collections, and feature flags
- **Gemfile**: Uses `github-pages` gem to ensure local environment matches GitHub Pages production
- **manifest.json**: PWA manifest with app metadata, icons, and shortcuts
- **sw.js**: Service Worker for offline support and caching

### Content Structure

The site follows Jekyll conventions with content organized as:

1. **Root Pages** (`*.html`, `*.md`): Primary navigation pages
   - `index.html`: Executive overview landing page with hero section and data-driven content
   - `about.md`: Biography and professional background
   - `leadership-portfolio.md`: Signature engagements and recognition
   - `insights.md`: Curated list of insight briefings
   - `speaking.md`: Speaking engagement offerings
   - `contact.md`: Contact information and CTA

2. **Blog Posts** (`_posts/`): Long-form articles and commentary
   - File naming: `YYYY-MM-DD-title-slug.md`
   - Requires `layout: post`, `title`, and `excerpt` front matter
   - Automatically included in the site feed via `jekyll-feed` plugin
   - Indexed for search
   - Analyzed for related posts via LSI

3. **Drafts** (`_drafts/`): Work-in-progress posts
   - File naming: `title-slug.md` (no date prefix)
   - Not included in production builds
   - Preview locally with `--drafts` flag

4. **Speaking Collection** (`_speaking/`): Keynote and advisory offerings
   - Configured as a Jekyll collection in `_config.yml`
   - Each file requires `layout: page`, `title`, `subtitle`, and `summary` front matter
   - Output at `/speaking/:name/` permalink structure

5. **Data Files** (`_data/`): YAML files for structured content
   - `board-service.yml`: Advisory board positions
   - `certifications.yml`: Professional credentials
   - `media-appearances.yml`: Interviews, articles, podcasts, speaking

6. **Assets** (`assets/`): Custom styles, scripts, and resources
   - `main.scss`: SCSS entry point (imports all partials)
   - `js/`: JavaScript for search, theme toggle, etc.
   - `icons/`: PWA icons (SVG source + generated PNGs)
   - `images/`: Site images and Open Graph defaults

7. **Sass Partials** (`_sass/`): Modular CSS architecture (SMACSS)
   - `base/`: Typography, reset, utilities
   - `layouts/`: Page structure (header, footer, grid)
   - `components/`: Reusable UI components (cards, tags, hero, credentials)

### Theme & Plugins

- **Custom Theme**: No remote theme; custom SCSS/HTML templates
- **Plugins**:
  - `jekyll-feed`: Generates RSS feed for blog posts
  - `jekyll-seo-tag`: Adds SEO meta tags
  - `jekyll-paginate`: Pagination for blog listing (10 posts per page)
  - `classifier-reborn`: LSI for related posts

### Navigation

Navigation menu is controlled by the `header_pages` array in `_config.yml`. Pages are displayed in the order listed.

## Site Features

### Progressive Web App (PWA)

**Implementation:**
- **Manifest:** `manifest.json` with full app metadata
- **Service Worker:** `sw.js` with offline-first caching strategy
- **Install Prompt:** `_includes/pwa.html` with floating install button
- **Icons:** 8 sizes (72px to 512px) generated from `assets/icons/icon.svg`

**Caching Strategy:**
- Static assets (CSS, JS, images): Cache-first
- HTML pages: Network-first with cache fallback
- Cache updates every hour

**Testing:**
- Chrome DevTools → Application → Manifest
- Check Service Worker status and cache storage
- Test offline mode in Network tab

**See:** [User Manual - PWA Section](docs/user-manual.md#progressive-web-app-pwa) for installation instructions and troubleshooting

### Search Functionality

**Implementation:**
- **Engine:** lunr.js (client-side search)
- **Index:** Generated at build time from all posts and pages
- **UI:** Search overlay with real-time results
- **Keyboard:** Press `/` to focus search (desktop)

**Searchable Content:**
- Blog posts: title, excerpt, content, tags, categories
- Pages: title and content
- Data files: board positions, certifications, media appearances

**Customization:**
- Field boost values in `assets/js/search.js`
- Styling in `_sass/components/_search.scss`

**See:** [User Manual - Search Section](docs/user-manual.md#search-functionality)

### Theme Toggle (Light/Dark Mode)

**Implementation:**
- **Detection:** Automatic system preference detection via `prefers-color-scheme`
- **Persistence:** User choice saved to localStorage
- **Toggle:** Sun/moon icon in header
- **Transitions:** Smooth color transitions on theme switch

**Color Schemes:**
- Light: `--color-bg: #FAFAFA`, `--color-accent: #2563EB`
- Dark: `--color-bg: #0A0A0A`, `--color-accent: #60A5FA`

**See:** [Customization Guide - Theme Colors](docs/customization-guide.md#color-customization) for customizing theme colors

### Related Posts

**Implementation:**
- **Algorithm:** Latent Semantic Indexing (LSI) via `classifier-reborn`
- **Configuration:** `lsi: true` in `_config.yml`
- **Count:** Configurable via `related_posts_count` (default: 3)
- **Fallback:** Chronological if LSI disabled or insufficient matches

**Analytics:**
- Clicks tracked as `related_post_click` events in GA4
- Includes source and target post titles

**See:** [User Manual - Related Posts](docs/user-manual.md#related-posts)

### Pagination

**Configuration:**
- **Posts per page:** 10 (configurable in `_config.yml`)
- **URL structure:** `/blog/page:num/`
- **Navigation:** Automatic prev/next controls

**See:** [User Manual - Pagination](docs/user-manual.md#pagination)

### Asset Optimization

**Automated Pipeline (GitHub Actions):**
1. CSS minification via csso-cli (~30-40% reduction)
2. HTML minification via html-minifier-terser (~15-25% reduction)
3. Non-fatal errors (won't block deployment)

**Local Testing:**
```bash
./scripts/optimize-assets.sh
```

**See:** [User Manual - Asset Optimization](docs/user-manual.md#asset-optimization)

## Content Authoring Guidelines

### Blog Posts

Create new files in `_posts/` with format `YYYY-MM-DD-descriptive-title.md`:

```yaml
---
layout: post
title: "Your Post Title Here"
excerpt: "Brief description for previews and SEO"
date: 2025-11-15
categories: [technical-leadership, platform-engineering]
tags: [devops, platform, developer-experience]
---

Your content here...
```

**Front Matter Fields:**

| Field | Required | Description |
|-------|----------|-------------|
| `layout` | Yes | Use `post` |
| `title` | Yes | Post title (quoted if contains special chars) |
| `excerpt` | Yes | Brief description for previews/SEO |
| `date` | No | Override file date |
| `categories` | No | Array of categories |
| `tags` | No | Array of tags |

### Draft Posts & Scheduled Publishing

#### Working with Drafts

**Creating a Draft:**
1. Create a new file in the `_drafts/` folder
2. Use filename WITHOUT date prefix: `post-title-slug.md`
3. Include standard front matter (layout, title, excerpt, tags)

**Previewing Drafts Locally:**
```bash
bundle exec jekyll serve --drafts
```
This starts the dev server and includes draft posts at the top of the blog.

**Publishing a Draft:**
1. Move the file from `_drafts/` to `_posts/`
2. Add date prefix to filename: `YYYY-MM-DD-post-title-slug.md`
3. Commit and push to deploy

**Important:** Drafts are NEVER included in production builds on GitHub Pages. They only appear when using the `--drafts` flag locally.

#### Scheduled Publishing (Future-Dated Posts)

**Scheduling a Post:**
1. Create file in `_posts/` with a FUTURE date: `2026-01-15-future-post.md`
2. Jekyll is configured with `future: false` in `_config.yml`
3. The post will NOT appear in builds until after the date

**When Scheduled Posts Go Live:**
- GitHub Pages rebuilds on every push to the `main` branch
- Posts with future dates are excluded from the build
- After the scheduled date passes, the post appears on the next rebuild
- To trigger immediate publish: make any commit (even an empty one)

**Manual Trigger:**
```bash
# Create empty commit to trigger rebuild
git commit --allow-empty -m "Trigger rebuild for scheduled posts"
git push
```

#### Editorial Calendar

Content planning and scheduling is managed in `docs/editorial-calendar.md`:
- Track upcoming posts and publish dates
- Manage post status (draft, scheduled, published)
- Plan quarterly content themes
- Maintain backlog of content ideas

**See:** [Editorial Calendar](docs/editorial-calendar.md) for content workflow and publishing cadence

### Speaking Engagements

Create new files in `_speaking/` with a descriptive filename:

```yaml
---
layout: page
title: "Engagement Title"
subtitle: "Event or Context"
summary: "One-line description for listing pages"
---

Detailed description of the engagement...
```

### Jekyll Data Files

Data files in `_data/` allow you to separate content from presentation. They are automatically loaded by Jekyll and accessible via `site.data`.

#### Available Data Files

1. **Board Service** (`_data/board-service.yml`)
   - Advisory positions and board memberships
   - Rendered via `{% include board-positions.html %}`
   - Access via: `site.data.board-service.positions`

2. **Certifications** (`_data/certifications.yml`)
   - Professional certifications and credentials
   - Rendered via `{% include certifications.html %}`
   - Access via: `site.data.certifications.certifications`

3. **Media Appearances** (`_data/media-appearances.yml`)
   - Speaking engagements, interviews, articles, podcasts
   - Rendered via `{% include media-appearances.html %}`
   - Access via: `site.data.media-appearances.appearances`

#### Usage Example (Jekyll Templates)

```liquid
<!-- Display Board Positions -->
{% for position in site.data.board-service.positions %}
<article class="board-position-card">
  <h3 class="position-organization">{{ position.organization }}</h3>
  <span class="position-role">{{ position.role }}</span>
  <div class="position-tenure">
    <time>{{ position.start_date | date: "%b %Y" }}</time> —
    {% if position.end_date == "present" %}
      <span class="current">Present</span>
    {% else %}
      <time>{{ position.end_date | date: "%b %Y" }}</time>
    {% endif %}
  </div>
  <p class="position-description">{{ position.description }}</p>
  {% if position.url %}
    <a href="{{ position.url }}" class="position-link" target="_blank" rel="noopener">Learn more</a>
  {% endif %}
</article>
{% endfor %}
```

#### Adding New Data

**Board Positions:**
```yaml
- organization: "Company Name"
  role: "Board Member"
  start_date: "2024-01"
  end_date: "present"
  description: "Brief description"
  url: "https://example.com"
```

**Certifications:**
```yaml
- name: "Certification Name"
  issuer: "Issuing Organization"
  year: 2024
  credential_id: "CERT-XXXXX"
  verification_url: "https://verify.example.com"
  description: "Optional description"
```

**Media Appearances:**
```yaml
- title: "Article/Talk Title"
  publication: "Publication Name"
  date: "2024-01-15"
  url: "https://example.com"
  type: "interview"  # interview | article | podcast | conference | webinar
  description: "Optional description"
```

#### Data File Best Practices

- **Sort Order:** Most recent items first
- **Dates:** Use ISO format (YYYY-MM-DD or YYYY-MM)
- **URLs:** Always use https://
- **Indentation:** Use 2 spaces (YAML requirement)
- **Special Characters:** Quote strings with colons or special chars
- **Testing:** Run `bundle exec jekyll build` to validate YAML syntax

#### Common YAML Errors

```yaml
# ❌ Wrong: Unquoted string with colon
description: Title: Something

# ✅ Correct: Quote strings with special characters
description: "Title: Something"

# ❌ Wrong: Inconsistent indentation
positions:
    - organization: "Company"
   role: "Role"

# ✅ Correct: Consistent 2-space indentation
positions:
  - organization: "Company"
    role: "Role"
```

**See:** [User Manual - Data Files](docs/user-manual.md#managing-data-files) for detailed field reference and testing

### Styling

Custom styles are organized using SMACSS methodology:

**CSS Architecture:**
- **Base** (`_sass/base/`): Typography, reset, utilities
- **Layouts** (`_sass/layouts/`): Grid, header, footer, page structure
- **Components** (`_sass/components/`): Cards, tags, hero, credentials, search

**Design System:**
- **Typography:** Anthropic's fluid clamp() system (Fira Code monospace throughout)
- **Colors:** CSS custom properties for light/dark themes
- **Spacing:** Fluid grid with clamp() for responsive spacing
- **Components:** Modular, reusable UI patterns

**Quick Reference:**
```scss
// Design Tokens
--color-accent: #2563EB;           // Blue accent
--color-text-primary: #1A1A1A;     // Primary text
--text-display-xxl: clamp(3rem, 2.388rem + 2.612vw, 5rem);  // Fluid type
--space-24: clamp(3rem, 2.388rem + 2.612vw, 5rem);          // Fluid spacing

// Common Patterns
.content-card {
  padding: var(--space-6);
  border: 1px solid var(--color-border);
  border-radius: 8px;
}
```

**See:** [Customization Guide](docs/customization-guide.md) for complete design system documentation

## Site Deployment

The site deploys automatically via GitHub Actions:

**Process:**
1. Push to `main` branch
2. GitHub Actions workflow triggers (`.github/workflows/jekyll.yml`)
3. Jekyll build
4. Asset optimization (CSS/HTML minification)
5. Deploy to GitHub Pages
6. Site updates at https://lab.fawad.ai (~2-5 minutes)

**Custom Domain:**
- **URL:** https://lab.fawad.ai
- **DNS:** CNAME to `fawadafr.github.io`
- **HTTPS:** Automatically enabled by GitHub Pages

**Monitoring:**
- Navigate to repository → Actions tab
- View workflow runs and logs
- Email notifications for failures

**Rollback:**
```bash
# Revert to previous commit
git revert <commit-hash>
git push origin main

# Or force push (use with caution)
git reset --hard <working-commit-hash>
git push --force origin main
```

**See:** [User Manual - Deployment](docs/user-manual.md#deployment) for detailed troubleshooting

## SEO & Analytics

### Schema.org Structured Data

The site implements JSON-LD structured data for enhanced search engine visibility:

**Person Schema** (`index.html`):
- Type: Person
- Includes: name, jobTitle, url, image, LinkedIn profile (sameAs), expertise areas (knowsAbout)
- Purpose: Enables Google Knowledge Panel eligibility

**Article Schema** (blog posts):
- Type: Article
- Includes: headline, author, datePublished, dateModified, keywords, description
- Purpose: Rich snippets in search results

**BreadcrumbList Schema** (article pages):
- Enables breadcrumb navigation in search results
- Example: Home > Writing > Article Title

### Open Graph & Social Sharing

All pages include Open Graph and Twitter Card meta tags:
- `og:title`, `og:description`, `og:url`, `og:type`
- `og:image`: Generic placeholder at `/assets/images/og-default.svg` (1200x630px)
- `twitter:card` set to "summary_large_image"

**Testing:**
- Twitter Card Validator: https://cards-dev.twitter.com/validator
- Facebook Debugger: https://developers.facebook.com/tools/debug/
- LinkedIn Post Inspector: https://www.linkedin.com/post-inspector/

### Google Analytics 4

**Measurement ID:** `G-YSLJNR3DWB`

**Tracked Events:**
- **Automatic:** Page views, session duration, bounce rate, traffic sources
- **Custom:**
  - `contact_click`: Email link clicks
  - `social_click`: LinkedIn link clicks
  - `outbound_link`: External link clicks
  - `related_post_click`: Related post clicks (includes source/target titles)
  - `pwa_install`: PWA installation
  - `pwa_launch`: PWA app opened

**Access:**
- URL: https://analytics.google.com
- Property: `Fawad Rashidi - Executive Site`

**See:** [User Manual - Analytics](docs/user-manual.md#analytics--tracking) for key metrics and reporting

### Validation Tools

- **Schema Testing**: https://search.google.com/test/rich-results
- **PageSpeed Insights**: https://pagespeed.web.dev/
- **W3C HTML Validator**: https://validator.w3.org/
- **W3C CSS Validator**: https://jigsaw.w3.org/css-validator/

## Quick Reference

### Common Commands

```bash
# Development
bundle exec jekyll serve              # Start dev server
bundle exec jekyll serve --drafts     # Include drafts
bundle exec jekyll build              # Build site
bundle exec jekyll build --lsi        # Build with LSI for related posts

# Testing
./scripts/optimize-assets.sh          # Test asset optimization
./scripts/generate-pwa-icons.sh       # Generate PWA icons
ruby -ryaml -e "YAML.load_file('_data/file.yml')"  # Validate YAML

# Deployment (automatic on push)
git add .
git commit -m "Update content"
git push origin main
```

### File Locations

| Content Type | Location | Naming Convention |
|--------------|----------|-------------------|
| Blog posts | `_posts/` | `YYYY-MM-DD-title.md` |
| Drafts | `_drafts/` | `title.md` |
| Board positions | `_data/board-service.yml` | N/A |
| Certifications | `_data/certifications.yml` | N/A |
| Media appearances | `_data/media-appearances.yml` | N/A |
| PWA manifest | `manifest.json` | N/A |
| Service Worker | `sw.js` | N/A |
| Custom CSS | `_sass/` | `*.scss` |
| Custom JS | `assets/js/` | `*.js` |
| PWA icons | `assets/icons/` | `icon-{size}.png` |

### Front Matter Templates

**Blog Post:**
```yaml
---
layout: post
title: "Your Title"
excerpt: "Brief description"
date: 2025-11-15
categories: [category1, category2]
tags: [tag1, tag2]
---
```

**Page:**
```yaml
---
layout: page
title: "Page Title"
permalink: /custom-url/
---
```

**Speaking Engagement:**
```yaml
---
layout: page
title: "Engagement Title"
subtitle: "Event Context"
summary: "One-line description"
---
```

## Troubleshooting

### Common Issues

**Search Not Working:**
- Verify lunr.js is loading (DevTools → Network)
- Check search.json exists and is valid
- Clear cache and reload

**Theme Toggle Not Persisting:**
- Check localStorage in DevTools Console: `localStorage.getItem('theme')`
- Verify JavaScript is running without errors

**Related Posts Not Showing:**
- Enable LSI in `_config.yml`: `lsi: true`
- Install classifier-reborn: `gem install classifier-reborn`
- Rebuild with `--lsi` flag

**PWA Not Installing:**
- Verify HTTPS is enabled
- Check Service Worker is registered (DevTools → Application)
- Validate manifest.json (DevTools → Application → Manifest)

**Build Failing:**
- Check GitHub Actions logs for errors
- Common issues: YAML syntax, broken links, invalid Liquid syntax
- Test locally with `bundle exec jekyll build`

**See:** [User Manual - Troubleshooting](docs/user-manual.md#troubleshooting) for comprehensive solutions

## Additional Resources

- **Jekyll Documentation:** https://jekyllrb.com/docs/
- **GitHub Pages Documentation:** https://docs.github.com/en/pages
- **lunr.js Documentation:** https://lunrjs.com/
- **PWA Best Practices:** https://web.dev/progressive-web-apps/
- **Repository Issues:** https://github.com/fawadafr/fawadafr.github.io/issues

---

**For comprehensive documentation, see:**
- [User Manual](docs/user-manual.md) - Complete feature guide
- [Customization Guide](docs/customization-guide.md) - Styling and theming
- [PRD Implementation Report](docs/prd-implementation-report.md) - Technical implementation
- [Editorial Calendar](docs/editorial-calendar.md) - Content planning
