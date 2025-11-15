# Automated Quality Workflows

This directory contains GitHub Actions workflows that automate quality assurance and maintenance tasks, removing the dependency on manual team processes.

## Overview

**Philosophy:** Automate quality gates so they run continuously without human intervention. Problems are detected proactively and GitHub issues are created automatically for team review.

## Workflows

### 1. Deploy Jekyll Site to Pages (`jekyll.yml`)

**Trigger:** Push to `main` branch

**Purpose:** Build and deploy the site to GitHub Pages

**Quality Gates:**
- Jekyll build validation
- HTML validation (html-validate)
- Asset optimization (CSS/HTML minification)
- Deployment to https://lab.fawad.ai

**Failure Handling:** Blocks deployment, creates GitHub Actions annotations

---

### 2. Weekly Quality Maintenance (`weekly-quality-check.yml`)

**Trigger:** Every Monday at 9:00 AM UTC (automated)

**Purpose:** Continuous quality monitoring without manual intervention

**Checks Performed:**
1. **Build Quality Report** (last 50 runs)
   - Success/failure rates
   - Trend analysis
   - Recent failures

2. **Orphaned Files Detection**
   - Orphaned HTML files
   - Temporary files (.tmp, .bak, etc.)
   - Stale drafts (>6 months)
   - Unused assets

3. **Validation Test Suite**
   - All 4 validation tests
   - Pipeline health check

**Auto-Actions:**
- ✅ **Success:** Summary posted to workflow run
- ⚠️ **Issues Found:** GitHub issue created/updated automatically
- 📊 **Reports:** Detailed metrics in step summary

**Issue Creation Thresholds:**
- Build success rate < 80%
- Orphaned files detected
- Validation tests failing

**Manual Trigger:**
```bash
# Via GitHub CLI
gh workflow run weekly-quality-check.yml

# Or via GitHub UI: Actions → Weekly Quality Maintenance → Run workflow
```

---

### 3. Monthly Quality Deep Dive (`monthly-quality-review.yml`)

**Trigger:** First Monday of each month at 10:00 AM UTC (automated)

**Purpose:** Comprehensive monthly quality analysis and review

**Analysis Performed:**
1. **Comprehensive Build Analysis** (last 100 runs)
   - Long-term success rate trends
   - Failure patterns
   - Quality trajectory

2. **Repository Health Check**
   - Full orphaned files scan
   - Repository statistics
   - Recent activity metrics

3. **Validation Pipeline Health**
   - All validation tests
   - Rule effectiveness review

**Auto-Actions:**
- 📊 **Always:** Creates monthly review issue
- 🎯 **Metrics:** Compares against quality targets
- 📋 **Recommendations:** Action items based on thresholds
- ✅ **Checklist:** Review tasks for team

**Monthly Review Issue Contains:**
- Executive summary with overall status
- Key metrics table with targets
- Action items (if thresholds not met)
- Recommendations for improvement
- Repository statistics
- Links to detailed reports

**Manual Trigger:**
```bash
gh workflow run monthly-quality-review.yml
```

---

## Automation Benefits

### Zero Manual Overhead
- No need to remember to run quality checks
- Runs automatically on schedule
- Team only acts when issues are detected

### Proactive Problem Detection
- Issues caught before they accumulate
- Early warning system for quality degradation
- Trend analysis prevents future problems

### Automatic Issue Tracking
- GitHub issues created automatically
- Existing issues updated (no duplicates)
- Clear action items and steps to resolve

### Visibility & Accountability
- Workflow summaries show current state
- Historical data via GitHub Actions history
- Monthly reviews track progress over time

---

## Workflow Configuration

### Schedule Syntax

```yaml
# Weekly - Every Monday at 9:00 AM UTC
schedule:
  - cron: '0 9 * * 1'

# Monthly - First Monday of month at 10:00 AM UTC
schedule:
  - cron: '0 10 1-7 * 1'
```

### Permissions Required

```yaml
permissions:
  contents: read    # Read repository files
  issues: write     # Create/update issues
```

### Environment Variables

No special environment variables required. Workflows use:
- `GITHUB_TOKEN`: Automatically provided by GitHub Actions
- `GITHUB_PAGES: true`: Set during Jekyll build

---

## Issue Management

### Weekly Quality Check Issues

**Label:** `automated-quality-check`

**Behavior:**
- Only one open issue at a time
- New problems update existing issue (via comment)
- Close manually after resolving all action items

**Sample Issue Title:**
```
⚠️ Weekly Quality Check Failed - 2025-11-15
```

### Monthly Review Issues

**Label:** `monthly-review`

**Behavior:**
- New issue created each month
- Always created (even if all checks pass)
- Contains comprehensive quality report
- Team reviews and closes after discussion

**Sample Issue Title:**
```
📊 Monthly Quality Review - November 2025
```

---

## Customization

### Adjusting Thresholds

Edit workflow files to change quality thresholds:

```yaml
# weekly-quality-check.yml
# Change success rate threshold (default: 80%)
if (( $(echo "$SUCCESS_RATE < 80" | bc -l) )); then
  # Change to 85%, 90%, etc.
```

### Changing Schedule

```yaml
# Run daily instead of weekly
schedule:
  - cron: '0 9 * * *'

# Run bi-weekly
schedule:
  - cron: '0 9 */14 * *'
```

### Adding New Checks

Add new steps to workflows:

```yaml
- name: Custom Quality Check
  run: |
    # Your custom check script
    ./scripts/my-custom-check.sh

    # Add to step summary
    echo "## Custom Check Results" >> $GITHUB_STEP_SUMMARY
    echo "Result: PASSED" >> $GITHUB_STEP_SUMMARY
```

---

## Monitoring Workflow Health

### View Workflow Runs

```bash
# List recent weekly checks
gh run list --workflow=weekly-quality-check.yml --limit 10

# List monthly reviews
gh run list --workflow=monthly-quality-review.yml --limit 5

# View specific run
gh run view <run-id> --log
```

### Check Workflow Status

```bash
# See if workflows are enabled
gh workflow list

# View workflow details
gh workflow view weekly-quality-check.yml
```

### Workflow Notifications

**Email Notifications:**
1. Go to GitHub Settings → Notifications
2. Enable "Actions" notifications
3. Choose email/web/mobile preferences

**Slack Integration** (optional):
- Add Slack app to workspace
- Configure GitHub Actions notifications
- Receive alerts in dedicated channel

---

## Troubleshooting

### Workflow Not Running on Schedule

**Possible Causes:**
1. Repository not active (no recent commits)
2. Workflow disabled in Actions settings
3. GitHub Actions quota exceeded

**Solutions:**
```bash
# Enable workflow
gh workflow enable weekly-quality-check.yml

# Trigger manually to test
gh workflow run weekly-quality-check.yml

# Check workflow status
gh workflow view weekly-quality-check.yml
```

### Issue Not Created Automatically

**Check:**
1. Workflow has `issues: write` permission
2. Issue labels exist in repository
3. Workflow completed successfully

**Debug:**
```bash
# View workflow logs
gh run view <run-id> --log

# Check for "Created issue #XX" message
gh run view <run-id> --log | grep "Created issue"
```

### False Positives in Quality Checks

**Adjust Thresholds:**
Edit workflow files to match your quality standards

**Update Validation Rules:**
Modify `.htmlvalidate.json` or test suite if checks are too strict

---

## Integration with Quality Gates Policy

These automated workflows enforce the [Quality Gates Policy](../../docs/quality-gates-policy.md):

| Policy Requirement | Automated By |
|--------------------|--------------|
| Weekly quality review | `weekly-quality-check.yml` |
| Monthly deep dive | `monthly-quality-review.yml` |
| Build success rate ≥80% | Both workflows |
| Orphaned file detection | Both workflows |
| Validation test health | Both workflows |
| Issue tracking | Automatic issue creation |

---

## Best Practices

### For Team Members

1. **Review Issues Promptly**
   - Check automated issues weekly
   - Address action items before next check
   - Close issues when resolved

2. **Monitor Trends**
   - Review monthly reports for patterns
   - Identify recurring issues
   - Propose process improvements

3. **Don't Disable Workflows**
   - Let automation work
   - Only bypass for genuine emergencies
   - Document any bypasses

### For Maintainers

1. **Tune Thresholds**
   - Adjust based on team capacity
   - Balance strictness vs. practicality
   - Review quarterly

2. **Extend Checks**
   - Add new quality metrics
   - Integrate additional tools
   - Keep documentation updated

3. **Monitor Costs**
   - GitHub Actions minutes usage
   - Optimize workflow efficiency
   - Use caching where possible

---

## Related Documentation

- [Quality Gates Policy](../../docs/quality-gates-policy.md)
- [Monitoring Guide](../../docs/monitoring-guide.md)
- [User Manual](../../docs/user-manual.md)

---

## Support

**Questions:** Open a GitHub issue with label `question`

**Problems:** Open a GitHub issue with label `bug`

**Improvements:** Submit a PR to workflow files

---

**Last Updated:** 2025-11-15
**Maintainer:** Development Team
