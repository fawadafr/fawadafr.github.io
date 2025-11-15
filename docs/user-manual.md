# User Manual - Fawad Rashidi Executive Website

**Version:** 1.0
**Last Updated:** November 2025
**Audience:** Content Authors, Site Administrators

---

## Table of Contents

1. [Introduction](#introduction)
2. [Content Management](#content-management)
3. [Search Functionality](#search-functionality)
4. [Related Posts](#related-posts)
5. [Pagination](#pagination)
6. [Theme Toggle](#theme-toggle)
7. [Progressive Web App (PWA)](#progressive-web-app-pwa)
8. [Analytics & Tracking](#analytics--tracking)
9. [Asset Optimization](#asset-optimization)
10. [Deployment](#deployment)
11. [Troubleshooting](#troubleshooting)

---

## Introduction

This manual provides step-by-step instructions for managing and using all features of the Fawad Rashidi executive website. The site is built with Jekyll, hosted on GitHub Pages, and includes modern web features like PWA support, search, and analytics.

**Who This Guide Is For:**
- Content authors writing blog posts
- Site administrators managing data and content
- Anyone updating the site without deep technical knowledge

**Prerequisites:**
- GitHub account with access to the repository
- Basic understanding of Markdown syntax
- Text editor (VS Code recommended)

---

## Content Management

### Writing Blog Posts

Blog posts are the primary way to publish long-form articles, commentary, and thought leadership.

#### Creating a New Blog Post

1. **Navigate to the `_posts/` directory** in your repository

2. **Create a new file** with the naming convention:
   ```
   YYYY-MM-DD-descriptive-title-slug.md
   ```

   **Examples:**
   - `2025-11-15-platform-engineering-foundations.md`
   - `2025-12-01-building-ownership-culture.md`

3. **Add front matter** at the top of the file:
   ```yaml
   ---
   layout: post
   title: "Platform Engineering Foundations: Building Developer Platforms That Scale"
   excerpt: "Essential principles for creating internal developer platforms that accelerate engineering velocity and reduce cognitive load."
   date: 2025-11-15
   categories: [technical-leadership, platform-engineering]
   tags: [devops, platform, developer-experience]
   ---
   ```

4. **Write your content** using Markdown below the front matter:
   ```markdown
   ## Introduction

   Platform engineering has become critical for...

   ## Key Principles

   1. **Developer Experience First**
      - Reduce cognitive load
      - Provide self-service capabilities

   2. **Automation Over Documentation**
      - Automate repetitive tasks
      - Make the right way the easy way
   ```

5. **Save the file** and commit to GitHub

#### Front Matter Fields

| Field | Required | Description | Example |
|-------|----------|-------------|---------|
| `layout` | Yes | Template to use | `post` |
| `title` | Yes | Post title | `"Building Ownership Culture"` |
| `excerpt` | Yes | Brief description for previews | `"Three strategies for empowering engineers..."` |
| `date` | No | Override file date | `2025-11-15` |
| `categories` | No | Post categories | `[engineering-culture, leadership]` |
| `tags` | No | Post tags | `[ownership, culture, team-building]` |

#### Drafts

To create a draft post that won't be published:

1. Create a file in `_drafts/` directory (no date prefix needed):
   ```
   _drafts/my-upcoming-post.md
   ```

2. Preview drafts locally:
   ```bash
   bundle exec jekyll serve --drafts
   ```

3. When ready to publish, move to `_posts/` and add date prefix

#### Scheduled Posts

Posts with future dates won't appear until that date:

```yaml
---
layout: post
title: "Future Article"
date: 2025-12-25  # Will appear on Christmas
---
```

**Note:** GitHub Pages builds happen on push, so the post will appear after the next commit on or after the date.

---

### Managing Data Files

The site uses YAML data files to separate content from templates, making updates easier.

#### Board Positions (`_data/board-service.yml`)

**Purpose:** Display advisory board roles and memberships

**Adding a New Position:**

```yaml
positions:
  - organization: "TechStartup Inc"
    role: "Technical Advisory Board Member"
    start_date: "2025-01"
    end_date: "present"
    description: "Advising on cloud architecture and platform engineering strategy for Series B startup scaling from 10 to 100 engineers."
    url: "https://techstartup.com"
```

**Field Reference:**

| Field | Required | Format | Example |
|-------|----------|--------|---------|
| `organization` | Yes | String | `"Company Name"` |
| `role` | Yes | String | `"Board Member"` |
| `start_date` | Yes | `YYYY-MM` | `"2024-06"` |
| `end_date` | Yes | `YYYY-MM` or `"present"` | `"present"` |
| `description` | Yes | String | Brief role description |
| `url` | No | URL | `"https://example.com"` |

**Best Practices:**
- Sort positions newest first
- Use "present" for ongoing roles
- Keep descriptions concise (1-2 sentences)

---

#### Certifications (`_data/certifications.yml`)

**Purpose:** Display professional certifications and credentials

**Adding a New Certification:**

```yaml
certifications:
  - name: "AWS Certified Solutions Architect - Professional"
    issuer: "Amazon Web Services"
    year: 2025
    credential_id: "AWS-PSA-12345"
    verification_url: "https://aws.amazon.com/verification/12345"
    description: "Advanced AWS architecture and design patterns"
```

**Field Reference:**

| Field | Required | Format | Example |
|-------|----------|--------|---------|
| `name` | Yes | String | Certification name |
| `issuer` | Yes | String | Organization name |
| `year` | Yes | Number | `2025` |
| `credential_id` | No | String | `"CERT-123"` |
| `verification_url` | No | URL | Verification link |
| `description` | No | String | Brief description |

**Best Practices:**
- Include only active certifications
- Update expiration dates annually
- Provide verification links when available

---

#### Media Appearances (`_data/media-appearances.yml`)

**Purpose:** Track speaking engagements, interviews, articles, podcasts

**Adding a New Appearance:**

```yaml
appearances:
  - title: "The Future of Platform Engineering"
    publication: "TechCrunch"
    date: "2025-11-15"
    url: "https://techcrunch.com/article"
    type: "interview"
    description: "Discussing trends in developer platforms and infrastructure automation"
```

**Field Reference:**

| Field | Required | Format | Example |
|-------|----------|--------|---------|
| `title` | Yes | String | Article/talk title |
| `publication` | Yes | String | Publication name |
| `date` | Yes | `YYYY-MM-DD` | `"2025-11-15"` |
| `url` | Yes | URL | Article/event link |
| `type` | Yes | Enum | See types below |
| `description` | No | String | Optional context |

**Valid Types:**
- `interview` - Media interviews
- `article` - Published articles
- `podcast` - Podcast appearances
- `conference` - Conference talks
- `webinar` - Webinar presentations

**Best Practices:**
- Sort by date (newest first)
- Include only public appearances
- Use consistent publication names

---

#### Testing Data File Changes

After editing YAML files:

1. **Check YAML syntax** using an online validator or:
   ```bash
   ruby -ryaml -e "YAML.load_file('_data/board-service.yml')"
   ```

2. **Build the site locally:**
   ```bash
   bundle exec jekyll build
   ```

3. **Preview changes:**
   ```bash
   bundle exec jekyll serve
   # Visit http://localhost:4000
   ```

4. **Check for errors** in the terminal output

**Common YAML Errors:**

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

---

## Search Functionality

The site includes a client-side search powered by lunr.js, allowing visitors to search all content without a backend.

### How Search Works

1. **Index Generation:** When the site builds, a search index is created from all posts, pages, and content
2. **Client-Side Search:** Search runs in the browser using the pre-built index
3. **Real-Time Results:** Results appear as you type
4. **Relevance Scoring:** Results are ranked by relevance using TF-IDF algorithm

### What Content Is Searchable

- **Blog Posts:** Title, excerpt, content, tags, categories
- **Pages:** Title and content
- **Data Files:** Board positions, certifications, media appearances (if configured)

### Using the Search Feature

**Desktop:**
1. Click the search icon (🔍) in the header
2. Type your query in the search box
3. Results appear instantly below
4. Click any result to navigate to that page

**Mobile:**
1. Tap the search icon in the mobile menu
2. Search overlay appears full-screen
3. Type and select results

**Keyboard Shortcuts:**
- Press `/` to focus search box (desktop)
- Press `Esc` to close search overlay

### Search Tips for Visitors

**Effective Searching:**
```
✅ "platform engineering" - Multi-word phrases
✅ cloud architecture - Multiple keywords
✅ kubernetes - Specific technologies
✅ leadership culture - Conceptual terms

❌ the, and, or - Stop words (ignored)
❌ eng* - Wildcards (not supported)
```

**Search Features:**
- **Partial Matching:** "platf" matches "platform"
- **Case Insensitive:** "AWS" = "aws" = "Aws"
- **Stemming:** "running" matches "run", "runner"

### Customizing Search

**To change searchable fields**, edit `assets/js/search.js`:

```javascript
// Current configuration
const index = lunr(function () {
  this.ref('id')
  this.field('title', { boost: 10 })
  this.field('excerpt', { boost: 5 })
  this.field('content')
  this.field('tags', { boost: 3 })
  this.field('categories', { boost: 3 })

  // Add more fields as needed
})
```

**Field Boost Values:**
- Higher numbers = higher relevance in results
- `title: 10` means title matches rank highest
- `content: 1` (default) means body text ranks lower

---

## Related Posts

The site shows related posts at the bottom of each blog post to encourage content discovery.

### How Related Posts Work

Jekyll's Latent Semantic Indexing (LSI) analyzes post content to find semantically similar articles based on:
- Common keywords and phrases
- Topic similarity
- Content structure

**Example:** A post about "Platform Engineering" might show related posts about "DevOps", "Infrastructure as Code", or "Developer Experience"

### Configuration

**Location:** `_config.yml`

```yaml
# Related Posts Configuration
lsi: true  # Enable Latent Semantic Indexing

# Number of related posts to show
related_posts_count: 3  # Default: 3
```

**To change the number of related posts:**

1. Edit `_config.yml`:
   ```yaml
   related_posts_count: 5  # Show 5 related posts
   ```

2. Rebuild the site:
   ```bash
   bundle exec jekyll build --lsi
   ```

**Note:** LSI requires the `classifier-reborn` gem and increases build time.

### Fallback Behavior

If LSI is disabled or not enough related posts are found:

1. **Chronological Fallback:** Shows the most recent posts
2. **Minimum Posts:** Always shows at least 3 posts (if available)
3. **Same Category:** Prioritizes posts in the same category

### Analytics Tracking

Related post clicks are automatically tracked in Google Analytics:

```javascript
gtag('event', 'related_post_click', {
  'event_category': 'content_discovery',
  'event_label': 'related_posts',
  'source_post': 'Current Post Title',
  'target_post': 'Clicked Post Title'
})
```

---

## Pagination

Blog posts are paginated to improve page load performance and user experience.

### Configuration

**Location:** `_config.yml`

```yaml
# Pagination Settings
paginate: 10  # Posts per page
paginate_path: "/blog/page:num/"  # URL structure
```

### Customizing Posts Per Page

**To show more/fewer posts per page:**

1. Edit `_config.yml`:
   ```yaml
   paginate: 15  # Show 15 posts per page
   ```

2. Rebuild and test locally:
   ```bash
   bundle exec jekyll serve
   ```

3. Commit changes to deploy

**Recommended Values:**
- **Desktop-focused:** 15-20 posts
- **Mobile-focused:** 8-10 posts
- **Current default:** 10 posts

### Pagination URLs

With `paginate_path: "/blog/page:num/"`:

- **First page:** `/blog/` or `/blog/page1/`
- **Second page:** `/blog/page2/`
- **Third page:** `/blog/page3/`

### Navigation Controls

Pagination controls appear at the bottom of the blog listing:

```
← Newer Posts    Page 2 of 5    Older Posts →
```

**Behavior:**
- First page: "Newer Posts" button hidden
- Last page: "Older Posts" button hidden
- Middle pages: Both buttons visible

---

## Theme Toggle

The site supports light and dark themes with automatic system preference detection.

### Features

1. **System Preference Detection:** Automatically matches user's OS theme
2. **Manual Toggle:** Users can override with theme switcher
3. **Persistence:** Choice saved to localStorage
4. **Smooth Transitions:** Theme switches with CSS transitions

### How It Works

**Initial Load:**
1. Check localStorage for saved preference
2. If no preference, detect system theme:
   - `prefers-color-scheme: dark` → Dark theme
   - `prefers-color-scheme: light` → Light theme
3. Apply theme immediately (no flash)

**Manual Toggle:**
1. User clicks theme toggle button (☀️/🌙 icon)
2. Theme switches instantly
3. Preference saved to localStorage
4. Persists across sessions

### Color Schemes

**Light Theme (`data-theme="light"`):**
```scss
--color-bg: #FAFAFA;           // Background
--color-surface: #FFFFFF;       // Cards/surfaces
--color-text-primary: #1A1A1A;  // Main text
--color-accent: #2563EB;        // Blue accent
```

**Dark Theme (`data-theme="dark"`):**
```scss
--color-bg: #0A0A0A;           // Background
--color-surface: #1A1A1A;       // Cards/surfaces
--color-text-primary: #FAFAFA;  // Main text
--color-accent: #60A5FA;        // Lighter blue accent
```

### Testing Theme Toggle

1. **Desktop:** Click sun/moon icon in header
2. **Mobile:** Access from mobile menu
3. **Keyboard:** Tab to icon, press Enter

**Verify Persistence:**
1. Toggle to dark mode
2. Refresh the page
3. Theme should remain dark
4. Clear localStorage and refresh
5. Theme should reset to system preference

### Customizing Theme Colors

See the **[Customization Guide](customization-guide.md)** for detailed instructions on customizing theme colors.

---

## Progressive Web App (PWA)

The site is a fully-featured Progressive Web App, allowing visitors to install it like a native app.

### PWA Features

1. **Installable:** Add to home screen on mobile/desktop
2. **Offline Support:** Core pages work without internet
3. **Fast Loading:** Cached assets load instantly
4. **App-Like Feel:** Standalone mode hides browser UI

### Installing the App

#### Mobile (iOS)

1. Visit site in Safari
2. Tap the Share button (⎋)
3. Scroll down and tap "Add to Home Screen"
4. Tap "Add" to confirm
5. App icon appears on home screen

**Note:** iOS doesn't support automatic install prompts; users must manually add to home screen.

#### Mobile (Android)

**Automatic Prompt:**
1. Visit site in Chrome
2. After a few seconds, install prompt appears:
   ```
   Add Fawad Rashidi to Home screen?
   [Cancel] [Install]
   ```
3. Tap "Install"
4. App opens in standalone mode

**Manual Install:**
1. Tap Chrome menu (⋮)
2. Select "Install app" or "Add to Home screen"
3. Tap "Install"

#### Desktop (Chrome/Edge)

**Automatic Prompt:**
1. Visit site in Chrome or Edge
2. Look for install icon (⊕) in address bar
3. Click the icon
4. Click "Install" in the dialog

**Manual Install:**
1. Click browser menu (⋮)
2. Select "Install Fawad Rashidi..."
3. Click "Install"

**Floating Install Button:**
- On compatible devices, a floating "📱 Install App" button appears bottom-right
- Click to trigger install prompt
- Button auto-hides after installation

### Using the Installed App

**Opening:**
- **Mobile:** Tap the app icon on home screen
- **Desktop:** Find in Start Menu/Applications or taskbar

**App Experience:**
- Runs in standalone mode (no browser UI)
- Custom app icon and splash screen
- Dedicated window/app switcher entry
- Works offline for cached pages

**Updating:**
- App checks for updates hourly
- New version downloaded in background
- Refresh page to apply updates

### Offline Functionality

**What Works Offline:**
- ✅ All visited blog posts
- ✅ Homepage
- ✅ Static pages
- ✅ CSS and JavaScript
- ✅ Cached images
- ❌ New content not yet visited
- ❌ External resources (analytics, fonts)

**Cache Strategy:**
- **Static Assets:** Cache-first (instant load)
- **HTML Pages:** Network-first (fresh content when online)
- **Images:** Cache-first with 7-day expiration

**Testing Offline Mode:**
1. Visit a few pages while online
2. Open DevTools → Network tab
3. Select "Offline" from throttling dropdown
4. Navigate to cached pages
5. Pages load from cache

### PWA Icons

**Configured Sizes:**
- 72×72, 96×96, 128×128 (small icons)
- 144×144, 152×152 (iOS icons)
- 192×192 (standard Android)
- 384×384, 512×512 (high-res, splash screens)

**Generating Custom Icons:**

If you need to replace the default "FR" icon:

1. Create a 512×512 SVG source: `assets/icons/icon.svg`

2. Run the generator script:
   ```bash
   cd assets/icons
   ./scripts/generate-pwa-icons.sh
   ```

3. Or use an online tool like [PWA Asset Generator](https://www.pwabuilder.com/imageGenerator)

4. Replace files in `assets/icons/` directory

**Icon Requirements:**
- Square aspect ratio (1:1)
- Solid background color (transparent may show as black)
- Simple design (legible at small sizes)
- PNG format for all sizes

### App Shortcuts

The PWA includes quick actions accessible from the app icon:

**Available Shortcuts:**
1. **Latest Articles** → `/blog/`
2. **About** → `/about/`
3. **Contact** → `/contact/`

**Accessing Shortcuts:**
- **Android:** Long-press app icon
- **Desktop:** Right-click app icon

**Customizing Shortcuts:**

Edit `manifest.json`:

```json
{
  "shortcuts": [
    {
      "name": "Latest Articles",
      "short_name": "Articles",
      "description": "Read the latest blog posts",
      "url": "/blog/",
      "icons": [{ "src": "/assets/icons/icon-192x192.png", "sizes": "192x192" }]
    }
  ]
}
```

### PWA Analytics

Install and launch events are automatically tracked:

**Events Tracked:**
```javascript
// When app is installed
gtag('event', 'pwa_install', {
  'event_category': 'engagement',
  'event_label': 'pwa_installed'
})

// When app is launched (standalone mode)
gtag('event', 'pwa_launch', {
  'event_category': 'engagement',
  'event_label': 'pwa_opened'
})
```

**Viewing PWA Analytics:**
1. Open Google Analytics
2. Navigate to Events → All events
3. Filter by `pwa_install` or `pwa_launch`

### Troubleshooting PWA

**Install Button Not Appearing:**
- ✅ Check HTTPS (required for PWA)
- ✅ Verify `manifest.json` is valid
- ✅ Check Service Worker is registered (DevTools → Application)
- ✅ Meet installability criteria (visited 2+ times, 30+ seconds engagement)

**App Not Working Offline:**
1. Open DevTools → Application → Service Workers
2. Check if Service Worker is activated
3. View Cache Storage → Check cached files
4. Unregister and re-register Service Worker if needed

**Icons Not Showing:**
1. Verify icon files exist in `/assets/icons/`
2. Check `manifest.json` paths are correct
3. Clear cache and reinstall app

---

## Analytics & Tracking

The site uses Google Analytics 4 (GA4) to track user engagement and content performance.

### What's Being Tracked

**Automatic Events:**
- **Page Views:** Every page visit
- **Session Duration:** Time spent on site
- **Bounce Rate:** Single-page visits
- **Traffic Sources:** Where visitors come from
- **Device/Browser:** User environment

**Custom Events:**

| Event Name | Category | Description |
|------------|----------|-------------|
| `contact_click` | engagement | Email link clicks |
| `social_click` | engagement | LinkedIn link clicks |
| `outbound_link` | engagement | External link clicks |
| `related_post_click` | content_discovery | Related post clicks |
| `pwa_install` | engagement | PWA installation |
| `pwa_launch` | engagement | PWA app opened |

### Accessing Analytics

1. **Visit Google Analytics:**
   - URL: https://analytics.google.com
   - Property: `Fawad Rashidi - Executive Site`
   - Measurement ID: `G-YSLJNR3DWB`

2. **Navigate Reports:**
   - **Realtime:** Live visitor activity
   - **Engagement → Pages and screens:** Most viewed pages
   - **Engagement → Events:** Custom event tracking
   - **Acquisition → Traffic acquisition:** Traffic sources
   - **User → Demographics:** Audience insights

### Key Metrics to Monitor

**Content Performance:**
- **Top Pages:** Which posts/pages get the most traffic
- **Average Engagement Time:** How long users read
- **Related Post Clicks:** Content discovery effectiveness

**User Engagement:**
- **Contact Clicks:** How often visitors reach out
- **Social Clicks:** LinkedIn profile interest
- **PWA Installs:** App adoption rate

**Traffic Quality:**
- **Traffic Sources:** Where visitors come from
- **Bounce Rate:** Single-page visit percentage
- **Return Visitors:** Audience loyalty

### Event Tracking Code

Events are automatically tracked via JavaScript in `_layouts/default.html` and `index.html`:

```javascript
// Email clicks
const emailLinks = document.querySelectorAll('a[href^="mailto:"]');
emailLinks.forEach(link => {
  link.addEventListener('click', function() {
    gtag('event', 'contact_click', {
      'event_category': 'engagement',
      'event_label': 'email_click'
    });
  });
});

// Related post clicks
const relatedPostLinks = document.querySelectorAll('[data-event="related-post-click"]');
relatedPostLinks.forEach(link => {
  link.addEventListener('click', function() {
    gtag('event', 'related_post_click', {
      'event_category': 'content_discovery',
      'event_label': 'related_posts',
      'source_post': document.title,
      'target_post': this.getAttribute('data-post-title')
    });
  });
});
```

### Privacy Compliance

**Privacy Policy:**
- Location: `/privacy.html`
- Includes: Data collection disclosure, cookie usage, user rights
- Required for GDPR/CCPA compliance

**Cookie Consent:**
- Analytics cookies are used without consent (minimal data)
- Consider adding cookie banner for stricter compliance

**IP Anonymization:**
Google Analytics 4 automatically anonymizes IP addresses.

### Disabling Analytics (Testing)

**For local development**, analytics are active by default. To disable:

1. Comment out the Google Analytics script in `_layouts/default.html`:
   ```html
   <!-- Google tag (gtag.js) -->
   <!--
   <script async src="https://www.googletagmanager.com/gtag/js?id=G-YSLJNR3DWB"></script>
   <script>
     window.dataLayer = window.dataLayer || [];
     ...
   </script>
   -->
   ```

2. Or use browser extensions:
   - **uBlock Origin** (blocks analytics)
   - **Privacy Badger** (blocks trackers)

---

## Asset Optimization

The site includes an automated asset optimization pipeline that reduces file sizes for faster loading.

### What Gets Optimized

**CSS Files:**
- Minification: Remove whitespace and comments
- CSSO optimization: Advanced CSS optimization
- **Savings:** ~30-40% file size reduction

**HTML Files:**
- Whitespace collapse: Remove unnecessary spaces
- Comment removal: Strip HTML comments
- Inline CSS/JS minification: Optimize embedded code
- **Savings:** ~15-25% file size reduction

**Images (Future):**
- WebP conversion: Modern image format
- Compression: Reduce file sizes without quality loss
- Responsive images: Multiple sizes for different devices

### How Optimization Works

**Automated Process:**

1. **Trigger:** Every push to `main` branch
2. **GitHub Actions Workflow:** `.github/workflows/jekyll.yml`
3. **Steps:**
   - Build Jekyll site
   - Install optimization tools (csso-cli, html-minifier-terser)
   - Optimize all CSS files
   - Optimize all HTML files
   - Deploy optimized site to GitHub Pages

**Local Optimization Testing:**

Run the optimization script before deploying:

```bash
# Make script executable (first time only)
chmod +x scripts/optimize-assets.sh

# Run optimization
./scripts/optimize-assets.sh
```

**Script checks:**
- Jekyll is installed
- Site is built (`_site/` directory exists)
- Optimization tools are available
- Provides warnings if tools are missing

### Monitoring Optimization

**GitHub Actions Logs:**

1. Go to repository → **Actions** tab
2. Click the latest workflow run
3. Expand "Optimize CSS" and "Optimize HTML" steps
4. View optimization statistics:
   ```
   Optimizing: assets/main.css
   Original: 45.2 KB
   Optimized: 28.7 KB
   Savings: 36.5%
   ```

**Performance Metrics:**

Use **Google PageSpeed Insights** to measure impact:
1. Visit https://pagespeed.web.dev/
2. Enter site URL: `https://lab.fawad.ai`
3. View metrics:
   - **First Contentful Paint (FCP):** Time to first text/image
   - **Largest Contentful Paint (LCP):** Time to largest element
   - **Total Blocking Time (TBT):** Interactivity delay
   - **Cumulative Layout Shift (CLS):** Visual stability

**Target Scores:**
- **Performance:** 90-100 (green)
- **Accessibility:** 90-100
- **Best Practices:** 90-100
- **SEO:** 90-100

### Customizing Optimization

**To adjust CSS optimization**, edit `.github/workflows/jekyll.yml`:

```yaml
- name: Optimize CSS
  run: |
    find _site -name "*.css" -type f -exec sh -c '
      for file; do
        # Default: Aggressive optimization
        csso "$file" --output "$file"

        # For debugging: Preserve formatting
        # csso "$file" --output "$file" --format
      done
    ' sh {} +
```

**To adjust HTML optimization**, edit the workflow:

```yaml
- name: Optimize HTML
  run: |
    find _site -name "*.html" -type f | while read file; do
      html-minifier-terser \
        --collapse-whitespace \         # Remove extra whitespace
        --remove-comments \              # Remove HTML comments
        --minify-css true \              # Minify inline CSS
        --minify-js true \               # Minify inline JS
        "$file" -o "$file" 2>/dev/null || echo "⚠️ Skipped: $file"
    done
```

### Troubleshooting Optimization

**Build Failing After Optimization:**

1. Check Actions logs for errors
2. Common issues:
   - Invalid HTML syntax
   - Broken CSS (check syntax)
   - Missing optimization tools

**To disable optimization temporarily**, comment out steps in workflow:

```yaml
# - name: Optimize CSS
#   run: ...

# - name: Optimize HTML
#   run: ...
```

**CSS Not Loading After Optimization:**

1. Check if CSS file exists in `_site/assets/`
2. Verify file isn't empty: `ls -lh _site/assets/main.css`
3. Test with optimization disabled
4. Check for SCSS syntax errors

---

## Deployment

The site deploys automatically to GitHub Pages using GitHub Actions.

### Deployment Process

**Automatic Deployment:**

1. **Make changes** to any file in the repository
2. **Commit changes** to local repository
3. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Update blog post content"
   git push origin main
   ```
4. **GitHub Actions triggers** automatically
5. **Build completes** in ~2-5 minutes
6. **Site updates** at https://lab.fawad.ai

**No manual steps required** — push to deploy!

### Monitoring Deployments

**GitHub Actions Workflow:**

1. Navigate to repository → **Actions** tab
2. View workflow runs:
   ```
   ✅ Update blog post content - #123 (2m 34s)
   ✅ Add new board position - #122 (3m 12s)
   ❌ Fix typo in about page - #121 (Failed)
   ```

3. Click any run to view details:
   - **Build:** Jekyll build process
   - **Optimize CSS:** Asset optimization
   - **Optimize HTML:** HTML minification
   - **Deploy:** GitHub Pages deployment

**Email Notifications:**

GitHub sends email notifications for:
- ✅ Successful deployments
- ❌ Failed deployments
- ⚠️ Workflow warnings

**To configure notifications:**
1. Go to repository → **Settings** → **Notifications**
2. Choose notification preferences

### Deployment Status

**Check Current Deployment:**

1. Visit https://lab.fawad.ai
2. Verify changes are live
3. Check browser console for errors (F12)

**Deployment Timing:**
- **Push to live:** ~2-5 minutes average
- **Caching:** Cloudflare/GitHub may cache for up to 10 minutes
- **Force refresh:** Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)

### Custom Domain

The site uses a custom domain: **lab.fawad.ai**

**Configuration:**
- **CNAME file:** Contains `lab.fawad.ai`
- **DNS records:** Managed at domain registrar
- **HTTPS:** Automatically enabled by GitHub Pages

**DNS Configuration:**

```
Type: CNAME
Name: lab
Value: fawadafr.github.io
TTL: Auto
```

**Verifying DNS:**
```bash
dig lab.fawad.ai
# Should show CNAME to fawadafr.github.io
```

### Rollback Procedure

If a deployment breaks the site:

1. **Identify the breaking commit:**
   ```bash
   git log --oneline
   ```

2. **Revert to previous working commit:**
   ```bash
   git revert <commit-hash>
   git push origin main
   ```

3. **Or create a fix:**
   ```bash
   # Fix the issue
   git add .
   git commit -m "Fix deployment issue"
   git push origin main
   ```

**Alternative: Force push previous version:**
```bash
# ⚠️ Use with caution - overwrites history
git reset --hard <working-commit-hash>
git push --force origin main
```

### Troubleshooting Deployment

**Build Failing:**

1. **Check Actions logs** for error messages
2. **Common issues:**
   - YAML syntax errors in data files
   - Invalid Liquid template syntax
   - Missing required front matter
   - Broken links or images

**Build succeeds but changes not visible:**

1. **Clear browser cache:** Ctrl+Shift+R
2. **Wait 5-10 minutes** for CDN cache to expire
3. **Check DNS propagation:** https://dnschecker.org
4. **Verify file exists** in GitHub repository

**DNS/Domain Issues:**

1. **Verify CNAME file** contains correct domain
2. **Check DNS records** at domain registrar
3. **Wait for DNS propagation** (up to 48 hours for new changes)
4. **Test with dig command:**
   ```bash
   dig lab.fawad.ai
   ```

**HTTPS Certificate Issues:**

1. GitHub Pages auto-generates HTTPS certificates
2. May take up to 24 hours for initial setup
3. Check **Settings** → **Pages** → **Enforce HTTPS** is enabled

---

## Troubleshooting

### Common Issues

#### Search Not Working

**Symptoms:**
- Search box appears but no results
- Console errors about lunr.js

**Solutions:**

1. **Check if lunr.js is loading:**
   - Open DevTools → Network tab
   - Search for `lunr.min.js`
   - Verify status is 200 OK

2. **Verify search index exists:**
   - Check if `search.json` is generated
   - Visit `/search.json` in browser
   - Should show JSON with all posts

3. **Check JavaScript errors:**
   - Open DevTools → Console
   - Look for errors in `search.js`
   - Common fix: Clear cache and reload

---

#### Theme Toggle Not Persisting

**Symptoms:**
- Theme resets to light on every page load
- localStorage not saving preference

**Solutions:**

1. **Check browser localStorage:**
   ```javascript
   // In DevTools Console
   localStorage.getItem('theme')
   // Should return 'light' or 'dark'
   ```

2. **Verify JavaScript is running:**
   - Check for errors in Console
   - Ensure `assets/js/theme-toggle.js` is loaded

3. **Clear localStorage and retry:**
   ```javascript
   localStorage.clear()
   location.reload()
   ```

---

#### Related Posts Not Showing

**Symptoms:**
- No related posts at bottom of articles
- Empty related posts section

**Solutions:**

1. **Check if LSI is enabled:**
   ```yaml
   # _config.yml
   lsi: true
   ```

2. **Rebuild with LSI:**
   ```bash
   gem install classifier-reborn
   bundle exec jekyll build --lsi
   ```

3. **Verify minimum posts:**
   - Need at least 4 published posts for related posts

---

#### PWA Not Installing

**Symptoms:**
- Install button doesn't appear
- "Add to Home Screen" option missing

**Solutions:**

1. **Check PWA requirements:**
   - ✅ HTTPS enabled
   - ✅ manifest.json valid
   - ✅ Service Worker registered
   - ✅ At least 2 visits to site

2. **Validate manifest:**
   - DevTools → Application → Manifest
   - Check for errors

3. **Check Service Worker:**
   - DevTools → Application → Service Workers
   - Verify status is "Activated and running"

4. **Test installability:**
   - Chrome DevTools → Application → Manifest
   - Look for "Installability" section
   - Fix any listed errors

---

#### Slow Build Times

**Symptoms:**
- `jekyll build` takes >30 seconds
- GitHub Actions timeout

**Solutions:**

1. **Disable LSI for faster builds:**
   ```yaml
   # _config.yml
   lsi: false
   ```

2. **Exclude unnecessary files:**
   ```yaml
   # _config.yml
   exclude:
     - node_modules/
     - vendor/
     - .git/
     - scripts/
   ```

3. **Use incremental builds locally:**
   ```bash
   bundle exec jekyll serve --incremental
   ```

---

#### Analytics Not Tracking

**Symptoms:**
- No data in Google Analytics
- Events not firing

**Solutions:**

1. **Verify Measurement ID:**
   - Check `_layouts/default.html` has correct ID
   - Should be: `G-YSLJNR3DWB`

2. **Check if gtag.js is loading:**
   - DevTools → Network → Search for "gtag"
   - Verify 200 OK status

3. **Test event tracking:**
   ```javascript
   // In DevTools Console
   gtag('event', 'test_event', {
     'event_category': 'test',
     'event_label': 'manual_test'
   })
   ```

4. **Check ad blockers:**
   - Disable ad blockers for testing
   - Analytics may be blocked by privacy extensions

---

### Getting Help

**Resources:**

1. **Jekyll Documentation:**
   - https://jekyllrb.com/docs/

2. **GitHub Pages Documentation:**
   - https://docs.github.com/en/pages

3. **Repository Issues:**
   - Create issue at: https://github.com/fawadafr/fawadafr.github.io/issues

4. **Web Developer Tools:**
   - Chrome DevTools: F12 or Cmd+Option+I (Mac)
   - Firefox Developer Tools: F12 or Cmd+Option+I (Mac)

**When Reporting Issues:**

Include:
- Clear description of the problem
- Steps to reproduce
- Expected vs. actual behavior
- Browser/device information
- Screenshots or console errors (if applicable)

---

## Appendix

### Quick Reference

**Common Commands:**

```bash
# Local development
bundle exec jekyll serve

# Build site
bundle exec jekyll build

# Build with LSI
bundle exec jekyll build --lsi

# Optimize assets
./scripts/optimize-assets.sh

# Generate PWA icons
./scripts/generate-pwa-icons.sh

# Check YAML syntax
ruby -ryaml -e "YAML.load_file('_data/file.yml')"
```

**File Locations:**

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

**Front Matter Templates:**

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

---

**End of User Manual**

*For customization and styling instructions, see [Customization Guide](customization-guide.md)*

*For technical implementation details, see [PRD Implementation Report](prd-implementation-report.md)*
