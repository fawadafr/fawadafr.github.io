#!/bin/bash

# Build Quality Report Generator
# Analyzes recent GitHub Actions workflow runs to track build quality metrics

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "BUILD QUALITY REPORT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Configuration
LIMIT=${1:-30}  # Default to last 30 runs
WORKFLOW_NAME="Deploy Jekyll site to Pages"

echo "Analyzing last $LIMIT workflow runs..."
echo ""

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Fetch workflow runs
echo "Fetching workflow data..."
RUNS_JSON=$(gh run list --workflow="$WORKFLOW_NAME" --limit="$LIMIT" --json status,conclusion,createdAt,displayTitle,databaseId)

# Calculate metrics
TOTAL=$(echo "$RUNS_JSON" | jq 'length')
SUCCESS=$(echo "$RUNS_JSON" | jq '[.[] | select(.conclusion == "success")] | length')
FAILURE=$(echo "$RUNS_JSON" | jq '[.[] | select(.conclusion == "failure")] | length')
CANCELLED=$(echo "$RUNS_JSON" | jq '[.[] | select(.conclusion == "cancelled")] | length')
IN_PROGRESS=$(echo "$RUNS_JSON" | jq '[.[] | select(.status == "in_progress" or .status == "queued")] | length')

# Calculate success rate
if [ "$TOTAL" -gt 0 ]; then
    SUCCESS_RATE=$(echo "scale=1; ($SUCCESS * 100) / $TOTAL" | bc)
else
    SUCCESS_RATE="0.0"
fi

# Display summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SUMMARY (Last $TOTAL runs)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✅ Successful:   $SUCCESS"
echo "❌ Failed:       $FAILURE"
echo "⏸️  Cancelled:    $CANCELLED"
echo "🔄 In Progress:  $IN_PROGRESS"
echo ""
echo "Success Rate: $SUCCESS_RATE%"
echo ""

# Recent failures
if [ "$FAILURE" -gt 0 ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "RECENT FAILURES"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    echo "$RUNS_JSON" | jq -r '.[] | select(.conclusion == "failure") |
        "\(.createdAt | split("T")[0]) - \(.displayTitle) (ID: \(.databaseId))"' | head -5
    echo ""
fi

# Trend analysis (compare first half vs second half)
HALF=$((TOTAL / 2))
if [ "$HALF" -gt 0 ]; then
    FIRST_HALF_SUCCESS=$(echo "$RUNS_JSON" | jq ".[0:$HALF] | [.[] | select(.conclusion == \"success\")] | length")
    SECOND_HALF_SUCCESS=$(echo "$RUNS_JSON" | jq ".[$HALF:] | [.[] | select(.conclusion == \"success\")] | length")

    FIRST_RATE=$(echo "scale=1; ($FIRST_HALF_SUCCESS * 100) / $HALF" | bc)
    SECOND_RATE=$(echo "scale=1; ($SECOND_HALF_SUCCESS * 100) / $HALF" | bc)

    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "TREND ANALYSIS"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "Recent builds ($HALF):     $FIRST_RATE% success"
    echo "Earlier builds ($HALF):    $SECOND_RATE% success"
    echo ""

    DIFF=$(echo "scale=1; $FIRST_RATE - $SECOND_RATE" | bc)
    if (( $(echo "$DIFF > 0" | bc -l) )); then
        echo "📈 Trend: IMPROVING (+$DIFF%)"
    elif (( $(echo "$DIFF < 0" | bc -l) )); then
        echo "📉 Trend: DECLINING ($DIFF%)"
    else
        echo "➡️  Trend: STABLE"
    fi
    echo ""
fi

# Recommendations
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "RECOMMENDATIONS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if (( $(echo "$SUCCESS_RATE >= 95" | bc -l) )); then
    echo "✅ Excellent build quality! Keep it up."
elif (( $(echo "$SUCCESS_RATE >= 80" | bc -l) )); then
    echo "⚠️  Good build quality, but room for improvement."
    echo "   Review recent failures and add preventive measures."
else
    echo "🚨 Build quality needs attention!"
    echo "   - Review failed builds and identify patterns"
    echo "   - Consider adding more validation checks"
    echo "   - Ensure pre-commit hooks are being used"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "For detailed logs, use:"
echo "  gh run list --workflow='$WORKFLOW_NAME'"
echo "  gh run view <run-id> --log"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
