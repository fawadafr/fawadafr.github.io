# Sprint 1-2: Foundation

**Sprint Duration:** Weeks 1-4 (2025 Q4)
**Total Effort:** 9-14 hours
**Priority:** P0 - Critical
**Theme:** Search Visibility & Professional Credibility

---

## Sprint Goals

1. **Establish SEO Foundation**: Implement Schema.org markup to enable Google Knowledge Panel and rich snippets
2. **Professional Social Sharing**: Create polished preview cards for LinkedIn/Twitter shares
3. **Data-Driven Insights**: Set up analytics to understand audience behavior
4. **Verify Custom Domain**: Confirm HTTPS and custom domain configuration

**Success Metric:** All features validated via automated testing tools (Google Rich Results Test, social media validators, analytics tracking)

---

## Sprint Backlog

### Epic 1: Structured Data Implementation
**Priority:** P0 - Critical | **Effort:** 3-5 hours

#### User Story 1.1: Person Schema on Homepage
**As a** board recruiter or speaking event organizer
**I want** to see rich information about Fawad in search results
**So that** I can quickly assess his credentials and contact information

**Acceptance Criteria:**
- [ ] Add JSON-LD script tag to homepage (`index.html`) with Person schema
- [ ] Include the following fields:
  - `@type`: "Person"
  - `name`: "Fawad Rashidi"
  - `jobTitle`: [Current executive title]
  - `image`: [Professional headshot URL]
  - `url`: "https://lab.fawad.ai"
  - `sameAs`: [LinkedIn, Twitter profile URLs]
  - `knowsAbout`: [Key expertise areas as array]
  - `alumniOf`: [Educational institutions]
- [ ] Validate via Google Rich Results Test (no errors)
- [ ] Test renders correctly in search results preview
- [ ] Confirm Knowledge Panel eligibility criteria met

**Technical Notes:**
- Use `<script type="application/ld+json">` tag in `<head>` section
- Follow Schema.org Person specification: https://schema.org/Person
- Reference: https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data

**Definition of Done:**
- [ ] Code committed and deployed
- [ ] Google Rich Results Test passes with 0 errors
- [ ] Peer review completed
- [ ] Documentation updated in CLAUDE.md

---

#### User Story 1.2: Article Schema for Blog Posts
**As a** professional subscriber or content aggregator
**I want** blog posts to display rich metadata in search and RSS readers
**So that** I can see author, publish date, and article summary at a glance

**Acceptance Criteria:**
- [ ] Create reusable Article schema template for blog post layout
- [ ] Include the following fields:
  - `@type`: "Article" or "BlogPosting"
  - `headline`: Post title
  - `author`: Person schema reference
  - `datePublished`: ISO 8601 format
  - `dateModified`: ISO 8601 format
  - `image`: Featured image URL (1200x630px)
  - `publisher`: Organization schema for the website
  - `description`: Post excerpt
  - `articleBody`: Full text content
- [ ] Apply to all existing blog posts
- [ ] Validate 3 sample posts via Google Rich Results Test
- [ ] Ensure backward compatibility with existing posts

**Technical Notes:**
- Add to blog post layout template
- Use Liquid templating to populate from front matter
- Fallback to post creation date if dateModified not specified

**Definition of Done:**
- [ ] Schema applied to all blog posts
- [ ] Sample validation passes (3 posts tested)
- [ ] No console errors or warnings
- [ ] Documentation updated

---

#### User Story 1.3: BreadcrumbList Schema for Navigation
**As a** site visitor
**I want** clear navigation breadcrumbs in search results
**So that** I understand the site structure before clicking

**Acceptance Criteria:**
- [ ] Implement BreadcrumbList schema on all non-homepage pages
- [ ] Include position, name, and URL for each breadcrumb
- [ ] Test on blog posts, speaking pages, and static pages
- [ ] Validate via Google Rich Results Test

**Technical Notes:**
- Add to base layout template
- Automatically generate from page hierarchy
- Example: Home > Writing > [Post Title]

**Definition of Done:**
- [ ] BreadcrumbList implemented site-wide
- [ ] Validation passes for sample pages
- [ ] Renders correctly in search results preview

---

### Epic 2: Social Media Optimization
**Priority:** P0 - Critical | **Effort:** 4-6 hours

#### User Story 2.1: Default Open Graph Image
**As a** content sharer
**I want** professional preview cards when sharing site links
**So that** the content looks credible and polished on social media

**Acceptance Criteria:**
- [ ] **DESIGN ASSET REQUIRED**: Create default OG image (1200x630px)
  - Professional headshot or executive brand graphic
  - High contrast text (if applicable)
  - PNG or JPG format, optimized for web (<500KB)
- [ ] Add default OG meta tags to site `<head>`:
  - `og:title`: Site title or page title
  - `og:description`: Site description or page excerpt
  - `og:image`: Default image URL (absolute path)
  - `og:url`: Canonical page URL
  - `og:type`: "website" (homepage) or "article" (posts)
  - `og:site_name`: "Fawad Rashidi"
- [ ] Test preview on LinkedIn, Twitter, Facebook
- [ ] Ensure image displays correctly (not cropped/distorted)

**Technical Notes:**
- Store image in `/assets/images/og-default.png`
- Use absolute URLs for `og:image` (required by spec)
- LinkedIn requires minimum 1200x627px for large image format

**Definition of Done:**
- [ ] OG image created and committed
- [ ] Meta tags added to all pages
- [ ] Validated via:
  - Twitter Card Validator
  - Facebook Sharing Debugger
  - LinkedIn Post Inspector
- [ ] Preview cards display correctly

---

#### User Story 2.2: Per-Article Custom OG Images
**As a** blog post author
**I want** custom preview images for key articles
**So that** each article has unique, eye-catching social shares

**Acceptance Criteria:**
- [ ] Add front matter support for custom OG images per post
  - Field: `og_image: /assets/images/posts/article-name.png`
- [ ] Fallback to default OG image if not specified
- [ ] Create custom images for top 5 most important articles
- [ ] Update blog post layout to use custom or default image
- [ ] Test 2-3 articles with custom images

**Technical Notes:**
- Use Liquid conditional: `{% if page.og_image %}` to check for custom image
- Store custom images in `/assets/images/posts/`
- Document front matter usage in CLAUDE.md

**Definition of Done:**
- [ ] Front matter support implemented
- [ ] 5 custom OG images created and deployed
- [ ] Tested on social media platforms
- [ ] Documentation updated

---

#### User Story 2.3: Twitter Card Configuration
**As a** Twitter user
**I want** large image cards when sharing articles
**So that** the content is more engaging and clickable

**Acceptance Criteria:**
- [ ] Add Twitter Card meta tags:
  - `twitter:card`: "summary_large_image"
  - `twitter:site`: "@[username]" (if available)
  - `twitter:creator`: "@[username]"
  - `twitter:title`: Page title
  - `twitter:description`: Page excerpt
  - `twitter:image`: Same as OG image
- [ ] Validate via Twitter Card Validator
- [ ] Test with multiple post types (blog, speaking pages)

**Technical Notes:**
- Twitter falls back to OG tags if Twitter tags not present
- summary_large_image requires min 300x157px (1200x628px recommended)

**Definition of Done:**
- [ ] Twitter Card tags added
- [ ] Validation passes
- [ ] Preview displays correctly on Twitter

---

### Epic 3: Analytics Integration
**Priority:** P0 - Critical | **Effort:** 2-3 hours

#### User Story 3.1: Analytics Provider Selection & Setup
**As a** product owner
**I want** to track visitor behavior and content performance
**So that** I can make data-driven decisions about content strategy

**Acceptance Criteria:**
- [ ] **DECISION REQUIRED**: Select analytics provider (Blocker for this story)
  - Option A: Plausible Analytics ($9/mo, privacy-focused, recommended)
  - Option B: Google Analytics 4 (free, comprehensive)
  - Option C: Fathom Analytics ($14/mo, privacy-compliant)
- [ ] Create account with chosen provider
- [ ] Obtain tracking code/script
- [ ] Add tracking code to site `<head>` section (all pages)
- [ ] Verify tracking works in development environment
- [ ] Test page view tracking on 3+ different pages

**Technical Notes:**
- For Plausible: Add `<script defer data-domain="lab.fawad.ai" src="https://plausible.io/js/script.js"></script>`
- For GA4: Use gtag.js with measurement ID
- Consider adding to base layout template for site-wide tracking
- Test with browser dev tools (check network tab for analytics requests)

**Definition of Done:**
- [ ] Analytics account created
- [ ] Tracking code deployed to production
- [ ] Page views tracked correctly (verified in analytics dashboard)
- [ ] No console errors

---

#### User Story 3.2: Goal Tracking Configuration
**As a** marketing team member
**I want** to track key user actions (CTAs)
**So that** I can measure conversion rates and engagement

**Acceptance Criteria:**
- [ ] Set up goal/event tracking for:
  - Speaking page views
  - Contact link clicks
  - Email link clicks
  - External link clicks (LinkedIn, social profiles)
  - Future: Newsletter signups (when implemented)
- [ ] Add event tracking code to relevant elements
- [ ] Test each goal/event triggers correctly
- [ ] Verify events appear in analytics dashboard

**Technical Notes:**
- Plausible: Use custom events with `plausible('eventName')`
- GA4: Use `gtag('event', 'event_name', parameters)`
- Add event listeners to CTA buttons/links
- Document event naming conventions

**Definition of Done:**
- [ ] 4+ goals/events configured
- [ ] Test triggers confirmed in analytics
- [ ] Documentation created for adding new events

---

#### User Story 3.3: Privacy Policy Update
**As a** website owner
**I want** to comply with privacy regulations (GDPR/CCPA)
**So that** visitors understand data collection practices

**Acceptance Criteria:**
- [ ] Review privacy policy requirements for chosen analytics provider
- [ ] Update privacy policy page (or create if doesn't exist)
- [ ] Include:
  - What data is collected (page views, referrers, device info)
  - Analytics provider used
  - Data retention policy
  - User opt-out instructions (if applicable)
  - Cookie usage (if applicable)
- [ ] Add link to privacy policy in footer
- [ ] If required by provider: Implement cookie consent banner

**Technical Notes:**
- Plausible doesn't require cookie consent (cookieless tracking)
- GA4 may require cookie consent banner in EU
- Reference provider's privacy documentation

**Definition of Done:**
- [ ] Privacy policy updated and published
- [ ] Footer link added
- [ ] Cookie consent implemented if required
- [ ] Legal review completed (if needed)

---

### Epic 4: Custom Domain Verification
**Priority:** P0 - Critical | **Effort:** 0 hours (Already Complete)

#### User Story 4.1: Verify Custom Domain & HTTPS
**As a** site administrator
**I want** to confirm custom domain and SSL are working
**So that** visitors access the site securely via lab.fawad.ai

**Acceptance Criteria:**
- [x] CNAME file exists in repository root
- [x] GitHub Pages configured to use custom domain
- [x] SSL certificate auto-provisioned (HTTPS enabled)
- [x] HTTP redirects to HTTPS automatically
- [x] www subdomain redirects to apex domain (or vice versa)
- [x] No browser security warnings

**Status:** ✅ COMPLETED
- CNAME file present in repository
- Custom domain operational: https://lab.fawad.ai
- No action required

---

## Sprint Milestones

### Milestone 1: SEO Foundation (End of Week 2)
**Goal:** Schema markup validated and functional

**Deliverables:**
- [x] Person schema on homepage
- [x] Article schema on all blog posts
- [x] BreadcrumbList schema on sub-pages
- [x] All schemas pass Google Rich Results Test

**Success Criteria:**
- Google Rich Results Test shows 0 errors for all schema types
- Search Console (if available) shows structured data being indexed

---

### Milestone 2: Social Proof (End of Week 3)
**Goal:** Professional social sharing operational

**Deliverables:**
- [x] Default OG image created (1200x630px)
- [x] OG/Twitter meta tags on all pages
- [x] Custom OG images for 5 key articles
- [x] Validated on LinkedIn, Twitter, Facebook

**Success Criteria:**
- Preview cards display correctly on all 3 platforms
- No image cropping or distortion issues
- Title and description display correctly

---

### Milestone 3: Data Collection (End of Week 4)
**Goal:** Analytics tracking all visitor behavior

**Deliverables:**
- [x] Analytics provider selected and configured
- [x] Page view tracking functional
- [x] 4+ goal/event tracking configured
- [x] Privacy policy updated

**Success Criteria:**
- Analytics dashboard showing real-time visitor data
- 100% page view capture rate
- All goal events triggering correctly
- Privacy compliance confirmed

---

## Dependencies & Blockers

### Critical Blockers
1. **Analytics Provider Decision** (User Story 3.1)
   - **Blocker:** Must decide on Plausible vs GA4 vs Fathom
   - **Owner:** Product Owner
   - **Deadline:** Before Sprint Start (Week 1, Day 1)
   - **Impact:** Blocks Epic 3 (Analytics Integration)

### External Dependencies
2. **OG Image Design** (User Story 2.1)
   - **Dependency:** Design asset creation (default OG image 1200x630px)
   - **Owner:** Design Team or Product Owner
   - **Timeline:** Week 1
   - **Mitigation:** Can use placeholder text-based image, iterate later

3. **Custom OG Images** (User Story 2.2)
   - **Dependency:** 5 custom article images
   - **Owner:** Design Team
   - **Timeline:** Week 2-3
   - **Mitigation:** Not a blocker; can deploy default first, add custom images iteratively

### Technical Dependencies
- Schema.org documentation and examples
- Social media platform validators (public, no account needed)
- Analytics provider documentation

---

## Risk Assessment

| Risk | Probability | Impact | Mitigation Strategy |
|------|-------------|--------|---------------------|
| Analytics provider indecision delays Sprint 1 | Medium | High | Set hard deadline (Day 1); default to Plausible if no decision by deadline |
| OG image design delays social sharing | Medium | Medium | Use text-based placeholder (Canva template); iterate with custom design later |
| Schema validation errors block deployment | Low | Medium | Use Google's Structured Data Testing Tool iteratively; test early and often |
| Analytics tracking not working in production | Low | High | Test thoroughly in development; verify in production immediately post-deploy |
| Privacy policy legal review delays launch | Low | Low | Use provider's template language; schedule legal review in parallel |

---

## Sprint Planning Estimates

### Story Points Breakdown
| Epic | User Stories | Total Effort | Complexity |
|------|--------------|--------------|------------|
| 1. Structured Data | 3 stories | 3-5 hours | Medium |
| 2. Social Media Optimization | 3 stories | 4-6 hours | Low-Medium |
| 3. Analytics Integration | 3 stories | 2-3 hours | Low |
| 4. Custom Domain Verification | 1 story (complete) | 0 hours | N/A |

**Total Sprint Effort:** 9-14 hours

### Recommended Team Allocation
- **Developer:** 8-12 hours (Schema, OG tags, analytics code)
- **Designer:** 2-4 hours (OG images)
- **Product Owner:** 1 hour (Analytics decision, privacy policy review)

---

## Testing & Validation Checklist

### Pre-Deployment Testing
- [ ] All schema markup validates via Google Rich Results Test
- [ ] OG/Twitter tags validated via social media platform tools
- [ ] Analytics tracking tested in development (page views + events)
- [ ] No JavaScript console errors
- [ ] Mobile responsive (meta tags render correctly)

### Post-Deployment Validation
- [ ] Verify production analytics tracking (check dashboard within 24 hours)
- [ ] Test social sharing on LinkedIn, Twitter, Facebook (use real accounts)
- [ ] Submit sitemap to Google Search Console (if available)
- [ ] Monitor Search Console for structured data errors (1 week post-launch)

### Validation Tools
- [Google Rich Results Test](https://search.google.com/test/rich-results)
- [Twitter Card Validator](https://cards-dev.twitter.com/validator)
- [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
- [LinkedIn Post Inspector](https://www.linkedin.com/post-inspector/)
- Browser dev tools (Network tab for analytics, Console for errors)

---

## Sprint Retrospective Questions

### What went well?
- Did we meet our sprint goals?
- Were the story estimates accurate?
- Did we deliver all milestones on time?

### What could be improved?
- Did any blockers delay progress?
- Were there unexpected technical challenges?
- Did we have all the information/assets we needed?

### Action items for next sprint?
- What lessons learned apply to Sprint 3-4?
- Are there any process improvements needed?
- Do we need to adjust effort estimates?

---

## Success Metrics (Post-Sprint Review)

### Quantitative Metrics
- **SEO Foundation:** Google Rich Results Test passes (0 errors)
- **Social Sharing:** Preview cards display correctly on 3+ platforms
- **Analytics:** 100% page view tracking operational
- **Performance:** No increase in page load time (verify via Lighthouse)

### Qualitative Metrics
- **Search Visibility:** Monitor for increase in impressions (2-4 weeks post-launch)
- **Social Engagement:** Track click-through rates on shared links (via analytics)
- **User Feedback:** Note any user-reported issues with schema/sharing

### Target Outcomes (2 months post-Sprint)
- 🎯 10% increase in organic search impressions
- 🎯 Google Knowledge Panel eligibility confirmed
- 🎯 Higher social media CTR on shared content

---

## Resources & Documentation

### Technical References
- [Schema.org Documentation](https://schema.org/)
- [Open Graph Protocol](https://ogp.me/)
- [Twitter Cards Documentation](https://developer.twitter.com/en/docs/twitter-for-websites/cards/overview/abouts-cards)
- [Google Search Central - Structured Data](https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data)

### Tools
- [Google Rich Results Test](https://search.google.com/test/rich-results)
- [Schema Markup Generator](https://technicalseo.com/tools/schema-markup-generator/)
- Social media validators (see Testing section)

### Team Contacts
- **Product Owner:** [Name/Email]
- **Tech Lead:** [Name/Email]
- **Design Lead:** [Name/Email]
- **Scrum Master:** [Name/Email]

---

## Next Sprint Preview

**Sprint 3-4: Discovery & Accessibility**
- Search functionality (lunr.js)
- Jekyll data files for dynamic content
- WCAG 2.1 AA accessibility enhancements
- RSS feed improvements

**Estimated Effort:** 17-24 hours
**Prerequisites from this sprint:** Analytics data collection (to inform search priorities)

---

**Sprint Start Date:** [TBD]
**Sprint End Date:** [TBD]
**Sprint Review Date:** [TBD]
**Sprint Retrospective Date:** [TBD]

---

**Document Version:** 1.0
**Last Updated:** 2025-11-13
**Owner:** Scrum Master
