# HTML Validation Test Suite

Automated tests to verify the HTML validation pipeline catches common HTML errors.

## Test Files

1. **invalid-id.html** - Tests detection of IDs starting with numbers
2. **duplicate-title.html** - Tests detection of multiple `<title>` tags
3. **button-in-head.html** - Tests detection of `<button>` in `<head>`
4. **valid.html** - Tests that valid HTML passes validation

## Running Tests

```bash
# From repository root
./.github/tests/html-validation/test-validation.sh

# Or from test directory
cd .github/tests/html-validation
./test-validation.sh
```

## Expected Results

- ✅ Test 1: Should FAIL validation (invalid ID detected)
- ✅ Test 2: Should FAIL validation (duplicate title detected)
- ✅ Test 3: Should FAIL validation (button in head detected)
- ✅ Test 4: Should PASS validation (valid HTML accepted)

## Adding New Tests

1. Create a new HTML test file in this directory
2. Add a test case to `test-validation.sh`
3. Run the test suite to verify
4. Document the new test in this README

## Integration with CI/CD

These tests ensure that:
- HTML validation rules are working as expected
- The validation pipeline catches known error patterns
- Valid HTML is not incorrectly rejected
- Changes to `.htmlvalidate.json` don't break validation

## Test Maintenance

Run this test suite:
- After updating `.htmlvalidate.json` configuration
- Before deploying validation pipeline changes
- As part of regression testing
- When adding new validation rules
