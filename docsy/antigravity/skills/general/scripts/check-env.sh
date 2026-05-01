#!/bin/bash

# check-env.sh - Verify Docsy prerequisites

show_help() {
    echo "Usage: check-env.sh [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help    Show this help message and exit"
    echo ""
    echo "Checks for:"
    echo "  - Hugo extended (min v0.146.0)"
    echo "  - Go (required for modules)"
    echo "  - Node.js"
    echo "  - PostCSS, postcss-cli, and autoprefixer"
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo "Checking Docsy prerequisites..."

# Check Hugo
if command -v hugo >/dev/null 2>&1; then
    HUGO_VERSION_STR=$(hugo version)
    echo "✅ Hugo found: $HUGO_VERSION_STR"
    
    if [[ ! $HUGO_VERSION_STR == *"extended"* ]]; then
        echo "❌ Error: Hugo 'extended' version is required for SCSS support."
    fi

    # Extract version number (e.g., 0.157.0)
    HUGO_VERSION=$(echo "$HUGO_VERSION_STR" | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' | sed 's/v//')
    MIN_HUGO_VERSION="0.146.0"
    
    if [[ $(printf '%s\n%s' "$MIN_HUGO_VERSION" "$HUGO_VERSION" | sort -V | head -n1) != "$MIN_HUGO_VERSION" ]]; then
        echo "❌ Error: Hugo version $HUGO_VERSION is below the minimum required $MIN_HUGO_VERSION."
    else
        echo "✅ Hugo version $HUGO_VERSION meets requirements."
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
if npm list -g postcss >/dev/null 2>&1 || npm list postcss >/dev/null 2>&1; then
    echo "✅ postcss found."
else
    echo "⚠️  Warning: postcss not found in local or global npm packages."
fi

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
