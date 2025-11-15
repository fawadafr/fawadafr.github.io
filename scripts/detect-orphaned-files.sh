#!/bin/bash

# Orphaned File Detection Script
# Identifies files that may be unused or orphaned in the Jekyll project
# Helps prevent issues like homepage2.html that cause deployment failures

set -e

# Colors for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
DRY_RUN=true
DELETE_ORPHANS=false

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --delete)
      DELETE_ORPHANS=true
      DRY_RUN=false
      shift
      ;;
    --force)
      DELETE_ORPHANS=true
      DRY_RUN=false
      shift
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 [--delete]"
      exit 1
      ;;
  esac
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "ORPHANED FILE DETECTION REPORT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo -e "${BLUE}Mode: DRY RUN (analysis only)${NC}"
else
    echo -e "${RED}Mode: DELETE MODE (files will be removed!)${NC}"
fi
echo ""

ORPHANS_FOUND=0
ORPHAN_FILES=()

# Function to check if file is referenced
is_file_referenced() {
    local file="$1"
    local basename=$(basename "$file")

    # Check if referenced in Jekyll configs
    if grep -r "$basename" _config.yml _data/ _includes/ _layouts/ >/dev/null 2>&1; then
        return 0  # Referenced
    fi

    # Check if referenced in any markdown/html files
    if grep -r "$basename" *.md *.html _posts/ _speaking/ >/dev/null 2>&1; then
        return 0  # Referenced
    fi

    return 1  # Not referenced
}

# 1. Check for orphaned HTML files in root
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "1. ORPHANED HTML FILES IN ROOT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Known valid root HTML files
VALID_ROOT_HTML=(
    "index.html"
    "404.html"
    "search.html"
)

HTML_ORPHANS=0
shopt -s nullglob  # Handle case when no files match
for html_file in *.html; do
    if [ -f "$html_file" ]; then
        # Skip known valid files
        is_valid=false
        for valid in "${VALID_ROOT_HTML[@]}"; do
            if [ "$html_file" = "$valid" ]; then
                is_valid=true
                break
            fi
        done

        if [ "$is_valid" = false ]; then
            # Check if referenced anywhere
            if ! is_file_referenced "$html_file"; then
                echo -e "${YELLOW}⚠️  Orphaned: $html_file${NC}"
                echo "   Not referenced in configs, layouts, or content"
                ORPHAN_FILES+=("$html_file")
                ((HTML_ORPHANS++))
                ((ORPHANS_FOUND++))
            fi
        fi
    fi
done

if [ "$HTML_ORPHANS" -eq 0 ]; then
    echo -e "${GREEN}✓ No orphaned HTML files found${NC}"
fi
echo ""

# 2. Check for old temporary files
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "2. TEMPORARY/BACKUP FILES"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

TEMP_PATTERNS=(
    "*.tmp"
    "*.bak"
    "*.backup"
    "*~"
    "*.swp"
    ".DS_Store"
    "Thumbs.db"
)

TEMP_FILES=0
for pattern in "${TEMP_PATTERNS[@]}"; do
    while IFS= read -r -d '' temp_file; do
        echo -e "${YELLOW}⚠️  Temporary file: $temp_file${NC}"
        ORPHAN_FILES+=("$temp_file")
        ((TEMP_FILES++))
        ((ORPHANS_FOUND++))
    done < <(find . -name "$pattern" -not -path "./.git/*" -not -path "./node_modules/*" -not -path "./vendor/*" -not -path "./_site/*" -print0 2>/dev/null)
done

if [ "$TEMP_FILES" -eq 0 ]; then
    echo -e "${GREEN}✓ No temporary files found${NC}"
fi
echo ""

# 3. Check for stale drafts (older than 6 months)
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "3. STALE DRAFTS (>6 months old)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

STALE_DRAFTS=0
if [ -d "_drafts" ]; then
    CUTOFF_DATE=$(date -v-6m +%Y-%m-%d 2>/dev/null || date -d "6 months ago" +%Y-%m-%d)

    while IFS= read -r -d '' draft_file; do
        # Get file modification time
        if [[ "$OSTYPE" == "darwin"* ]]; then
            MODIFIED=$(stat -f "%Sm" -t "%Y-%m-%d" "$draft_file")
        else
            MODIFIED=$(date -r "$draft_file" +%Y-%m-%d)
        fi

        if [[ "$MODIFIED" < "$CUTOFF_DATE" ]]; then
            echo -e "${YELLOW}⚠️  Stale draft: $draft_file${NC}"
            echo "   Last modified: $MODIFIED (>6 months ago)"
            ((STALE_DRAFTS++))
        fi
    done < <(find _drafts -type f -name "*.md" -print0 2>/dev/null)
fi

if [ "$STALE_DRAFTS" -eq 0 ]; then
    echo -e "${GREEN}✓ No stale drafts found${NC}"
fi
echo ""

# 4. Check for unreferenced assets
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "4. POTENTIALLY UNUSED ASSETS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

UNUSED_ASSETS=0
ASSET_EXTENSIONS=("jpg" "jpeg" "png" "gif" "svg" "pdf")

# Check custom images (not in PWA icons directory)
if [ -d "assets/images" ]; then
    for ext in "${ASSET_EXTENSIONS[@]}"; do
        while IFS= read -r -d '' asset_file; do
            basename=$(basename "$asset_file")

            # Skip OG default and known system files
            if [[ "$basename" == "og-default.svg" ]]; then
                continue
            fi

            # Check if referenced
            if ! grep -r "$basename" . --include="*.md" --include="*.html" --include="*.scss" --include="*.css" --exclude-dir=".git" --exclude-dir="_site" --exclude-dir="node_modules" --exclude-dir="vendor" >/dev/null 2>&1; then
                echo -e "${YELLOW}⚠️  Possibly unused: $asset_file${NC}"
                echo "   Not found in content or stylesheets"
                ((UNUSED_ASSETS++))
            fi
        done < <(find assets/images -type f -name "*.$ext" -print0 2>/dev/null)
    done
fi

if [ "$UNUSED_ASSETS" -eq 0 ]; then
    echo -e "${GREEN}✓ All checked assets appear to be in use${NC}"
else
    echo ""
    echo -e "${BLUE}ℹ️  Note: Manual verification recommended before deleting assets${NC}"
fi
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SUMMARY"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Orphaned HTML files:   $HTML_ORPHANS"
echo "Temporary files:       $TEMP_FILES"
echo "Stale drafts:          $STALE_DRAFTS"
echo "Unused assets:         $UNUSED_ASSETS"
echo ""
echo "Total issues found:    $ORPHANS_FOUND"
echo ""

# Action recommendations
if [ "$ORPHANS_FOUND" -gt 0 ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "RECOMMENDED ACTIONS"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    if [ "$HTML_ORPHANS" -gt 0 ]; then
        echo "🔴 Orphaned HTML files can cause deployment failures"
        echo "   Action: Review and remove or add to .gitignore"
    fi

    if [ "$TEMP_FILES" -gt 0 ]; then
        echo "🟡 Temporary files should be cleaned up"
        echo "   Action: Safe to delete these files"
    fi

    if [ "$STALE_DRAFTS" -gt 0 ]; then
        echo "🟡 Stale drafts are >6 months old"
        echo "   Action: Publish, delete, or move to archive"
    fi

    if [ "$UNUSED_ASSETS" -gt 0 ]; then
        echo "🟡 Unused assets increase repository size"
        echo "   Action: Verify not in use, then consider removing"
    fi

    echo ""

    # Delete mode
    if [ "$DELETE_ORPHANS" = true ] && [ "${#ORPHAN_FILES[@]}" -gt 0 ]; then
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "DELETING FILES"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""

        for file in "${ORPHAN_FILES[@]}"; do
            if [ -f "$file" ]; then
                echo "Deleting: $file"
                git rm -f "$file" 2>/dev/null || rm -f "$file"
            fi
        done

        echo ""
        echo -e "${GREEN}✓ Files deleted${NC}"
        echo ""
        echo "Run 'git status' to review changes"
        echo "Commit with: git commit -m \"chore: Remove orphaned files\""
    else
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "To automatically remove orphaned files, run:"
        echo "  $0 --delete"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    fi
else
    echo -e "${GREEN}✅ Repository is clean! No orphaned files detected.${NC}"
fi

echo ""
exit 0
