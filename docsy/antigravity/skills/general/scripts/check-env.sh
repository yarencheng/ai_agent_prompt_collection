#!/bin/bash

# check-env.sh - Verify Docsy prerequisites

echo "Checking Docsy prerequisites..."

# Check Hugo
if command -v hugo >/dev/null 2>&1; then
    HUGO_VERSION=$(hugo version)
    echo "✅ Hugo found: $HUGO_VERSION"
    if [[ ! $HUGO_VERSION == *"extended"* ]]; then
        echo "❌ Error: Hugo 'extended' version is required for SCSS support."
    fi
else
    echo "❌ Error: Hugo is not installed."
fi

# Check Go
if command -v go >/dev/null 2>&1; then
    GO_VERSION=$(go version)
    echo "✅ Go found: $GO_VERSION"
else
    echo "⚠️  Warning: Go is not installed. Required if using Docsy as a Hugo module."
fi

# Check Node.js
if command -v node >/dev/null 2>&1; then
    NODE_VERSION=$(node -v)
    echo "✅ Node.js found: $NODE_VERSION"
else
    echo "❌ Error: Node.js is not installed."
fi

# Check PostCSS
if npm list -g postcss-cli >/dev/null 2>&1 || npm list postcss-cli >/dev/null 2>&1; then
    echo "✅ postcss-cli found."
else
    echo "⚠️  Warning: postcss-cli not found in local or global npm packages."
fi

if npm list -g autoprefixer >/dev/null 2>&1 || npm list autoprefixer >/dev/null 2>&1; then
    echo "✅ autoprefixer found."
else
    echo "⚠️  Warning: autoprefixer not found in local or global npm packages."
fi
