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

See the editorial calendar for content workflow, publishing cadence, and style guidelines.

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

### Jekyll Data Files

**Note:** The current site uses standalone HTML files (not Jekyll templates). Data files are configured and ready for future use when transitioning to Jekyll-based templates.

Jekyll data files in `_data/` allow you to separate content from presentation, making it easier to update recurring content without editing HTML. Data files are automatically loaded by Jekyll and accessible via `site.data`.

#### Available Data Files

1. **Board Service** (`_data/board-service.yml`)
   - Advisory positions and board memberships
   - Access via: `site.data.board-service.positions`

2. **Certifications** (`_data/certifications.yml`)
   - Professional certifications and credentials
   - Access via: `site.data.certifications.certifications`

3. **Media Appearances** (`_data/media-appearances.yml`)
   - Speaking engagements, interviews, articles, podcasts
   - Access via: `site.data.media-appearances.appearances`

#### Usage Example (Jekyll Templates)

```liquid
<!-- Display Board Positions -->
{% for position in site.data.board-service.positions %}
<div class="board-position">
  <h3>{{ position.organization }}</h3>
  <p class="role">{{ position.role }}</p>
  <p class="tenure">{{ position.start_date }} - {{ position.end_date }}</p>
  <p>{{ position.description }}</p>
  {% if position.url %}
    <a href="{{ position.url }}">Learn more</a>
  {% endif %}
</div>
{% endfor %}

<!-- Display Certifications -->
{% for cert in site.data.certifications.certifications %}
<div class="certification">
  <h4>{{ cert.name }}</h4>
  <p>{{ cert.issuer }} • {{ cert.year }}</p>
  {% if cert.verification_url %}
    <a href="{{ cert.verification_url }}">Verify</a>
  {% endif %}
</div>
{% endfor %}

<!-- Display Media Appearances -->
{% for appearance in site.data.media-appearances.appearances %}
<article class="media-appearance">
  <span class="type">{{ appearance.type }}</span>
  <h4><a href="{{ appearance.url }}">{{ appearance.title }}</a></h4>
  <p class="publication">{{ appearance.publication }} • {{ appearance.date | date: "%B %Y" }}</p>
  {% if appearance.description %}
    <p>{{ appearance.description }}</p>
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
```

**Media Appearances:**
```yaml
- title: "Article/Talk Title"
  publication: "Publication Name"
  date: "2024-01-15"
  url: "https://example.com"
  type: "interview | article | podcast | conference | webinar"
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
