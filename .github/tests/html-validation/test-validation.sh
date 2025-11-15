#!/bin/bash

# HTML Validation Test Suite
# Tests that validation catches known HTML errors

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "HTML VALIDATION TEST SUITE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Change to test directory
cd "$(dirname "$0")"

# Ensure html-validate is installed
if ! command -v html-validate &> /dev/null; then
    echo "Installing html-validate..."
    npm install -g html-validate
fi

TESTS_PASSED=0
TESTS_FAILED=0

# Test 1: Invalid ID (should fail)
echo "Test 1: Invalid ID (should FAIL validation)"
if html-validate invalid-id.html --config ../../../.htmlvalidate.json > /dev/null 2>&1; then
    echo "  ❌ FAILED: Validation should have caught invalid ID"
    ((TESTS_FAILED++))
else
    echo "  ✅ PASSED: Validation correctly caught invalid ID"
    ((TESTS_PASSED++))
fi
echo ""

# Test 2: Duplicate Title (should fail)
echo "Test 2: Duplicate Title (should FAIL validation)"
if html-validate duplicate-title.html --config ../../../.htmlvalidate.json > /dev/null 2>&1; then
    echo "  ❌ FAILED: Validation should have caught duplicate title"
    ((TESTS_FAILED++))
else
    echo "  ✅ PASSED: Validation correctly caught duplicate title"
    ((TESTS_PASSED++))
fi
echo ""

# Test 3: Button in Head (should fail)
echo "Test 3: Button in Head (should FAIL validation)"
if html-validate button-in-head.html --config ../../../.htmlvalidate.json > /dev/null 2>&1; then
    echo "  ❌ FAILED: Validation should have caught button in head"
    ((TESTS_FAILED++))
else
    echo "  ✅ PASSED: Validation correctly caught button in head"
    ((TESTS_PASSED++))
fi
echo ""

# Test 4: Valid HTML (should pass)
echo "Test 4: Valid HTML (should PASS validation)"
if html-validate valid.html --config ../../../.htmlvalidate.json > /dev/null 2>&1; then
    echo "  ✅ PASSED: Validation correctly accepted valid HTML"
    ((TESTS_PASSED++))
else
    echo "  ❌ FAILED: Validation rejected valid HTML"
    ((TESTS_FAILED++))
fi
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "TEST SUMMARY"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Tests passed: $TESTS_PASSED"
echo "Tests failed: $TESTS_FAILED"
echo ""

if [ $TESTS_FAILED -eq 0 ]; then
    echo "✅ All tests passed!"
    exit 0
else
    echo "❌ Some tests failed"
    exit 1
fi
