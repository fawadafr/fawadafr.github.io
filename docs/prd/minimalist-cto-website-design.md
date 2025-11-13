# PRD: Minimalist CTO Personal Branding Website

**Version:** 1.0
**Date:** 2025-11-13
**Status:** Draft for Development Team
**Target Audience:** Technology Leaders

---

## 1. Project Overview

### 1.1 Vision
Create a zen-inspired, minimalist personal branding website for a Chief Technology Officer that prioritizes readability, simplicity, and meaningful content discovery through an innovative hashtag-based navigation system.

### 1.2 Core Principles
- **Simplicity First:** Every element must serve a purpose; remove all decorative excess
- **Typography as Interface:** Let typeface, size, and spacing create visual hierarchy
- **Adaptive Reading:** Support both light and dark modes for optimal reading comfort
- **Content Discoverability:** Hybrid hashtag system for intuitive navigation and filtering
- **Developer Aesthetic:** Embrace monospace typography to signal technical credibility

### 1.3 Target Audience
- Technology executives and leaders
- Engineering hiring managers
- Conference organizers and event planners
- Board members and advisory roles seekers
- Technical community members

### 1.4 Primary Content Types
1. **Technical Thought Leadership:** Long-form articles on architecture, trends, and technology strategy
2. **Case Studies:** Real-world project showcases and transformation stories
3. **Speaking & Advisory:** Keynotes, workshops, and advisory engagements
4. **Notes & Quick Takes:** Shorter observations and links

---

## 2. Design Philosophy

### 2.1 Zen Minimalism
- Generous whitespace as a first-class design element
- Limited color palette (grayscale + single accent)
- No gradients, shadows, or decorative elements
- Flat design with subtle borders for separation
- Mobile-first, responsive approach

### 2.2 Reading Experience
- Optimal line length: 60-75 characters per line
- Ample line height for readability: 1.6-1.8 for body text
- Clear visual hierarchy through size and weight, not color
- Progressive disclosure: show essential info first
- Fast load times: minimal CSS/JS, no frameworks

### 2.3 Tone: Pragmatic Practitioner
- Conversational but professional
- Real-world lessons over theoretical frameworks
- Code examples and practical insights
- Approachable expertise

---

## 3. Design System

### 3.1 Color Palette

#### Light Mode (Default System Preference)
```
Background:     #FAFAFA (off-white, easier on eyes than pure white)
Surface:        #FFFFFF (pure white for cards/sections)
Text Primary:   #1A1A1A (near-black, softer than pure black)
Text Secondary: #6B6B6B (mid-gray for metadata)
Border:         #E5E5E5 (subtle separation)
Accent:         #2563EB (blue, sparingly used for links/CTAs)
Code Block:     #F5F5F5 (light gray background)
```

#### Dark Mode
```
Background:     #0A0A0A (near-black)
Surface:        #1A1A1A (elevated surface)
Text Primary:   #E5E5E5 (off-white)
Text Secondary: #9CA3AF (mid-gray)
Border:         #2A2A2A (subtle borders)
Accent:         #60A5FA (lighter blue for contrast)
Code Block:     #1F1F1F (slightly elevated)
```

#### Hashtag Colors (Subtle, Muted)
```
Light Mode Tags: #E5E7EB background, #4B5563 text
Dark Mode Tags:  #1F2937 background, #9CA3AF text
```

### 3.2 Typography System

**Based on Anthropic's design system** (https://www.anthropic.com)

#### Typeface Stack
```css
/* Fira Code for everything - unified monospace aesthetic */
--font-primary:  'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;
--font-heading:  'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;
--font-body:     'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;
--font-code:     'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;
```

**Font Loading:**
```html
<link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@400;500&display=swap" rel="stylesheet">
```

#### Type Scale (Fluid Typography with clamp())
Anthropic uses a sophisticated fluid typography system with `clamp()` for responsive scaling:

```css
/* Detail/Metadata Text */
--text-detail-xs:   clamp(0.6875rem, 0.668rem + 0.082vw, 0.75rem);    /* 11px → 12px */

/* Paragraph Sizes */
--text-para-s:      clamp(1rem, 0.962rem + 0.163vw, 1.125rem);         /* 16px → 18px */
--text-para-m:      clamp(1.125rem, 1.087rem + 0.163vw, 1.25rem);      /* 18px → 20px */
--text-para-l:      clamp(1.375rem, 1.337rem + 0.163vw, 1.5rem);       /* 22px → 24px */

/* Display/Heading Sizes */
--text-display-xs:  clamp(1.125rem, 1.087rem + 0.163vw, 1.25rem);      /* 18px → 20px */
--text-display-s:   clamp(1.25rem, 1.173rem + 0.327vw, 1.5rem);        /* 20px → 24px */
--text-display-m:   clamp(1.75rem, 1.673rem + 0.327vw, 2rem);          /* 28px → 32px */
--text-display-l:   clamp(2rem, 1.694rem + 1.306vw, 3rem);             /* 32px → 48px */
--text-display-xl:  clamp(2.5rem, 2.041rem + 1.959vw, 4rem);           /* 40px → 64px */
--text-display-xxl: clamp(3rem, 2.388rem + 2.612vw, 5rem);             /* 48px → 80px */

/* Monospace (if needed for special code blocks) */
--text-monospace:   clamp(0.875rem, 0.531rem + 1.469vw, 2rem);         /* 14px → 32px */
```

**Usage Mapping:**
- **Hero Statement:** `--text-display-xxl` (48-80px)
- **Page Titles:** `--text-display-xl` (40-64px)
- **Section Headings:** `--text-display-l` (32-48px)
- **H2 Headings:** `--text-display-m` (28-32px)
- **H3 Headings:** `--text-display-s` (20-24px)
- **Body Text:** `--text-para-m` (18-20px)
- **Secondary Text:** `--text-para-s` (16-18px)
- **Metadata/Tags:** `--text-detail-xs` (11-12px)

#### Line Heights
```css
--leading-tight:  1.2;   /* Headings - Anthropic optimized */
--leading-normal: 1.5;   /* Body text - balanced readability */
--leading-loose:  1.7;   /* Long-form articles - optimal reading */
```

**Note:** Anthropic uses a sophisticated line-height trim system with CSS `lh` units and pseudo-elements for precise optical spacing. For simplicity, we use standard line-height values.

#### Font Weights
**Simplified to match Anthropic's approach:**
```css
--font-normal:  400;   /* Regular - default */
--font-medium:  500;   /* Medium - for emphasis and headings */
```

**Note:** Anthropic only uses weights 400 and 500, avoiding heavier weights for a cleaner, more uniform appearance.

### 3.3 Spacing System
**Based on Anthropic's fluid grid system** with responsive spacing using `clamp()`:

```css
/* Fixed Spacing (Small Values) */
--space-1:  0.25rem;  /* 4px */
--space-2:  0.5rem;   /* 8px */
--space-3:  0.75rem;  /* 12px */
--space-4:  1rem;     /* 16px */
--space-6:  1.5rem;   /* 24px */

/* Fluid Spacing (Larger Values) - Anthropic System */
--space-8:  clamp(1.75rem, 1.673rem + 0.327vw, 2rem);      /* 28px → 32px */
--space-12: clamp(2.25rem, 2.020rem + 0.980vw, 3rem);      /* 36px → 48px */
--space-16: clamp(2.5rem, 2.041rem + 1.959vw, 4rem);       /* 40px → 64px */
--space-24: clamp(3rem, 2.388rem + 2.612vw, 5rem);         /* 48px → 80px */

/* Site Margins - Responsive from mobile to desktop */
--site-margin: clamp(2rem, 1.082rem + 3.918vw, 5rem);      /* 32px → 80px */
```

**Philosophy:** Small spacing values remain fixed for consistency, while larger spacing scales fluidly with viewport width for a responsive feel without breakpoint jumps.

### 3.4 Layout Grid
```css
--content-width: 680px;   /* Optimal reading width for articles */
--wide-width:    1024px;  /* For grids, case studies, homepage */
```

**Note:** Horizontal margins use `--site-margin` variable (responsive 32-80px) instead of fixed values.

---

## 4. Component Library

### 4.1 Header/Navigation

#### Desktop Layout
```
┌─────────────────────────────────────────────────────┐
│  [Name]                    /work  /writing  /speaking│
│                            #tags  /about    [theme]  │
└─────────────────────────────────────────────────────┘
```

#### Specifications
- **Height:** 80px fixed
- **Name/Logo:** Monospace, --text-xl, bold
- **Navigation Links:** --text-sm, uppercase letter-spacing: 0.05em
- **Theme Toggle:** Icon-only (sun/moon), position: absolute right
- **Border:** 1px solid border color at bottom
- **Sticky:** Fixed position on scroll

#### Mobile Layout
```
┌─────────────────────┐
│  [Name]      [≡]    │
└─────────────────────┘

[Menu Drawer Overlay]
/work
/writing
/speaking
#tags
/about
[theme toggle]
```

### 4.2 Homepage Hero

#### Layout
```
┌────────────────────────────────────────────┐
│                                            │
│         [Statement]                        │
│         Bold positioning text,             │
│         2-3 lines max                      │
│                                            │
│         [Sub-statement]                    │
│         One line context                   │
│                                            │
│         #tag1  #tag2  #tag3                │
│                                            │
└────────────────────────────────────────────┘
```

#### Specifications
- **Statement:** --text-4xl or --text-5xl, monospace, --font-bold
- **Sub-statement:** --text-lg, body font, --font-normal, text-secondary
- **Spacing:** --space-24 top/bottom padding
- **Tags:** Inline, clickable, link to tag filter view
- **Alignment:** Center or left (configurable)

### 4.3 Featured Content Grid

#### Layout (3-column on desktop, 1-column mobile)
```
┌─────────────┐  ┌─────────────┐  ┌─────────────┐
│ #tag        │  │ #tag        │  │ #tag        │
│             │  │             │  │             │
│ Title       │  │ Title       │  │ Title       │
│ Excerpt...  │  │ Excerpt...  │  │ Excerpt...  │
│             │  │             │  │             │
│ 5 min read  │  │ 8 min read  │  │ 12 min read │
└─────────────┘  └─────────────┘  └─────────────┘
```

#### Specifications
- **Card:** Surface background, 1px border, no shadow
- **Padding:** --space-6 internal padding
- **Gap:** --space-6 between cards
- **Tag:** Position top-left, single primary tag
- **Title:** --text-xl, monospace, clickable
- **Excerpt:** --text-base, 2-3 lines max
- **Meta:** --text-xs, text-secondary, read time + date
- **Hover:** Subtle border color change, no transition effects

### 4.4 Article/Post Layout

#### Structure
```
┌────────────────────────────────────────┐
│  #primary-tag                          │
│                                        │
│  Article Title (Monospace)            │
│  Date • 8 min read                    │
│                                        │
│  ────────────────────────                │
│                                        │
│  [Article content with optimal        │
│   line-length and generous spacing]   │
│                                        │
│  ## Headings (Monospace)              │
│                                        │
│  Paragraphs in sans-serif...          │
│                                        │
│  ```code blocks in monospace```       │
│                                        │
│  ────────────────────────                │
│                                        │
│  Filed under: #tag1 #tag2 #tag3       │
│                                        │
└────────────────────────────────────────┘
```

#### Content Specifications
- **Max Width:** --content-width (680px)
- **Title:** --text-3xl or --text-4xl, monospace, --space-2 margin-bottom
- **Meta:** --text-sm, text-secondary, --space-8 margin-bottom
- **Paragraph:** --text-base, --leading-loose, --space-6 margin-bottom
- **Headings:** Monospace, --space-8 margin-top, --space-4 margin-bottom
- **Lists:** --space-4 margin-bottom for items, simple bullets
- **Code Blocks:** Surface background, --space-4 padding, horizontal scroll
- **Inline Code:** Subtle background, --space-1 padding horizontal
- **Links:** Accent color, underline on hover only
- **Images:** Max-width 100%, --space-8 margin top/bottom, optional caption
- **Horizontal Rules:** 1px border, --space-12 margin top/bottom

### 4.5 Hashtag Component

#### Inline Tag Appearance
```css
.tag {
  display: inline-block;
  padding: 0.25rem 0.5rem;
  background: var(--tag-bg);
  color: var(--tag-text);
  border-radius: 3px;
  font-size: var(--text-xs);
  font-family: var(--font-code);
  letter-spacing: 0.02em;
  text-decoration: none;
  transition: none; /* No animations */
}

.tag:hover {
  background: var(--tag-hover-bg);
}
```

#### Tag Behaviors
- **Clickable:** All tags link to filtered view
- **Format:** Always prefixed with # symbol
- **Lowercase:** Enforce kebab-case (e.g., #cloud-architecture)
- **No Commas:** Tags are space-separated
- **Count:** Show count in tag browser view (e.g., #kubernetes (12))

### 4.6 Tag Browser/Filter View

#### Layout
```
┌────────────────────────────────────────┐
│  Explore by Topic                      │
│                                        │
│  #all (48)                             │
│  #cloud-architecture (12)              │
│  #engineering-culture (8)              │
│  #platform-engineering (15)            │
│  #leadership (10)                      │
│  #case-studies (6)                     │
│  ...                                   │
│                                        │
│  ──────────────────────────              │
│                                        │
│  [Filtered content grid appears        │
│   when tag is selected]                │
│                                        │
└────────────────────────────────────────┘
```

#### Specifications
- **Active Tag:** Accent color, bold
- **Tag List:** Sorted by count (descending) or alphabetical
- **Filter Behavior:** URL updates to /tags/cloud-architecture
- **Multi-select:** Hold CMD/CTRL to filter by multiple tags (AND logic)
- **Clear Filter:** Show "Clear" button when filtered

### 4.7 Case Study Card (Expanded)

#### Layout for Work/Portfolio Page
```
┌─────────────────────────────────────────────┐
│  Project Name                               │
│  #case-study #cloud-architecture            │
│                                             │
│  One-line description of the project and    │
│  its impact or outcome.                     │
│                                             │
│  → View Case Study                          │
└─────────────────────────────────────────────┘
```

#### Specifications
- **Title:** --text-2xl, monospace, --font-semibold
- **Tags:** Multiple tags shown
- **Description:** --text-base, 1-2 lines
- **CTA:** Arrow prefix, accent color link
- **Border:** Left border (4px) in accent color

### 4.8 Footer

#### Layout
```
┌────────────────────────────────────────┐
│  Connect: [email] [linkedin] [github]  │
│           [twitter] [rss]              │
│                                        │
│  Built with Jekyll • Hosted on GitHub  │
│  Last updated: Nov 2025                │
└────────────────────────────────────────┘
```

#### Specifications
- **Height:** Minimal, --space-16 padding
- **Links:** Text-secondary, hover to text-primary
- **Icons:** Optional, or text links only
- **Border:** 1px solid border-color at top
- **Attribution:** --text-xs, text-secondary

### 4.9 Theme Toggle

#### Implementation
```html
<!-- Toggle button in header -->
<button id="theme-toggle" aria-label="Toggle color mode">
  <svg class="sun-icon">...</svg>
  <svg class="moon-icon">...</svg>
</button>
```

#### Behavior
1. **On Page Load:** Check `localStorage` for saved preference
2. **If No Preference:** Use `prefers-color-scheme` media query
3. **On Toggle:**
   - Update `data-theme` attribute on `<html>` element
   - Save choice to `localStorage`
   - No transition animation (instant switch)

#### CSS Structure
```css
:root {
  --bg: #FAFAFA;
  --text: #1A1A1A;
  /* ...other light mode variables */
}

[data-theme="dark"] {
  --bg: #0A0A0A;
  --text: #E5E5E5;
  /* ...other dark mode variables */
}

@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0A0A0A;
    --text: #E5E5E5;
    /* ...apply dark as default if no saved preference */
  }
}
```

---

## 5. Page Templates

### 5.1 Homepage (`index.html`)
**Purpose:** First impression, positioning statement, featured content

**Sections:**
1. Hero with statement + core hashtags
2. Featured content (3 recent or curated pieces)
3. Brief bio (2-3 sentences)
4. CTA (speaking inquiries, newsletter, etc.)

### 5.2 Work/Portfolio (`/work`)
**Purpose:** Showcase case studies and projects

**Layout:**
- Page title: "Work" (monospace)
- Optional filter by tag
- Grid of case study cards
- Each links to detailed case study page

### 5.3 Writing/Blog (`/writing`)
**Purpose:** Long-form technical thought leadership

**Layout:**
- Page title: "Writing" (monospace)
- Tag filter/browser integrated at top
- Chronological list of articles
- Each with: title, excerpt, tags, meta (date, read time)

### 5.4 Individual Article (`/writing/:slug`)
**Purpose:** Long-form article reading experience

**Components:**
- Article header (title, meta, primary tag)
- Optimized reading width (680px)
- Table of contents for long articles (optional)
- Related articles footer (by tag similarity)

### 5.5 Speaking (`/speaking`)
**Purpose:** Showcase keynotes, workshops, advisory work

**Layout:**
- Page title: "Speaking" (monospace)
- Grid or list of speaking engagements
- Each with: event name, topic, date, optional link

**Optional Sections:**
- "Available Topics" list
- "Book a Speaking Engagement" CTA
- Testimonials (minimal, 1-2 quotes max)

### 5.6 Tag Browser (`/tags`)
**Purpose:** Explore all content by topic

**Layout:**
- Tag cloud or sorted list with counts
- Selected tag filters content below
- Breadcrumb navigation when filtered

### 5.7 About (`/about`)
**Purpose:** Bio, background, current focus

**Sections:**
- Name and current role
- Bio (3-4 paragraphs max)
- Current focus areas (bulleted)
- Timeline (optional, minimal design)
- Contact CTA

### 5.8 Individual Tag View (`/tags/:tag-name`)
**Purpose:** Filtered content by specific tag

**Layout:**
- Page title: "#tag-name" (monospace)
- Tag description (optional, 1 sentence)
- Filtered content grid
- "View all tags" link

---

## 6. Content Structure & Taxonomy

### 6.1 Front Matter Schema

#### Blog Post
```yaml
---
layout: post
title: "How We Built a Multi-Region Platform in 6 Months"
date: 2025-11-13
excerpt: "A pragmatic guide to scaling infrastructure across regions without over-engineering."
primary_tag: platform-engineering
tags:
  - platform-engineering
  - cloud-architecture
  - aws
  - terraform
  - case-study
read_time: 12
featured: true
---
```

#### Case Study
```yaml
---
layout: case-study
title: "Migrating 500 Services to Kubernetes"
date: 2025-08-20
client: "Fortune 500 Financial Services"
excerpt: "How we orchestrated a zero-downtime migration of legacy services to a modern container platform."
primary_tag: case-study
tags:
  - case-study
  - kubernetes
  - cloud-architecture
  - platform-engineering
outcomes:
  - "40% reduction in infrastructure costs"
  - "99.99% uptime maintained during migration"
  - "Developer productivity increased 3x"
featured: true
---
```

#### Speaking Engagement
```yaml
---
layout: speaking
title: "Building Engineering Culture at Scale"
event: "CTO Summit 2025"
date: 2025-09-15
location: "San Francisco, CA"
tags:
  - speaking
  - engineering-culture
  - leadership
recording_url: "https://..."
slides_url: "https://..."
---
```

### 6.2 Hashtag Taxonomy

#### Structured Categories (Predefined)
Core categories that organize content types:

- `#case-study` - Project showcases and transformation stories
- `#speaking` - Keynotes, workshops, presentations
- `#technical-deep-dive` - Detailed technical explorations
- `#leadership` - Engineering culture, team building, management
- `#quick-take` - Short observations and notes

#### Flexible Topic Tags (Content-Driven)
Topic-specific tags that emerge from content:

**Infrastructure & Platforms:**
- `#cloud-architecture`
- `#platform-engineering`
- `#kubernetes`
- `#aws` / `#gcp` / `#azure`
- `#terraform` / `#infrastructure-as-code`

**Engineering Practices:**
- `#engineering-culture`
- `#developer-experience`
- `#devops` / `#sre`
- `#observability`
- `#security`

**Technology Domains:**
- `#distributed-systems`
- `#microservices`
- `#api-design`
- `#data-engineering`
- `#machine-learning`

**Strategy & Leadership:**
- `#technology-strategy`
- `#team-building`
- `#hiring`
- `#remote-work`
- `#organizational-design`

#### Tag Governance
- **Naming:** kebab-case, lowercase, descriptive
- **Max Tags:** 5-7 per article (avoid tag spam)
- **Primary Tag:** Always specify the main category
- **Consistency:** Reuse existing tags before creating new ones
- **Review:** Quarterly audit to merge similar tags

---

## 7. Hashtag System Implementation

### 7.1 Technical Architecture

#### Jekyll Collections & Data Files
```yaml
# _config.yml
collections:
  posts:
    output: true
    permalink: /writing/:slug/
  case_studies:
    output: true
    permalink: /work/:slug/

# Generate tag index
tag_page_layout: tag
tag_page_dir: tags
```

#### Tag Index Generation (Jekyll Plugin or Manual)
Create `_data/tags.yml` generated at build time:

```yaml
# _data/tags.yml
cloud-architecture:
  count: 12
  description: "Designing scalable, resilient cloud infrastructure"

engineering-culture:
  count: 8
  description: "Building high-performing, inclusive engineering teams"

# ... more tags
```

### 7.2 Tag Browsing Interface

#### `/tags/index.html` Layout
```liquid
---
layout: default
title: "Explore by Topic"
---

<h1>#tags</h1>

<div class="tag-list">
  {% assign sorted_tags = site.tags | sort %}
  {% for tag in sorted_tags %}
    <a href="/tags/{{ tag[0] | slugify }}/" class="tag-item">
      #{{ tag[0] }} <span class="count">({{ tag[1].size }})</span>
    </a>
  {% endfor %}
</div>
```

#### Individual Tag Page (`/tags/:tag-name.html`)
```liquid
---
layout: tag
---

<h1>#{{ page.tag }}</h1>
{% if page.description %}
  <p class="tag-description">{{ page.description }}</p>
{% endif %}

<div class="content-grid">
  {% for post in site.tags[page.tag] %}
    {% include content-card.html post=post %}
  {% endfor %}
</div>
```

### 7.3 Tag Filtering (Client-Side Enhancement)

For enhanced UX, add optional JavaScript filtering:

```javascript
// Minimal vanilla JS for multi-tag filtering
class TagFilter {
  constructor() {
    this.activeTags = new Set();
    this.init();
  }

  init() {
    document.querySelectorAll('.tag-filter').forEach(tag => {
      tag.addEventListener('click', (e) => {
        e.preventDefault();
        this.toggleTag(tag.dataset.tag);
      });
    });
  }

  toggleTag(tag) {
    if (this.activeTags.has(tag)) {
      this.activeTags.delete(tag);
    } else {
      this.activeTags.add(tag);
    }
    this.filterContent();
  }

  filterContent() {
    const articles = document.querySelectorAll('[data-tags]');
    articles.forEach(article => {
      const articleTags = article.dataset.tags.split(',');
      const matches = [...this.activeTags].every(tag =>
        articleTags.includes(tag)
      );
      article.style.display = matches || this.activeTags.size === 0 ? 'block' : 'none';
    });
  }
}

// Initialize if on tag-enabled page
if (document.querySelector('.tag-filter')) {
  new TagFilter();
}
```

### 7.4 Tag SEO & Discoverability

#### Meta Tags for Tag Pages
```html
<!-- In tag page layout -->
<meta name="description" content="Articles about {{ page.tag }}: {{ page.description }}">
<meta property="og:title" content="#{{ page.tag }} | [Site Name]">
<link rel="canonical" href="{{ page.url | absolute_url }}">
```

#### Sitemap Inclusion
Ensure all tag pages are included in `sitemap.xml` for search indexing.

#### RSS Feed per Tag (Optional)
Generate separate RSS feeds for major tags:
- `/tags/cloud-architecture/feed.xml`
- `/tags/engineering-culture/feed.xml`

---

## 8. Technical Requirements

### 8.1 Technology Stack
- **Static Site Generator:** Jekyll (GitHub Pages compatible)
- **Hosting:** GitHub Pages (free, automatic deployment)
- **Version Control:** Git
- **Dependencies:** Minimal external libraries
  - No JavaScript framework (vanilla JS only)
  - No CSS framework (custom CSS)
  - Optional: Prism.js for syntax highlighting (lightweight)

### 8.2 Performance Requirements
- **Time to First Byte (TTFB):** < 200ms
- **First Contentful Paint (FCP):** < 1s
- **Largest Contentful Paint (LCP):** < 2.5s
- **Page Size:** < 100KB HTML/CSS/JS combined (excluding images)
- **Font Loading:** System fonts preferred; if web fonts, subset and preload

### 8.3 Browser Support
- **Modern Browsers:** Last 2 versions of Chrome, Firefox, Safari, Edge
- **Mobile:** iOS Safari 13+, Chrome Android 80+
- **Graceful Degradation:** Works without JavaScript (except tag filtering)

### 8.4 Mobile Responsiveness
- **Breakpoints:**
  ```css
  --mobile: 320px - 767px
  --tablet: 768px - 1023px
  --desktop: 1024px+
  ```
- **Touch Targets:** Minimum 44x44px for all interactive elements
- **Navigation:** Hamburger menu on mobile
- **Typography:** Fluid scaling between breakpoints

### 8.5 Asset Optimization
- **Images:**
  - WebP format with JPEG fallback
  - Lazy loading for below-fold images
  - Responsive images with `srcset`
  - Max width: 1400px
- **CSS:**
  - Single minified stylesheet
  - Critical CSS inlined in `<head>`
- **JavaScript:**
  - Defer non-critical scripts
  - Total JS < 10KB gzipped

### 8.6 RSS/Atom Feed
- Full-text RSS feed at `/feed.xml`
- Separate feeds for major categories (optional)

### 8.7 Analytics (Privacy-First)
- Self-hosted analytics (e.g., Plausible, Umami) or
- No analytics (default) - respect reader privacy
- No tracking cookies
- No third-party scripts

---

## 9. Accessibility Standards

### 9.1 WCAG 2.1 Level AA Compliance

#### Color Contrast
- **Normal Text:** Minimum 4.5:1 contrast ratio
- **Large Text:** Minimum 3:1 contrast ratio
- **Verify:** Test all color combinations in light and dark modes

#### Keyboard Navigation
- All interactive elements accessible via keyboard
- Visible focus indicators (2px outline in accent color)
- Logical tab order
- Skip to main content link

#### Screen Reader Support
- Semantic HTML5 elements (`<article>`, `<nav>`, `<main>`, `<aside>`)
- ARIA labels where needed
- Alt text for all images
- Hidden decorative elements (`aria-hidden="true"`)

#### Responsive Text
- Support browser text resize up to 200%
- No horizontal scrolling when text is enlarged
- Readable at all zoom levels

### 9.2 Accessibility Checklist

- [ ] All images have descriptive alt text
- [ ] Headings follow hierarchical order (h1 → h2 → h3)
- [ ] Links have descriptive text (avoid "click here")
- [ ] Form inputs have associated labels
- [ ] Color is not the only means of conveying information
- [ ] Videos have captions (if applicable)
- [ ] Table data uses proper `<th>` and `scope` attributes
- [ ] Focus is never trapped
- [ ] ARIA roles used correctly
- [ ] Tested with screen reader (NVDA, VoiceOver, or JAWS)

---

## 10. Content Guidelines

### 10.1 Writing Style
- **Tone:** Conversational, direct, honest
- **Voice:** First-person for opinion pieces, third-person for case studies
- **Length:** 800-2000 words for thought leadership, 300-600 for quick takes
- **Code Examples:** Always include context, comments, and practical relevance
- **Avoid:** Jargon without explanation, excessive buzzwords

### 10.2 Metadata Requirements

Every piece of content must include:
- **Title:** Clear, descriptive (50-60 characters for SEO)
- **Excerpt:** 1-2 sentence summary (150-160 characters)
- **Primary Tag:** Main category
- **Tags:** 3-7 relevant topic tags
- **Date:** Publication date
- **Read Time:** Estimated reading time (auto-calculated or manual)

### 10.3 Image Guidelines
- **Hero Images:** 1200x630px for social sharing
- **Inline Images:** Max 1000px wide, WebP format
- **Diagrams:** SVG preferred for scalability and dark mode adaptability
- **Alt Text:** Always descriptive, not decorative

---

## 11. Implementation Roadmap

### Phase 1: Foundation (Week 1-2)
- [ ] Set up Jekyll project structure
- [ ] Implement design system (CSS variables, typography, spacing)
- [ ] Create base layout template
- [ ] Implement theme toggle functionality
- [ ] Build header and footer components

### Phase 2: Core Pages (Week 3-4)
- [ ] Homepage with hero and featured content
- [ ] Blog/writing index page
- [ ] Individual article layout
- [ ] About page
- [ ] 404 error page

### Phase 3: Hashtag System (Week 5)
- [ ] Implement tag taxonomy structure
- [ ] Build tag browser page
- [ ] Create individual tag pages
- [ ] Add tag filtering to content
- [ ] Implement related content by tags

### Phase 4: Content Types (Week 6)
- [ ] Case study layout and collection
- [ ] Speaking/events page
- [ ] Portfolio/work page
- [ ] Quick takes/notes section (optional)

### Phase 5: Polish & Optimization (Week 7)
- [ ] Performance optimization
- [ ] Image optimization pipeline
- [ ] RSS feed configuration
- [ ] SEO meta tags and sitemap
- [ ] Cross-browser testing

### Phase 6: Accessibility & Testing (Week 8)
- [ ] Accessibility audit with automated tools
- [ ] Manual keyboard navigation testing
- [ ] Screen reader testing
- [ ] Mobile device testing
- [ ] Final refinements

---

## 12. Success Metrics

### 12.1 Quantitative Metrics
- **Page Load Time:** < 2s on 3G connection
- **Lighthouse Score:** 95+ in all categories
- **Core Web Vitals:** All "Good" ratings
- **Bounce Rate:** < 40% (if analytics implemented)
- **Average Session Duration:** > 2 minutes
- **Tag Engagement:** % of visitors who use tag navigation

### 12.2 Qualitative Metrics
- **Readability:** Positive feedback on reading experience
- **Content Discovery:** Users find related content easily via tags
- **Professional Impression:** Conveys technical credibility
- **Accessibility:** No barriers reported by users with disabilities

---

## 13. Design References & Inspiration

### 13.1 Minimalist Design Examples
- **Zenhabits.net** - Ultimate minimalism in blogging
- **Sivers.org** - Text-first, simple navigation
- **Patrick Collison's site** - Clean, content-focused
- **Hundred Rabbits** - Monospace aesthetic, low-tech philosophy

### 13.2 Typography-First Sites
- **Medium** - Optimal reading experience (without the clutter)
- **ia.net** - Information architecture leaders
- **Butterick's Practical Typography** - Typography as primary interface

### 13.3 Technical/Developer Sites
- **Dan Abramov (overreacted.io)** - Developer-friendly, minimal
- **Julia Evans (jvns.ca)** - Approachable technical content
- **Brandur Leach** - Long-form technical writing

---

## 14. File Structure

```
fawadafr.github.io/
├── _config.yml                 # Jekyll configuration
├── _includes/                  # Reusable components
│   ├── header.html
│   ├── footer.html
│   ├── theme-toggle.html
│   ├── content-card.html
│   └── tag-list.html
├── _layouts/                   # Page templates
│   ├── default.html           # Base layout
│   ├── home.html              # Homepage
│   ├── post.html              # Blog article
│   ├── case-study.html        # Case study
│   ├── page.html              # Static page
│   └── tag.html               # Tag browser
├── _posts/                     # Blog articles
│   └── YYYY-MM-DD-title.md
├── _case_studies/              # Portfolio projects
│   └── project-name.md
├── _speaking/                  # Speaking engagements
│   └── event-name.md
├── _data/                      # Site data
│   └── tags.yml               # Tag descriptions
├── _sass/                      # Stylesheets
│   ├── _variables.scss        # Design tokens
│   ├── _reset.scss            # CSS reset
│   ├── _typography.scss       # Font system
│   ├── _layout.scss           # Grid & spacing
│   ├── _components.scss       # UI components
│   └── _theme.scss            # Light/dark mode
├── assets/                     # Static assets
│   ├── css/
│   │   └── main.scss          # Main stylesheet
│   ├── js/
│   │   ├── theme-toggle.js
│   │   └── tag-filter.js
│   └── images/
├── pages/                      # Static pages
│   ├── about.md
│   ├── work.md
│   ├── writing.md
│   ├── speaking.md
│   └── tags.md
├── docs/                       # Documentation
│   └── prd/                   # Product requirements
│       └── minimalist-cto-website-design.md
├── index.html                  # Homepage
├── 404.html                    # Error page
├── feed.xml                    # RSS feed
├── Gemfile                     # Ruby dependencies
└── README.md                   # Project documentation
```

---

## 15. Appendix

### 15.1 CSS Custom Properties Reference

Complete variable reference for implementation (based on Anthropic's design system):

```css
:root {
  /* Colors - Light Mode */
  --color-bg: #FAFAFA;
  --color-surface: #FFFFFF;
  --color-text-primary: #1A1A1A;
  --color-text-secondary: #6B6B6B;
  --color-border: #E5E5E5;
  --color-accent: #2563EB;
  --color-code-bg: #F5F5F5;
  --color-tag-bg: #E5E7EB;
  --color-tag-text: #4B5563;

  /* Typography - Anthropic System with Fira Code */
  --font-primary: 'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;
  --font-heading: 'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;
  --font-body: 'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;
  --font-code: 'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;

  /* Fluid Typography Scale - Anthropic's clamp() system */
  --text-detail-xs: clamp(0.6875rem, 0.668rem + 0.082vw, 0.75rem);
  --text-para-s: clamp(1rem, 0.962rem + 0.163vw, 1.125rem);
  --text-para-m: clamp(1.125rem, 1.087rem + 0.163vw, 1.25rem);
  --text-para-l: clamp(1.375rem, 1.337rem + 0.163vw, 1.5rem);
  --text-display-xs: clamp(1.125rem, 1.087rem + 0.163vw, 1.25rem);
  --text-display-s: clamp(1.25rem, 1.173rem + 0.327vw, 1.5rem);
  --text-display-m: clamp(1.75rem, 1.673rem + 0.327vw, 2rem);
  --text-display-l: clamp(2rem, 1.694rem + 1.306vw, 3rem);
  --text-display-xl: clamp(2.5rem, 2.041rem + 1.959vw, 4rem);
  --text-display-xxl: clamp(3rem, 2.388rem + 2.612vw, 5rem);
  --text-monospace: clamp(0.875rem, 0.531rem + 1.469vw, 2rem);

  /* Font Weights - Anthropic simplified approach */
  --font-normal: 400;
  --font-medium: 500;

  /* Line Heights - Anthropic optimized */
  --leading-tight: 1.2;
  --leading-normal: 1.5;
  --leading-loose: 1.7;

  /* Spacing - Anthropic's Fluid Grid System */
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-6: 1.5rem;
  --space-8: clamp(1.75rem, 1.673rem + 0.327vw, 2rem);
  --space-12: clamp(2.25rem, 2.020rem + 0.980vw, 3rem);
  --space-16: clamp(2.5rem, 2.041rem + 1.959vw, 4rem);
  --space-24: clamp(3rem, 2.388rem + 2.612vw, 5rem);

  /* Site Margins - Responsive */
  --site-margin: clamp(2rem, 1.082rem + 3.918vw, 5rem);

  /* Layout */
  --content-width: 680px;
  --wide-width: 1024px;

  /* Transitions */
  --transition-none: 0s;
}

[data-theme="dark"] {
  --color-bg: #0A0A0A;
  --color-surface: #1A1A1A;
  --color-text-primary: #E5E5E5;
  --color-text-secondary: #9CA3AF;
  --color-border: #2A2A2A;
  --color-accent: #60A5FA;
  --color-code-bg: #1F1F1F;
  --color-tag-bg: #1F2937;
  --color-tag-text: #9CA3AF;
}
```

### 15.2 Sample Content Template

```markdown
---
layout: post
title: "Building a Culture of Ownership in Engineering Teams"
date: 2025-11-13
excerpt: "Three practical strategies for empowering engineers to take true ownership of their systems without burning out."
primary_tag: engineering-culture
tags:
  - engineering-culture
  - leadership
  - team-building
  - technical-deep-dive
read_time: 8
featured: true
---

## The Ownership Paradox

Many CTOs talk about ownership, but few create the conditions where it can actually flourish. Here's what I've learned building teams where ownership is real, not performative.

[Content continues...]

### Key Takeaways

1. First key point
2. Second key point
3. Third key point

---

Filed under: #engineering-culture #leadership #team-building
```

### 15.3 Browser Testing Matrix

| Browser | Version | Testing Priority |
|---------|---------|------------------|
| Chrome | Latest 2 | High |
| Firefox | Latest 2 | High |
| Safari | Latest 2 | High |
| Edge | Latest 2 | Medium |
| Mobile Safari (iOS) | 13+ | High |
| Chrome Android | 80+ | High |

---

## 16. Questions for Development Team

Before implementation, please clarify:

1. **CMS Preference:** Jekyll admin interface or purely file-based editing?
2. **Comment System:** Include comments (e.g., utterances via GitHub issues) or keep comment-free?
3. **Newsletter Integration:** Integrate email signup (e.g., Buttondown, Substack) or omit?
4. **Search Functionality:** Include site search or rely solely on tag navigation?
5. **Analytics Decision:** Which privacy-first analytics (Plausible, Umami, none)?
6. **Syntax Highlighting:** Prism.js, highlight.js, or Jekyll's default Rouge?
7. **Custom Domain:** Setting up custom domain or using `github.io` subdomain?

---

**End of PRD**

---

## Document History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-11-13 | UX Design Team | Initial draft for development team |

