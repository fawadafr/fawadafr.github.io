# Quality Gates Policy

**Version:** 1.0
**Effective Date:** 2025-11-15
**Owner:** Development Team
**Review Cycle:** Quarterly

## Table of Contents

1. [Purpose](#purpose)
2. [Scope](#scope)
3. [Quality Gates Overview](#quality-gates-overview)
4. [Pre-Commit Quality Gates](#pre-commit-quality-gates)
5. [CI/CD Quality Gates](#cicd-quality-gates)
6. [Pre-Release Quality Gates](#pre-release-quality-gates)
7. [Continuous Monitoring](#continuous-monitoring)
8. [Quality Metrics](#quality-metrics)
9. [Exceptions and Waivers](#exceptions-and-waivers)
10. [Enforcement](#enforcement)
11. [Review and Updates](#review-and-updates)

---

## Purpose

This policy establishes quality gates to ensure code quality, prevent deployment failures, and maintain a reliable Jekyll-based website deployment pipeline. These gates enforce standards at multiple stages of the development lifecycle.

### Lessons Learned

This policy was developed in response to deployment failures caused by:
- **Orphaned HTML files** with malformed syntax (homepage2.html incident)
- Lack of pre-deployment validation
- Insufficient visibility into build quality trends

**Goal:** Prevent similar issues through systematic quality checks.

---

## Scope

This policy applies to:
- All developers contributing to the repository
- All code changes (features, bug fixes, content updates)
- All deployment workflows (main branch, releases)
- Both manual and automated processes

---

## Quality Gates Overview

### Three-Stage Quality Model

```
┌─────────────────┐      ┌─────────────────┐      ┌─────────────────┐
│  Pre-Commit     │  →   │  CI/CD          │  →   │  Pre-Release    │
│  (Developer)    │      │  (Automated)    │      │  (Manual)       │
└─────────────────┘      └─────────────────┘      └─────────────────┘
   • Local tests          • HTML validation        • Build quality
   • Linting              • Build success          • Success rate ≥95%
   • Formatting           • Asset optimization     • No P0/P1 bugs
```

---

## Pre-Commit Quality Gates

### Automated Checks (Husky Pre-Commit Hook)

**Trigger:** Before `git commit` completes

**Checks Performed:**
1. **HTML Validation (Source Files)**
   - Status: SKIPPED (Liquid templates not supported)
   - Note: Validation occurs post-build in CI/CD

**Configuration:**
- Hook location: `.husky/pre-commit`
- Bypass: Not recommended (use `--no-verify` only in emergencies)

### Manual Developer Responsibilities

Before committing, developers MUST:

1. **Test locally:**
   ```bash
   bundle exec jekyll serve
   # Verify site loads at http://localhost:4000
   ```

2. **Check for errors:**
   - Browser console errors
   - Build warnings in terminal
   - Broken links

3. **Validate changes:**
   - Review git diff
   - Ensure no unintended files included
   - Check file permissions

**Pass Criteria:** Local site builds and displays correctly

---

## CI/CD Quality Gates

### Gate 1: Jekyll Build

**Trigger:** Push to `main` branch

**Check:** Site builds successfully

**Failure Action:**
- ❌ Block deployment
- 📧 Email notification to committer
- 🔴 GitHub Actions annotation

**Pass Criteria:** Exit code 0

### Gate 2: HTML Validation

**Trigger:** After successful Jekyll build

**Tool:** `html-validate` with `.htmlvalidate.json` config

**Validation Rules:**
- No malformed HTML comments
- No duplicate `<title>` tags
- No `<button>` elements in `<head>`
- Valid ID attributes (must start with letter)
- Properly closed tags
- No duplicate IDs

**Reporting:**
- File count validated
- Error count
- Detailed error report in step summary
- GitHub Actions annotations for each error

**Failure Action:**
- ❌ Block deployment
- 📊 Add validation report to step summary
- 🔴 Annotate errors with file + line numbers

**Pass Criteria:**
- All HTML files pass validation
- 0 errors detected

### Gate 3: Asset Optimization

**Trigger:** After HTML validation passes

**Optimizations:**
- CSS minification (~30-40% reduction)
- HTML minification (~15-25% reduction)
- Image conversion to WebP

**Failure Handling:**
- ⚠️ Non-fatal (warnings only)
- 📝 Skipped files logged
- 🟡 GitHub Actions warnings for failed files

**Pass Criteria:**
- Process completes (errors allowed)
- Skipped files documented

### Gate 4: Deployment

**Trigger:** After all gates pass

**Action:**
- Deploy to GitHub Pages
- Site published to https://lab.fawad.ai

**Success Criteria:**
- Site accessible
- No 404 errors on main pages
- Assets loading correctly

---

## Pre-Release Quality Gates

### Manual Quality Review

**Trigger:** Before creating a GitHub release

**Required Checks:**

1. **Build Quality Report**
   ```bash
   npm run build:report
   ```
   - **Threshold:** Success rate ≥ 95%
   - **Action if below:** Investigate and fix failures before release

2. **Orphaned Files Check**
   ```bash
   ./scripts/detect-orphaned-files.sh
   ```
   - **Threshold:** 0 orphaned HTML files
   - **Action if found:** Remove or document purpose

3. **Validation Test Suite**
   ```bash
   npm run test:validation
   ```
   - **Threshold:** All 4 tests pass
   - **Action if failed:** Fix broken validation rules

4. **Manual Site Review**
   - [ ] Homepage loads correctly
   - [ ] Navigation works
   - [ ] Search functionality operational
   - [ ] PWA install button appears
   - [ ] Theme toggle works
   - [ ] All blog posts accessible
   - [ ] Speaking engagements display correctly

**Pass Criteria:** All checks complete successfully

---

## Continuous Monitoring

### Weekly Quality Review

**Schedule:** Every Monday, 9:00 AM

**Actions:**
1. Run build quality report
   ```bash
   npm run build:report:detailed
   ```

2. Review metrics:
   - Success rate trend
   - Recent failures
   - Recurring error patterns

3. Document findings in sprint notes

4. Create improvement tasks if needed

**Escalation Criteria:**
- Success rate < 80% for 2 consecutive weeks
- Same error occurring 3+ times
- Critical HTML validation failures

### Monthly Deep Dive

**Schedule:** First Monday of each month

**Actions:**
1. Comprehensive build analysis (last 100 runs)
2. Review quality gates effectiveness
3. Identify process improvements
4. Update validation rules if needed
5. Run orphaned files detection
6. Update this policy if necessary

---

## Quality Metrics

### Key Performance Indicators (KPIs)

| Metric | Target | Threshold | Measurement |
|--------|--------|-----------|-------------|
| Build Success Rate | ≥ 95% | ≥ 80% | Weekly rolling average |
| HTML Validation Pass Rate | 100% | 100% | Per deployment |
| Mean Time to Recovery (MTTR) | < 2 hours | < 4 hours | From failure to fix |
| Orphaned Files Count | 0 | ≤ 2 | Monthly check |
| P0/P1 Bugs in Production | 0 | 0 | Ongoing |

### Quality Levels

**Excellent (Green):** 95-100% success rate
- Status: Maintain current practices
- Action: Continue monitoring

**Good (Yellow):** 80-94% success rate
- Status: Room for improvement
- Action: Review recent failures, add preventive measures

**Needs Attention (Red):** <80% success rate
- Status: Immediate action required
- Action: Root cause analysis, process improvements, daily monitoring

---

## Exceptions and Waivers

### When Exceptions Are Allowed

Exceptions to quality gates may be granted only for:
1. **Critical hotfixes** addressing security vulnerabilities
2. **Emergency content updates** during outages
3. **Infrastructure changes** requiring temporary validation bypass

### Exception Request Process

1. **Document reason** in PR description
2. **Obtain approval** from repository maintainer
3. **Create follow-up task** to remediate
4. **Document in CHANGELOG** with explanation

### Temporary Bypass Procedures

```bash
# Emergency commit bypass (use sparingly)
git commit --no-verify -m "hotfix: Critical security patch"

# Document reason immediately
echo "Bypass reason: [explanation]" >> .bypass-log
```

**IMPORTANT:** All exceptions MUST be remediated within 48 hours.

---

## Enforcement

### Automated Enforcement

- Pre-commit hooks: Automatically enforced via Husky
- CI/CD gates: Automatically enforced via GitHub Actions
- Cannot be permanently disabled without repository admin access

### Manual Enforcement

- Pre-release checks: Developer responsibility + code review
- Weekly reports: Team lead responsibility
- Monthly reviews: All team members

### Consequences of Violations

**First Violation:**
- Educational reminder
- Document in team notes
- No formal action

**Repeated Violations (3+ in 1 month):**
- One-on-one discussion with team lead
- Additional training on quality processes
- Pair programming for quality-sensitive changes

**Persistent Violations:**
- Escalate to engineering management
- Formal improvement plan

---

## Review and Updates

### Policy Review Schedule

- **Quarterly:** Policy effectiveness review
- **After major incidents:** Ad-hoc policy updates
- **Annually:** Comprehensive policy overhaul

### Update Process

1. Propose changes via PR to this document
2. Discuss in team meeting
3. Obtain consensus (simple majority)
4. Update version number and effective date
5. Communicate changes to all team members

### Version History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-11-15 | Initial policy creation | Development Team |

---

## Quick Reference

### Developer Checklist

**Before Every Commit:**
- [ ] Site builds locally without errors
- [ ] Changes tested in browser
- [ ] No console errors
- [ ] Git diff reviewed

**Before Every Release:**
- [ ] Build quality ≥ 95%
- [ ] No orphaned files
- [ ] Validation tests pass
- [ ] Manual site review complete

### Common Commands

```bash
# Local development
bundle exec jekyll serve

# Run validation after build
npm run validate:html:site

# Check build quality
npm run build:report

# Detect orphaned files
./scripts/detect-orphaned-files.sh

# Run validation tests
npm run test:validation
```

### Troubleshooting

**Build Fails in CI but Works Locally:**
1. Check for orphaned files: `./scripts/detect-orphaned-files.sh`
2. Validate HTML: `npm run validate:html:site` (after local build)
3. Review GitHub Actions logs: `gh run view <id> --log`

**HTML Validation Errors:**
1. Read error message in GitHub Actions annotations
2. Fix syntax in source file
3. Test locally: `npm run validate:html:site`
4. Commit and push fix

**Pre-Commit Hook Blocking Commit:**
1. Review error message
2. Fix issues (don't bypass hook)
3. If false positive, update `.htmlvalidate.json`

---

## Related Documentation

- [User Manual](user-manual.md) - Feature documentation and deployment
- [Monitoring Guide](monitoring-guide.md) - Build quality tracking
- [Customization Guide](customization-guide.md) - HTML validation configuration
- [CHANGELOG](../CHANGELOG.md) - Development history

---

## Contact

**Policy Questions:** Development Team
**Emergency Bypass Approval:** Repository Maintainer
**Policy Updates:** Submit PR to this document

---

**Document Status:** APPROVED
**Next Review Date:** 2026-02-15
