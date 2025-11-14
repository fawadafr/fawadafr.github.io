# GitHub Pages Feature Roadmap 2025-2026

**Product:** Fawad Rashidi Executive Website
**Platform:** GitHub Pages + Jekyll
**Document Version:** 2.0
**Last Updated:** 2025-11-13
**Owner:** Executive Website Product Team

---

## Executive Summary

This roadmap outlines the strategic enhancement of the executive personal website over 6+ sprints, focusing on SEO visibility, user experience, and content management efficiency. The phased approach prioritizes foundational improvements (Schema.org, Analytics, Social Sharing) before advanced features (Automation, PWA).

**Key Metrics:**
- Target: 40% increase in organic search visibility (Q1 2026)
- Target: <3s page load time on mobile (Q2 2026)
- Target: 2%+ newsletter conversion rate (Q2 2026)

---

## Roadmap Timeline

```
2025 Q4              2026 Q1              2026 Q2              2026 Q3
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Sprint 1-2          Sprint 3-4          Sprint 5-6           Sprint 7+
 Foundation          Discovery           Engagement           Automation

 ✓ Custom Domain     • Search            • Related Posts      • CI/CD
 • Schema.org        • Data Files        • Pagination         • Asset Pipeline
 • OG/Twitter        • Accessibility     • Drafts/Schedule    • Advanced Collections
 • Analytics         • RSS Enhanced      • Newsletter         • PWA Features

 Milestone:          Milestone:          Milestone:           Milestone:
 SEO Foundation      Content UX          Audience Building    Tech Excellence
```

---

## Sprint 1-2: Foundation (2025 Q4)
**Timeline:** Weeks 1-4 | **Effort:** 9-14 hours | **Priority:** P0 - Critical

### Theme: Search Visibility & Professional Credibility

#### Features

##### 1. Custom Domain with Automatic HTTPS ✓
**Status:** ✅ COMPLETED
- CNAME configured for lab.fawad.ai
- SSL certificate auto-provisioned
- No action required

##### 2. Structured Data / Schema.org Markup
**Status:** 🔴 Not Started | **Effort:** 3-5h | **Owner:** TBD

**Implementation Tasks:**
- [ ] Add Person schema to homepage (`index.html`)
  - Name, title, image, sameAs (LinkedIn, Twitter)
  - Professional credentials, areas of expertise
- [ ] Add Article schema to blog post layout
  - Headline, author, datePublished, dateModified
  - Article body, image, publisher
- [ ] Add BreadcrumbList schema for navigation
- [ ] Validate via Google Rich Results Test

**Success Criteria:**
- ✅ Google Rich Results Test passes for Person schema
- ✅ All blog posts validate as Article schema
- ✅ Knowledge Panel eligibility confirmed

**Business Impact:** High - Foundation for Google Knowledge Panel, rich snippets in search results

**Dependencies:** None

---

##### 3. Enhanced Open Graph & Twitter Card Metadata
**Status:** 🟡 Partial (jekyll-seo-tag installed) | **Effort:** 4-6h | **Owner:** TBD

**Implementation Tasks:**
- [ ] Design and create default OG image (1200x630px)
  - Professional headshot or brand graphic
  - Consistent with executive brand guidelines
- [ ] Configure per-article custom OG images
- [ ] Set Twitter Card type to `summary_large_image`
- [ ] Add LinkedIn-specific meta tags
- [ ] Test previews on LinkedIn, Twitter, Facebook

**Success Criteria:**
- ✅ Professional preview card on LinkedIn shares
- ✅ Twitter Card validator passes
- ✅ Facebook sharing debugger passes
- ✅ Custom images for top 5 articles

**Business Impact:** High - Professional presentation when insights shared by board recruiters, event organizers

**Dependencies:**
- Design asset: Default OG image (1200x630px)
- Optional: Custom images per article (can phase in)

---

##### 4. Analytics Integration
**Status:** 🔴 Not Started | **Effort:** 2-3h | **Owner:** TBD

**Implementation Tasks:**
- [ ] **DECISION REQUIRED:** Select analytics provider
  - Option A: Plausible (privacy-focused, $9/mo, executive-friendly)
  - Option B: Google Analytics 4 (free, comprehensive)
  - Option C: Fathom ($14/mo, privacy-compliant)
- [ ] Create analytics account
- [ ] Add tracking code to site `<head>`
- [ ] Configure goal tracking:
  - Speaking page views
  - Contact link clicks
  - Newsletter signups (when available)
- [ ] Update privacy policy if required
- [ ] Test tracking in development

**Success Criteria:**
- ✅ Page view tracking functional across all pages
- ✅ Event tracking for key CTAs
- ✅ Privacy compliance (GDPR/CCPA if applicable)
- ✅ Dashboard accessible to stakeholders

**Business Impact:** Critical - Data-driven content strategy, understand audience demographics

**Dependencies:**
- Decision: Analytics provider selection (Blocker)
- Privacy policy update may be required

---

### Sprint 1-2 Milestones

| Milestone | Description | Success Metric |
|-----------|-------------|----------------|
| **SEO Foundation** | Schema markup validated and indexed | Google Rich Results Test passes |
| **Social Proof** | Professional social sharing operational | LinkedIn preview cards display |
| **Data Collection** | Analytics tracking all visitor behavior | 100% page view capture rate |

**Sprint 1-2 Deliverables:**
- ✅ Custom domain operational (completed)
- 🎯 Schema.org markup for Person + Article
- 🎯 OG/Twitter cards with custom images
- 🎯 Analytics tracking and dashboard

**Risk Mitigation:**
- Schema validation errors: Use Google's Structured Data Testing Tool iteratively
- OG image design delays: Start with default image, add custom per article later
- Analytics provider indecision: Default to Plausible for executive privacy focus

---

## Sprint 3-4: Discovery & Accessibility (2026 Q1)
**Timeline:** Weeks 5-10 | **Effort:** 17-24 hours | **Priority:** P1 - High

### Theme: Content Discovery & Inclusive Design

#### Features

##### 5. Search Functionality
**Status:** 🔴 Not Started | **Effort:** 6-8h | **Owner:** TBD

**Implementation Tasks:**
- [ ] **DECISION REQUIRED:** Select search solution
  - Option A: lunr.js (client-side, no dependencies)
  - Option B: Simple-Jekyll-Search (lightweight)
  - Option C: Algolia (SaaS, free tier available)
- [ ] Create search index JSON (posts, pages, speaking topics)
- [ ] Build search UI component
  - Search bar in header
  - Real-time results dropdown
  - Mobile-optimized interface
- [ ] Add keyboard navigation (Cmd/Ctrl+K to open)
- [ ] Test with 20+ posts for performance

**Success Criteria:**
- ✅ Search returns relevant results in <500ms
- ✅ Searches across posts, speaking topics, and pages
- ✅ Mobile-responsive interface
- ✅ Keyboard shortcuts functional

**Business Impact:** High - Visitors find specific expertise areas quickly; reduces bounce rate

**Dependencies:**
- Decision: Search solution selection
- Content volume: Test with realistic post count

---

##### 6. Jekyll Data Files for Dynamic Content
**Status:** 🔴 Not Started | **Effort:** 5-7h | **Owner:** TBD

**Implementation Tasks:**
- [ ] Create `_data/` directory structure
- [ ] Migrate board positions to `_data/board-service.yml`
  - Organization, role, tenure, description
  - Sort chronologically
- [ ] Create `_data/certifications.yml`
  - Certification name, issuer, year
- [ ] Create `_data/media-appearances.yml`
  - Publication, title, date, URL
- [ ] Update homepage to render from data files
- [ ] Document updating process in CLAUDE.md

**Success Criteria:**
- ✅ 3+ data files operational
- ✅ Homepage renders dynamically
- ✅ Manual HTML editing eliminated for recurring content
- ✅ Documentation for content updates

**Business Impact:** Medium-High - Faster content updates; single source of truth

**Dependencies:**
- Content audit: Identify all hardcoded dynamic content
- Migration effort: Extract existing content to YAML

---

##### 7. RSS Feed Enhancement
**Status:** 🟡 Partial (jekyll-feed installed) | **Effort:** 2-3h | **Owner:** TBD

**Implementation Tasks:**
- [ ] Customize feed template for full-text content
- [ ] Add featured images to feed items
- [ ] Configure feed metadata (logo, author info)
- [ ] Add categories/tags to feed
- [ ] Validate via W3C Feed Validator

**Success Criteria:**
- ✅ Full-text RSS feed operational
- ✅ Feed includes featured images
- ✅ W3C Feed Validator passes
- ✅ Feed autodiscovery in browsers

**Business Impact:** Medium - Professional subscribers can follow insights via RSS readers

**Dependencies:** None (jekyll-feed already installed)

---

##### 8. Accessibility Enhancements
**Status:** 🟡 Partial (minima theme baseline) | **Effort:** 4-6h | **Owner:** TBD

**Implementation Tasks:**
- [ ] Run accessibility audit (WAVE, axe DevTools)
- [ ] Add ARIA labels to navigation and interactive elements
- [ ] Ensure keyboard navigation throughout site
  - Tab order logical
  - Focus indicators visible
  - Escape closes modals/dropdowns
- [ ] Improve color contrast ratios (WCAG AA: 4.5:1)
- [ ] Add skip-to-content link
- [ ] Ensure all images have meaningful alt text
- [ ] Test with screen readers (NVDA on Windows, VoiceOver on Mac)

**Success Criteria:**
- ✅ WCAG 2.1 AA compliance (automated + manual testing)
- ✅ Keyboard navigation functional for all interactions
- ✅ Screen reader testing passes (no critical errors)
- ✅ Color contrast ratios meet 4.5:1 standard

**Business Impact:** High - Demonstrates inclusive leadership; legal compliance; broader reach

**Dependencies:**
- Accessibility audit tools (free: WAVE, axe DevTools)
- Screen reader testing environment

---

### Sprint 3-4 Milestones

| Milestone | Description | Success Metric |
|-----------|-------------|----------------|
| **Content Discovery** | Search functional and fast | <500ms search results |
| **Data Centralization** | Dynamic content via data files | 3+ data files operational |
| **Inclusive Design** | WCAG 2.1 AA compliance | Accessibility audit passes |

**Sprint 3-4 Deliverables:**
- 🎯 Site-wide search functionality
- 🎯 Data files for board service, certifications, media
- 🎯 Enhanced RSS feed with full content
- 🎯 WCAG 2.1 AA accessibility compliance

**Risk Mitigation:**
- Search performance issues: Use pagination/limits for large result sets
- Data file migration errors: Validate YAML syntax rigorously
- Accessibility compliance gaps: Prioritize critical issues (keyboard nav, screen readers)

---

## Sprint 5-6: Engagement & Audience Building (2026 Q2)
**Timeline:** Weeks 11-16 | **Effort:** 12-16 hours | **Priority:** P2 - Medium

### Theme: Visitor Engagement & Content Distribution

#### Features

##### 9. Related Posts Functionality
**Status:** 🔴 Not Started | **Effort:** 3-4h | **Owner:** TBD

**Implementation Tasks:**
- [ ] Configure Jekyll's built-in `related_posts` (LSI enabled)
- [ ] Create related posts section template
  - Grid layout (3 posts)
  - Title, excerpt, read time
- [ ] Add to blog post layout (bottom of article)
- [ ] Optimize for relevance (tags/categories)
- [ ] Fallback to recent posts if <3 related posts

**Success Criteria:**
- ✅ 3-5 related posts shown at end of articles
- ✅ Relevance based on tags/categories
- ✅ Responsive grid layout
- ✅ Click-through rate >15%

**Business Impact:** Medium - Increase time on site; demonstrate depth of expertise

**Dependencies:** Post tagging system (may require retroactive tagging)

---

##### 10. Pagination for Blog Posts
**Status:** 🔴 Not Started | **Effort:** 4-5h | **Owner:** TBD

**Implementation Tasks:**
- [ ] Add pagination to blog listing page
- [ ] Configure posts per page (10 recommended)
- [ ] Create pagination navigation component
  - Previous/Next buttons
  - Page numbers (if >3 pages)
- [ ] Add SEO tags (rel=prev, rel=next)
- [ ] Test with 20+ posts

**Success Criteria:**
- ✅ 10 posts per page on insights listing
- ✅ Previous/Next navigation functional
- ✅ SEO tags prevent duplicate content issues
- ✅ Mobile-optimized navigation

**Business Impact:** Medium - Scalability as content grows; faster page loads

**Dependencies:** Content volume (minimal value until 15+ posts)

---

##### 11. Draft Posts & Scheduled Publishing
**Status:** 🔴 Not Started | **Effort:** 2-3h | **Owner:** TBD

**Implementation Tasks:**
- [ ] Create `_drafts/` folder
- [ ] Document draft workflow in CLAUDE.md
  - `bundle exec jekyll serve --drafts` for preview
  - Move to `_posts/` with future date for scheduling
- [ ] Configure future post handling (excluded from production)
- [ ] Add editorial calendar template

**Success Criteria:**
- ✅ `_drafts/` folder operational
- ✅ Draft preview command documented
- ✅ Future-dated posts excluded from production build
- ✅ Workflow documentation for content team

**Business Impact:** Medium - Professional content workflow; strategic timing

**Dependencies:** None (built into Jekyll)

---

##### 12. Newsletter Signup Integration
**Status:** 🔴 Not Started | **Effort:** 3-4h | **Owner:** TBD

**Implementation Tasks:**
- [ ] **DECISION REQUIRED:** Select email service provider
  - Option A: Mailchimp (free tier: 500 contacts)
  - Option B: ConvertKit (designed for creators, $9/mo)
  - Option C: Substack (free, includes publishing platform)
- [ ] Create email service account
- [ ] Build signup form component
  - Name + email fields
  - Privacy-compliant (GDPR checkbox if applicable)
- [ ] Add form to footer or sidebar
- [ ] Configure double opt-in workflow
- [ ] Create welcome email sequence
- [ ] Test signup flow end-to-end

**Success Criteria:**
- ✅ Email signup form on all pages (footer)
- ✅ Privacy-compliant (GDPR/CCPA)
- ✅ Double opt-in confirmation functional
- ✅ Newsletter signup rate >2% of visitors

**Business Impact:** Medium - Direct communication channel; thought leadership distribution

**Dependencies:**
- Decision: Email service provider selection (Blocker)
- Privacy policy update required

---

### Sprint 5-6 Milestones

| Milestone | Description | Success Metric |
|-----------|-------------|----------------|
| **Engagement Lift** | Related posts drive deeper browsing | Session duration +20% |
| **Audience Capture** | Newsletter signups operational | >2% conversion rate |
| **Content Workflow** | Draft/schedule workflow documented | Editorial calendar in use |

**Sprint 5-6 Deliverables:**
- 🎯 Related posts on all articles
- 🎯 Pagination for blog archive
- 🎯 Draft workflow and future post scheduling
- 🎯 Newsletter signup integration

**Risk Mitigation:**
- Low newsletter signups: A/B test form placement and copy
- Related posts not relevant: Manual curation fallback
- Email provider costs: Start with free tier, upgrade based on growth

---

## Sprint 7+: Automation & Advanced Features (2026 Q3+)
**Timeline:** Weeks 17+ | **Effort:** 18-26 hours per sprint | **Priority:** P3 - Low

### Theme: Technical Excellence & Automation

#### Features (Selected)

##### 13. GitHub Actions for CI/CD
**Status:** 🔴 Not Started | **Effort:** 8-12h | **Priority:** P3

**Implementation:**
- Custom build workflow (replaces github-pages gem)
- Automated link checking (prevents broken links)
- Image optimization pipeline (WebP conversion)
- Lighthouse CI (performance monitoring)
- HTML validation

**Business Impact:** Medium - Quality assurance automation; performance optimization

**Note:** Requires switching from github-pages gem to custom GitHub Actions workflow (breaking change)

---

##### 14. Asset Pipeline Optimization
**Status:** 🟡 Partial (Sass compilation) | **Effort:** 4-6h | **Priority:** P3

**Implementation:**
- CSS/JavaScript minification
- Image lazy loading
- WebP format support with fallbacks
- Browser caching headers

**Business Impact:** Medium - Page speed improvements; SEO benefits (Core Web Vitals)

---

##### 15. Advanced Collections
**Status:** 🟡 Partial (_speaking collection exists) | **Effort:** 6-8h | **Priority:** P3

**Implementation:**
- `_insights/` collection (separate from blog)
- `_board-service/` collection (board positions with custom layout)
- `_media-appearances/` collection
- Collection-specific archive pages

**Business Impact:** Medium - Specialized layouts; improved content organization

---

##### 16. Progressive Web App (PWA) Features
**Status:** 🔴 Not Started | **Effort:** 8-10h | **Priority:** P3

**Implementation:**
- Web app manifest
- Service worker (offline support)
- App icons and splash screens
- Install prompt

**Business Impact:** Low - Enhanced mobile experience; offline reading

---

### Sprint 7+ Focus Areas
- **Automation:** CI/CD, quality checks, performance monitoring
- **Performance:** Asset optimization, lazy loading, caching
- **Content Architecture:** Advanced collections, taxonomy improvements
- **Mobile Experience:** PWA features, mobile-first enhancements

---

## Feature Comparison Matrix

| Feature | Status | Priority | Effort | SEO Impact | UX Impact | Content Impact |
|---------|--------|----------|--------|------------|-----------|----------------|
| Custom Domain HTTPS | ✅ Complete | P0 | 0h | ⭐⭐⭐ | ⭐⭐⭐ | - |
| Schema.org Markup | 🔴 Not Started | P0 | 3-5h | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| OG/Twitter Cards | 🟡 Partial | P0 | 4-6h | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Analytics | 🔴 Not Started | P0 | 2-3h | ⭐⭐⭐ | - | ⭐⭐⭐⭐⭐ |
| Search | 🔴 Not Started | P1 | 6-8h | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Data Files | 🔴 Not Started | P1 | 5-7h | ⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| RSS Enhanced | 🟡 Partial | P1 | 2-3h | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| Accessibility | 🟡 Partial | P1 | 4-6h | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | - |
| Related Posts | 🔴 Not Started | P2 | 3-4h | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| Pagination | 🔴 Not Started | P2 | 4-5h | ⭐⭐⭐ | ⭐⭐⭐ | - |
| Drafts/Schedule | 🔴 Not Started | P2 | 2-3h | - | - | ⭐⭐⭐⭐⭐ |
| Newsletter | 🔴 Not Started | P2 | 3-4h | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| GitHub Actions | 🔴 Not Started | P3 | 8-12h | ⭐⭐ | ⭐⭐ | - |
| Asset Optimization | 🟡 Partial | P3 | 4-6h | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | - |
| Advanced Collections | 🟡 Partial | P3 | 6-8h | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| PWA Features | 🔴 Not Started | P3 | 8-10h | ⭐ | ⭐⭐⭐ | - |

**Legend:**
- ✅ Complete | 🟡 Partial | 🔴 Not Started
- ⭐ (Low) → ⭐⭐⭐⭐⭐ (Critical)

---

## Decision Log

### Critical Decisions Required Before Sprint Start

| Decision | Options | Recommendation | Deadline | Owner |
|----------|---------|----------------|----------|-------|
| **Analytics Provider** | Plausible / GA4 / Fathom | **Plausible** (privacy-focused, executive brand) | Before Sprint 1 | Product Owner |
| **Search Solution** | lunr.js / Simple-Jekyll-Search / Algolia | **lunr.js** (no dependencies, privacy) | Before Sprint 3 | Tech Lead |
| **Email Provider** | Mailchimp / ConvertKit / Substack | **ConvertKit** (creator-focused) | Before Sprint 5 | Marketing |

### Decisions Made

| Date | Decision | Rationale |
|------|----------|-----------|
| 2025-11-12 | Use standalone HTML instead of Jekyll theme | Greater design control, performance |
| 2025-11-12 | Custom domain: lab.fawad.ai | Executive branding, memorable URL |

---

## Dependencies & Blockers

### External Dependencies

| Dependency | Required For | Blocker Status | Mitigation |
|------------|--------------|----------------|------------|
| Analytics Provider Selection | Sprint 1 (Analytics) | 🔴 **BLOCKER** | Decision required by Week 1 |
| OG Image Design | Sprint 1 (Social Sharing) | 🟡 Risk | Use placeholder, iterate |
| Email Service Provider | Sprint 5 (Newsletter) | 🟢 No Blocker | Decision by Sprint 4 |
| Content Tagging | Sprint 5 (Related Posts) | 🟡 Risk | Retroactive tagging task |

### Technical Constraints

- **GitHub Pages Plugins:** Limited to whitelisted plugins (unless using GitHub Actions)
- **Build Time:** GitHub Pages has ~10 minute build timeout
- **Static Site:** No server-side processing (all client-side or build-time)
- **Jekyll Version:** GitHub Pages uses specific Jekyll version (check compatibility)

---

## Success Metrics & KPIs

### Sprint 1-2: Foundation
- ✅ Google Rich Results Test passes (Person + Article schemas)
- ✅ LinkedIn/Twitter preview cards display correctly
- ✅ Analytics tracking 100% of page views
- 🎯 Target: 10% increase in search impressions (2 months post-launch)

### Sprint 3-4: Discovery
- ✅ Search returns results in <500ms
- ✅ WCAG 2.1 AA compliance (audit passes)
- ✅ 3+ data files operational
- 🎯 Target: 20% reduction in bounce rate (search-enabled pages)

### Sprint 5-6: Engagement
- ✅ Newsletter signup rate >2% of visitors
- ✅ Related posts CTR >15%
- ✅ Average session duration +20% (vs. Sprint 1 baseline)
- 🎯 Target: 100 newsletter subscribers in 3 months

### Sprint 7+: Automation
- ✅ Lighthouse performance score >90
- ✅ Zero broken links (automated checks)
- ✅ Build time <2 minutes
- 🎯 Target: Core Web Vitals "Good" rating

---

## Risk Assessment

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Analytics provider indecision delays Sprint 1 | Medium | High | Set decision deadline; default to Plausible |
| OG image design delays social sharing | Medium | Medium | Use default placeholder; iterate with custom images |
| Accessibility audit reveals major issues | Low | High | Minima theme has baseline compliance; incremental fixes |
| Search performance issues with large content | Low | Medium | Pagination/limits for result sets |
| Newsletter provider costs exceed budget | Low | Low | Start with free tier; validate ROI before upgrade |
| GitHub Actions migration complexity | Medium | High | Defer to Sprint 7+; not critical path |

---

## Maintenance & Review Cadence

### Sprint Reviews
- **Frequency:** Every 2 weeks (end of each sprint)
- **Attendees:** Product Owner, Tech Lead, Content Team
- **Agenda:**
  - Demo completed features
  - Review success metrics
  - Identify blockers for next sprint
  - Adjust roadmap priorities

### Quarterly Roadmap Reviews
- **Frequency:** Every 3 months
- **Next Review:** 2026-02-13
- **Review Criteria:**
  - Analytics insights (top content, traffic sources)
  - User feedback (if available)
  - Technology changes (new Jekyll features, GitHub Pages updates)
  - Business priorities (speaking engagements, board searches, media)

### Post-Launch Monitoring (Ongoing)
- **Analytics:** Weekly review of key metrics
- **Performance:** Monthly Lighthouse audits
- **SEO:** Monthly search ranking and impression tracking
- **Accessibility:** Quarterly audits (WCAG compliance)

---

## Appendix

### A. Recommended Tools & Resources

**SEO & Schema:**
- [Google Rich Results Test](https://search.google.com/test/rich-results)
- [Schema.org Documentation](https://schema.org/)
- [Google Search Console](https://search.google.com/search-console)

**Social Sharing:**
- [Twitter Card Validator](https://cards-dev.twitter.com/validator)
- [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
- [LinkedIn Post Inspector](https://www.linkedin.com/post-inspector/)

**Accessibility:**
- [WAVE Browser Extension](https://wave.webaim.org/extension/)
- [axe DevTools](https://www.deque.com/axe/devtools/)
- [WCAG 2.1 Quickref](https://www.w3.org/WAI/WCAG21/quickref/)

**Performance:**
- [Google Lighthouse](https://developers.google.com/web/tools/lighthouse)
- [WebPageTest](https://www.webpagetest.org/)
- [GTmetrix](https://gtmetrix.com/)

**Analytics:**
- [Plausible Analytics](https://plausible.io/)
- [Google Analytics 4](https://analytics.google.com/)
- [Fathom Analytics](https://usefathom.com/)

### B. Jekyll Resources
- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Jekyll Plugins](https://jekyllrb.com/docs/plugins/)
- [Liquid Template Language](https://shopify.github.io/liquid/)

### C. Glossary
- **OG (Open Graph):** Meta tags that control how URLs are displayed on social media
- **Schema.org:** Structured data vocabulary for search engines
- **WCAG:** Web Content Accessibility Guidelines
- **RSS:** Really Simple Syndication (content feed format)
- **PWA:** Progressive Web App
- **LSI:** Latent Semantic Indexing (for related posts)
- **CI/CD:** Continuous Integration/Continuous Deployment

---

## Document Change Log

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 2.0 | 2025-11-13 | Product Team | Restructured as timeline-based roadmap; added decision log, KPIs, risk assessment |
| 1.0 | 2025-11-13 | Product Team | Initial capabilities catalog |

---

**Next Steps:**
1. ✅ Finalize analytics provider decision
2. ✅ Kickoff Sprint 1-2 planning meeting
3. ✅ Assign feature owners
4. ✅ Set up project tracking (GitHub Projects or Trello)
5. ✅ Begin Sprint 1 implementation

**Questions or Feedback:** Contact the product team or open a GitHub issue.
