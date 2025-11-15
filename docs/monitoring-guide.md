# Build Quality Monitoring Guide

This guide explains how to monitor build quality and track deployment metrics over time.

## Overview

Build quality monitoring helps identify trends, catch recurring issues, and ensure the deployment pipeline remains reliable. This repository includes both automated tooling and access to GitHub's native monitoring features.

## Quick Start

### Generate Build Quality Report

```bash
# Last 30 workflow runs (default)
npm run build:report

# Last 50 workflow runs (detailed)
npm run build:report:detailed

# Custom number of runs
./scripts/build-quality-report.sh 100
```

### Sample Output

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD QUALITY REPORT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SUMMARY (Last 17 runs)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Successful:   11
❌ Failed:       6
⏸️  Cancelled:    0
🔄 In Progress:  0

Success Rate: 64.7%

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TREND ANALYSIS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Recent builds (8):     75.0% success
Earlier builds (8):    62.5% success

📈 Trend: IMPROVING (+12.5%)
```

## Key Metrics

### Success Rate Thresholds

| Success Rate | Status | Action Required |
|--------------|--------|-----------------|
| ≥ 95% | ✅ Excellent | Maintain current practices |
| 80-94% | ⚠️ Good | Review recent failures, add preventive measures |
| < 80% | 🚨 Needs Attention | Immediate review required, identify patterns |

### Metrics Tracked

1. **Success Rate**: Percentage of successful deployments
2. **Failure Count**: Number of failed builds
3. **Trend Analysis**: Comparison of recent vs. earlier builds
4. **Recent Failures**: List of latest failed deployments with dates and IDs

## GitHub Actions Native Monitoring

### Workflow Insights

Navigate to: `Repository → Actions → Workflows → Deploy Jekyll site to Pages`

**Available Metrics:**
- Total workflow runs
- Success/failure rates over time
- Average run duration
- Job-level success rates

### View Recent Runs

```bash
# List last 10 workflow runs
gh run list --workflow="Deploy Jekyll site to Pages" --limit 10

# View detailed logs for specific run
gh run view <run-id> --log

# View only failed runs
gh run list --workflow="Deploy Jekyll site to Pages" --status failure
```

### Workflow Run Status

```bash
# Check latest run status
gh run list --limit 1

# Watch a running workflow in real-time
gh run watch <run-id>

# Download workflow logs
gh run view <run-id> --log > build-log.txt
```

## Monitoring Best Practices

### Weekly Review Cadence

Run the build quality report weekly to track trends:

```bash
# Monday morning quality check
npm run build:report:detailed
```

**Review Checklist:**
- [ ] Success rate ≥ 95%
- [ ] No recurring failure patterns
- [ ] Trend is stable or improving
- [ ] Failed builds have documented root causes

### Monthly Deep Dive

Once per month, perform detailed analysis:

```bash
# Last 100 runs for comprehensive view
./scripts/build-quality-report.sh 100
```

**Analysis Tasks:**
1. Identify most common failure reasons
2. Review validation error trends
3. Assess impact of recent changes
4. Update preventive measures if needed

### Immediate Actions for Failures

When a build fails:

1. **Identify the failure**
   ```bash
   gh run view <run-id> --log
   ```

2. **Check if validation caught the issue**
   - Look for "HTML Validation Failed" annotations
   - Review validation report in step summary

3. **Determine root cause**
   - Malformed HTML?
   - Missing dependency?
   - Configuration error?

4. **Fix and document**
   - Apply fix
   - Update preventive measures
   - Document in CHANGELOG

## GitHub Actions Step Summaries

Every workflow run includes enhanced step summaries:

### HTML Validation Summary

**Successful Validation:**
```
## ✅ HTML Validation: PASSED
- Files validated: 11
- Errors found: 0
- Status: All files valid ✅
```

**Failed Validation:**
```
## ❌ HTML Validation: FAILED
- Files validated: 11
- Errors found: 3
- Status: Deployment blocked ⛔

### Errors
[Detailed error report]
```

### HTML Minification Summary

**Files Skipped:**
```
⚠️ Warning: 2 file(s) skipped during HTML minification
Skipped files:
_site/page1.html
_site/page2.html
```

## Automated Alerts

### GitHub Notifications

Configure email or Slack notifications for workflow failures:

1. Navigate to: `Repository → Settings → Notifications`
2. Enable: "Actions workflow runs"
3. Choose notification channels

### Monitoring Dashboard (Future)

Planned for long-term implementation:
- Real-time build quality dashboard
- Historical trend charts
- Automated weekly reports
- Slack/email summaries

## Troubleshooting

### "gh CLI not installed"

Install GitHub CLI:
```bash
# macOS
brew install gh

# Windows
winget install --id GitHub.cli

# Linux
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
```

### No Data Returned

Ensure you're authenticated:
```bash
gh auth login
```

### Permission Denied on Script

Make script executable:
```bash
chmod +x scripts/build-quality-report.sh
```

## Integration with Development Workflow

### Pre-Release Quality Gate

Before creating a release, verify build quality:

```bash
# Check last 20 builds
npm run build:report

# If success rate < 95%, investigate failures before release
```

### Sprint Retrospectives

Include build quality metrics in sprint reviews:
- Success rate trend
- Number of failures this sprint
- Most common failure types
- Preventive measures added

### Continuous Improvement

Use monitoring data to:
1. **Identify patterns**: Which types of changes cause failures?
2. **Enhance validation**: Add rules for common mistakes
3. **Improve documentation**: Update guides based on recurring issues
4. **Automate prevention**: Add pre-commit hooks for frequent errors

## Related Documentation

- [User Manual](user-manual.md) - Deployment and troubleshooting
- [Customization Guide](customization-guide.md) - HTML validation configuration
- [PRD Implementation Report](prd-implementation-report.md) - Technical architecture

## Quick Reference

| Task | Command |
|------|---------|
| Generate quality report | `npm run build:report` |
| Detailed report (50 runs) | `npm run build:report:detailed` |
| List recent runs | `gh run list --limit 10` |
| View specific run logs | `gh run view <run-id> --log` |
| View only failures | `gh run list --status failure` |
| Watch running workflow | `gh run watch <run-id>` |
| Validate built HTML | `npm run validate:html:site` |
| Run validation tests | `npm run test:validation` |

---

**Last Updated:** 2025-11-15
**Maintainer:** Development Team
