# Customization & Styling Guide
**Fawad Rashidi CTO Website**
**Version:** 1.0
**Last Updated:** 2025-11-15

---

## Table of Contents

1. [Design System Overview](#design-system-overview)
2. [CSS Architecture](#css-architecture)
3. [Design Tokens](#design-tokens)
4. [Typography System](#typography-system)
5. [Color Customization](#color-customization)
6. [Spacing & Layout](#spacing--layout)
7. [Component Styling](#component-styling)
8. [Theme Customization](#theme-customization)
9. [Responsive Design](#responsive-design)
10. [Advanced Customization](#advanced-customization)

---

## Design System Overview

### Philosophy

The site uses a **minimalist, zen-inspired design system** based on Anthropic's design principles:

- **Typography as Interface:** Fira Code monospace for all text
- **Fluid Scaling:** CSS `clamp()` for responsive typography and spacing
- **Simplicity First:** Generous whitespace, limited color palette
- **Accessibility:** WCAG 2.1 AA compliant
- **Performance:** Minimal CSS, no frameworks

### Architecture

```
assets/main.scss                 # Main entry point (imports only)
├── base/
│   ├── reset.scss              # CSS reset
│   ├── tokens.scss             # Design tokens (colors, fonts, spacing)
│   └── typography.scss         # Base typography styles
├── layouts/
│   ├── sections.scss           # Section layouts
│   └── post.scss               # Blog post layouts
├── components/
│   ├── header.scss             # Header/navigation
│   ├── hero.scss               # Hero section
│   ├── footer.scss             # Footer
│   ├── cards.scss              # Content cards
│   ├── tags.scss               # Tag components
│   ├── search.scss             # Search UI
│   ├── related-posts.scss      # Related posts section
│   └── credentials.scss        # Board/certs/media sections
└── utilities/
    ├── accessibility.scss      # A11y helpers
    └── helpers.scss            # Utility classes
```

---

## CSS Architecture

### SMACSS Methodology

The CSS follows **Scalable and Modular Architecture for CSS (SMACSS)**:

- **Base:** Reset and element defaults
- **Layout:** Major page sections and grids
- **Components:** Reusable UI components
- **Utilities:** Helper classes and accessibility

### Editing Styles

**Location:** All styles are in `_sass/` directory
**Entry Point:** `assets/main.scss` (only contains imports)

**To modify styles:**

1. **Never edit** `assets/main.css` (auto-generated)
2. **Always edit** files in `_sass/` directory
3. Changes auto-compile on save (Jekyll watches `_sass/`)

**Example workflow:**

```bash
# 1. Edit a SCSS file
vim _sass/components/header.scss

# 2. Jekyll auto-compiles (if server running)
bundle exec jekyll serve

# 3. Refresh browser to see changes
```

---

## Design Tokens

### Location

**File:** `_sass/base/_tokens.scss`

All design tokens are CSS custom properties (variables) defined in `:root`.

### Color Tokens

#### Light Mode (Default)

```scss
:root {
  /* Backgrounds */
  --color-bg: #FAFAFA;           /* Off-white page background */
  --color-surface: #FFFFFF;      /* White cards/sections */

  /* Text */
  --color-text-primary: #1A1A1A;   /* Near-black body text */
  --color-text-secondary: #6B6B6B; /* Mid-gray metadata */

  /* UI */
  --color-border: #E5E5E5;       /* Subtle borders */
  --color-accent: #2563EB;       /* Blue (links, CTAs) */
  --color-code-bg: #F5F5F5;      /* Code block background */

  /* Tags */
  --color-tag-bg: #E5E7EB;       /* Tag background */
  --color-tag-text: #4B5563;     /* Tag text */
}
```

#### Dark Mode

```scss
[data-theme="dark"] {
  --color-bg: #0A0A0A;           /* Near-black background */
  --color-surface: #1A1A1A;      /* Elevated surface */
  --color-text-primary: #E5E5E5; /* Off-white text */
  --color-text-secondary: #9CA3AF; /* Mid-gray metadata */
  --color-border: #2A2A2A;       /* Subtle borders */
  --color-accent: #60A5FA;       /* Lighter blue (contrast) */
  --color-code-bg: #1F1F1F;      /* Elevated code blocks */
  --color-tag-bg: #1F2937;       /* Tag background */
  --color-tag-text: #9CA3AF;     /* Tag text */
}
```

### Typography Tokens

**Font Stacks:**

```scss
--font-primary: 'Fira Code', 'SF Mono', 'Monaco', 'Courier New', monospace;
```

**Type Scale** (Fluid with `clamp()`):

```scss
/* Detail/Metadata */
--text-detail-xs: clamp(0.6875rem, 0.668rem + 0.082vw, 0.75rem);  /* 11-12px */

/* Paragraphs */
--text-para-s: clamp(1rem, 0.962rem + 0.163vw, 1.125rem);         /* 16-18px */
--text-para-m: clamp(1.125rem, 1.087rem + 0.163vw, 1.25rem);      /* 18-20px */
--text-para-l: clamp(1.375rem, 1.337rem + 0.163vw, 1.5rem);       /* 22-24px */

/* Display/Headings */
--text-display-xs: clamp(1.125rem, 1.087rem + 0.163vw, 1.25rem);  /* 18-20px */
--text-display-s: clamp(1.25rem, 1.173rem + 0.327vw, 1.5rem);     /* 20-24px */
--text-display-m: clamp(1.75rem, 1.673rem + 0.327vw, 2rem);       /* 28-32px */
--text-display-l: clamp(2rem, 1.694rem + 1.306vw, 3rem);          /* 32-48px */
--text-display-xl: clamp(2.5rem, 2.041rem + 1.959vw, 4rem);       /* 40-64px */
--text-display-xxl: clamp(3rem, 2.388rem + 2.612vw, 5rem);        /* 48-80px */
```

**Line Heights:**

```scss
--leading-tight: 1.2;   /* Headings */
--leading-normal: 1.5;  /* Body text */
--leading-loose: 1.7;   /* Long-form articles */
```

**Font Weights:**

```scss
--font-normal: 400;  /* Regular */
--font-medium: 500;  /* Emphasis */
```

### Spacing Tokens

**Fixed Spacing** (Small values):

```scss
--space-1: 0.25rem;  /*  4px */
--space-2: 0.5rem;   /*  8px */
--space-3: 0.75rem;  /* 12px */
--space-4: 1rem;     /* 16px */
--space-6: 1.5rem;   /* 24px */
```

**Fluid Spacing** (Large values with `clamp()`):

```scss
--space-8: clamp(1.75rem, 1.673rem + 0.327vw, 2rem);    /* 28-32px */
--space-12: clamp(2.25rem, 2.020rem + 0.980vw, 3rem);   /* 36-48px */
--space-16: clamp(2.5rem, 2.041rem + 1.959vw, 4rem);    /* 40-64px */
--space-24: clamp(3rem, 2.388rem + 2.612vw, 5rem);      /* 48-80px */

/* Site Margins (responsive) */
--site-margin: clamp(2rem, 1.082rem + 3.918vw, 5rem);   /* 32-80px */
```

### Layout Tokens

```scss
--content-width: 680px;   /* Optimal reading width for articles */
--wide-width: 1024px;     /* For grids, case studies, homepage */
```

---

## Typography System

### Usage Mapping

| Element | Token | Output Size |
|---------|-------|-------------|
| Hero Title | `--text-display-xxl` | 48px → 80px |
| Page Titles | `--text-display-xl` | 40px → 64px |
| Section Headings | `--text-display-l` | 32px → 48px |
| H2 Headings | `--text-display-m` | 28px → 32px |
| H3 Headings | `--text-display-s` | 20px → 24px |
| Body Text | `--text-para-m` | 18px → 20px |
| Secondary Text | `--text-para-s` | 16px → 18px |
| Metadata/Tags | `--text-detail-xs` | 11px → 12px |

### Customizing Typography

**File:** `_sass/base/_typography.scss`

**Example - Change body text size:**

```scss
body {
  font-family: var(--font-primary);
  font-size: var(--text-para-l);  /* Changed from --text-para-m */
  line-height: var(--leading-normal);
  color: var(--color-text-primary);
}
```

**Example - Change heading styles:**

```scss
h1, .h1 {
  font-family: var(--font-primary);
  font-size: var(--text-display-xl);  /* Bigger headings */
  font-weight: var(--font-medium);
  line-height: var(--leading-tight);
  margin-bottom: var(--space-8);
}
```

---

## Color Customization

### Changing Brand Colors

**File:** `_sass/base/_tokens.scss`

**Step 1:** Update accent color (primary brand color):

```scss
:root {
  --color-accent: #2563EB;  /* Change to your brand blue */
}

[data-theme="dark"] {
  --color-accent: #60A5FA;  /* Lighter version for dark mode */
}
```

**Step 2:** Update PWA theme color:

**File:** `manifest.json`

```json
{
  "theme_color": "#2563EB",  /* Match --color-accent */
  "background_color": "#FAFAFA"
}
```

**File:** `_includes/pwa.html`

```html
<meta name="theme-color" content="#2563EB" media="(prefers-color-scheme: light)">
<meta name="theme-color" content="#60A5FA" media="(prefers-color-scheme: dark)">
```

### Creating Custom Color Schemes

Add new color tokens in `_sass/base/_tokens.scss`:

```scss
:root {
  /* Custom success/error colors */
  --color-success: #10B981;
  --color-error: #EF4444;
  --color-warning: #F59E0B;

  /* Custom gradients */
  --gradient-hero: linear-gradient(135deg, #2563EB 0%, #60A5FA 100%);
}
```

Use in components:

```scss
.success-message {
  background: var(--color-success);
  color: white;
}
```

---

## Spacing & Layout

### Content Width

**File:** `_sass/layouts/_sections.scss`

```scss
.main-content {
  max-width: var(--wide-width);    /* 1024px */
  margin: 0 auto;
  padding: var(--space-16) var(--site-margin);
}
```

**Change max width:**

```scss
.main-content {
  max-width: 1200px;  /* Wider layout */
}
```

### Section Spacing

```scss
.section {
  margin-bottom: var(--space-24);  /* Default: 48-80px */
}

/* Tighter spacing */
.section-compact {
  margin-bottom: var(--space-12);  /* 36-48px */
}
```

### Responsive Margins

Site margins auto-adjust based on viewport:

```scss
--site-margin: clamp(2rem, 1.082rem + 3.918vw, 5rem);
/* Mobile (320px): 32px margin */
/* Desktop (1920px): 80px margin */
```

**Override for specific sections:**

```scss
.full-width-section {
  padding-left: var(--space-4);   /* Fixed 16px instead of fluid */
  padding-right: var(--space-4);
}
```

---

## Component Styling

### Header/Navigation

**File:** `_sass/components/_header.scss`

**Customize header height:**

```scss
.site-header {
  padding: var(--space-6) var(--site-margin);  /* Current: 24px top/bottom */
  /* Change to: */
  padding: var(--space-8) var(--site-margin);  /* 28-32px top/bottom */
}
```

**Customize logo/site name:**

```scss
.site-logo {
  font-size: var(--text-display-s);   /* Current */
  font-weight: var(--font-medium);
  color: var(--color-text-primary);

  /* Make it bigger and bold */
  font-size: var(--text-display-m);
  font-weight: 600;
  letter-spacing: -0.02em;
}
```

### Hero Section

**File:** `_sass/components/_hero.scss`

**Customize hero appearance:**

```scss
.hero {
  padding: var(--space-24) var(--site-margin);  /* Current */
  text-align: center;                            /* Current */

  /* Full-bleed hero with background */
  padding: var(--space-24) 0;
  background: linear-gradient(135deg, #2563EB 0%, #60A5FA 100%);
  color: white;
}

.hero h1 {
  font-size: var(--text-display-xxl);  /* Current: 48-80px */

  /* Make it even bigger */
  font-size: clamp(3.5rem, 3rem + 3vw, 6rem);  /* 56px → 96px */
}
```

### Cards

**File:** `_sass/components/_cards.scss`

**Customize card appearance:**

```scss
.content-card {
  padding: var(--space-6);              /* Current */
  border: 1px solid var(--color-border);
  background: var(--color-surface);

  /* Add shadow and rounded corners */
  padding: var(--space-8);
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  border: none;
}

.content-card:hover {
  /* Add hover effect */
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
  transition: all 0.3s ease;
}
```

### Tags

**File:** `_sass/components/_tags.scss`

**Customize tag styles:**

```scss
.tag {
  padding: var(--space-1) var(--space-3);
  background: var(--color-tag-bg);
  color: var(--color-tag-text);
  border-radius: 3px;                    /* Current */

  /* Make tags pill-shaped */
  border-radius: 999px;
  font-weight: var(--font-medium);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}
```

---

## Theme Customization

### Adding a New Theme

**Step 1:** Add theme variant in `_sass/base/_tokens.scss`:

```scss
[data-theme="sepia"] {
  --color-bg: #F4ECD8;
  --color-surface: #FFF9E6;
  --color-text-primary: #3E2723;
  --color-text-secondary: #795548;
  --color-border: #D7CCC8;
  --color-accent: #FF6F00;
  --color-code-bg: #EFEBE9;
}
```

**Step 2:** Add theme toggle logic in `_includes/scripts.html`:

```javascript
function setTheme(theme) {
  document.documentElement.setAttribute('data-theme', theme);
  localStorage.setItem('theme', theme);
}

// Add sepia theme option
const themeToggle = document.getElementById('themeToggle');
// Cycle through: light → dark → sepia → light
```

### Customizing Theme Toggle

**File:** `_sass/components/_header.scss`

```scss
.theme-toggle {
  background: transparent;
  border: none;
  cursor: pointer;

  /* Add visual feedback */
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 8px;
  padding: var(--space-2);
  transition: background 0.2s;
}

.theme-toggle:hover {
  background: var(--color-accent);
  color: white;
}
```

---

## Responsive Design

### Breakpoints

The site uses **fluid design** (no hard breakpoints) via `clamp()`, but provides fallback breakpoints:

```scss
/* Mobile-first approach */
@media (min-width: 768px) {
  /* Tablet and up */
}

@media (min-width: 1024px) {
  /* Desktop and up */
}
```

### Mobile-Specific Customization

**Example - Stack navigation on mobile:**

```scss
.site-nav {
  display: flex;
  gap: var(--space-6);

  @media (max-width: 767px) {
    flex-direction: column;
    position: fixed;
    top: 0;
    right: -100%;
    width: 80%;
    height: 100vh;
    background: var(--color-surface);
    transition: right 0.3s;

    &.open {
      right: 0;
    }
  }
}
```

---

## Advanced Customization

### Custom Animations

Add animations in a new file `_sass/utilities/_animations.scss`:

```scss
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.fade-in {
  animation: fadeIn 0.6s ease-out;
}
```

Import in `assets/main.scss`:

```scss
@import 'utilities/animations';
```

### Adding Dark Mode Images

Swap images based on theme:

```scss
.hero-image {
  content: url('/assets/images/hero-light.svg');
}

[data-theme="dark"] .hero-image {
  content: url('/assets/images/hero-dark.svg');
}
```

### Custom Component Example

Create `_sass/components/_custom.scss`:

```scss
.custom-feature {
  padding: var(--space-12);
  background: var(--color-surface);
  border-left: 4px solid var(--color-accent);
  margin: var(--space-8) 0;

  .custom-title {
    font-size: var(--text-display-m);
    color: var(--color-accent);
    margin-bottom: var(--space-4);
  }

  .custom-content {
    font-size: var(--text-para-m);
    line-height: var(--leading-loose);
  }
}
```

Import in `assets/main.scss`:

```scss
@import 'components/custom';
```

Use in HTML:

```html
<div class="custom-feature">
  <h3 class="custom-title">Custom Feature</h3>
  <div class="custom-content">
    Content goes here...
  </div>
</div>
```

---

## Quick Reference

### Common Customizations

| What to Change | File | Variable/Class |
|----------------|------|----------------|
| Brand Color | `_sass/base/_tokens.scss` | `--color-accent` |
| Body Text Size | `_sass/base/_typography.scss` | `body { font-size }` |
| Page Width | `_sass/layouts/_sections.scss` | `--wide-width` |
| Header Height | `_sass/components/_header.scss` | `.site-header { padding }` |
| Card Style | `_sass/components/_cards.scss` | `.content-card` |
| Spacing | `_sass/base/_tokens.scss` | `--space-*` tokens |

### Color Palette Reference

| Usage | Light Mode | Dark Mode |
|-------|------------|-----------|
| Background | `#FAFAFA` | `#0A0A0A` |
| Surface | `#FFFFFF` | `#1A1A1A` |
| Primary Text | `#1A1A1A` | `#E5E5E5` |
| Secondary Text | `#6B6B6B` | `#9CA3AF` |
| Accent | `#2563EB` | `#60A5FA` |
| Border | `#E5E5E5` | `#2A2A2A` |

---

## Best Practices

1. **Always use design tokens** - Never hardcode colors/sizes
2. **Mobile-first** - Design for small screens, enhance for large
3. **Test both themes** - Ensure changes work in light and dark mode
4. **Preserve accessibility** - Maintain 4.5:1 contrast ratios
5. **Keep it minimal** - Add only what's necessary
6. **Use fluid typography** - Embrace `clamp()` for responsive scaling
7. **Namespace custom styles** - Prefix with `.custom-*` to avoid conflicts

---

**Last Updated:** 2025-11-15
**Maintainer:** Fawad Rashidi
**Questions?** Review the code in `_sass/` or consult [Jekyll Sass documentation](https://jekyllrb.com/docs/assets/)
