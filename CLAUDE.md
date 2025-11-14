# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based executive personal website for Fawad Rashidi, powered by the `minima` remote theme and hosted on GitHub Pages. The site showcases executive leadership experience, thought leadership, speaking engagements, and board service readiness.

## Development Commands

### Local Development
```bash
bundle install                    # Install dependencies
bundle exec jekyll serve          # Start local dev server at http://localhost:4000
```

### GitHub Pages Deployment
The site automatically deploys via GitHub Pages when changes are pushed to the `main` branch. No manual build commands required.

## Site Architecture

### Core Configuration
- **_config.yml**: Central Jekyll configuration including site metadata, theme settings, navigation structure, social links, and collections
- **Gemfile**: Uses `github-pages` gem to ensure local environment matches GitHub Pages production

### Content Structure

The site follows Jekyll conventions with content organized as:

1. **Root Pages** (`*.md`): Primary navigation pages
   - `index.md`: Executive overview landing page with hero section and highlights
   - `about.md`: Biography and professional background
   - `leadership-portfolio.md`: Signature engagements and recognition
   - `insights.md`: Curated list of insight briefings
   - `speaking.md`: Speaking engagement offerings
   - `contact.md`: Contact information and CTA

2. **Blog Posts** (`_posts/`): Long-form articles and commentary
   - File naming: `YYYY-MM-DD-title-slug.md`
   - Requires `layout: post`, `title`, and `excerpt` front matter
   - Automatically included in the site feed via `jekyll-feed` plugin

3. **Speaking Collection** (`_speaking/`): Keynote and advisory offerings
   - Configured as a Jekyll collection in `_config.yml`
   - Each file requires `layout: page`, `title`, `subtitle`, and `summary` front matter
   - Output at `/speaking/:name/` permalink structure

4. **Assets** (`assets/`): Custom styles and resources
   - `main.scss`: Custom Sass overrides for the minima theme
   - Includes custom hero section, highlight sections, grid layouts, and CTA button styles

### Theme & Plugins

- **Remote Theme**: `jekyll/minima` (classic skin)
- **Plugins**:
  - `jekyll-feed`: Generates RSS feed for blog posts
  - `jekyll-seo-tag`: Adds SEO meta tags

### Navigation

Navigation menu is controlled by the `header_pages` array in `_config.yml`. Pages are displayed in the order listed.

## Content Authoring Guidelines

### Blog Posts
Create new files in `_posts/` with format `YYYY-MM-DD-descriptive-title.md`:

```yaml
---
layout: post
title: Your Post Title Here
excerpt: Brief description for previews and SEO
---

Your content here...
```

### Speaking Engagements
Create new files in `_speaking/` with a descriptive filename:

```yaml
---
layout: page
title: Engagement Title
subtitle: Event or Context
summary: One-line description for listing pages
---

Detailed description of the engagement...
```

### Styling

Custom styles are added via `assets/main.scss`. The site uses:
- Hero sections with gradient backgrounds
- Grid layouts for focus areas (responsive, auto-fit columns)
- Consistent color palette: primary blue (#0b3d91), secondary gold (#f0b429)
- CTA button styles with border-radius and shadow effects

When adding new styles, maintain consistency with existing design patterns.

## Site Deployment

The site is deployed automatically via GitHub Pages:
- **URL**: https://fawadafr.github.io
- **Custom Domain**: Configured via CNAME file (https://lab.fawad.ai)
- **Branch**: Deploys from `main` branch
- No separate build process required—GitHub Pages builds Jekyll sites automatically

## SEO & Analytics (Sprint 1-2 Implementation)

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
- Test social previews: Twitter Card Validator, Facebook Debugger, LinkedIn Post Inspector

### Google Analytics 4
- **Measurement ID**: `G-YSLJNR3DWB`
- **Standard gtag.js implementation**
- **Event Tracking**: Email clicks, social links, external links, article views
- **Privacy Policy**: Available at `/privacy.html`

### Validation Tools
- **Schema Testing**: https://search.google.com/test/rich-results
- **Twitter Cards**: https://cards-dev.twitter.com/validator
- **Facebook**: https://developers.facebook.com/tools/debug/
- **LinkedIn**: https://www.linkedin.com/post-inspector/
