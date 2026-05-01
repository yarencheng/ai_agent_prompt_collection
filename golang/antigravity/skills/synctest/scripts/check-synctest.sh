#!/bin/bash
# Check for testing/synctest support

if [[ "$1" == "--help" ]]; then
  echo "Usage: check-synctest.sh"
  echo "Checks if the installed Go version supports testing/synctest."
  exit 0
fi

go version
if go list testing/synctest > /dev/null 2>&1; then
  echo "testing/synctest is available."
else
  echo "testing/synctest is NOT available. Requires Go 1.25+ or GOEXPERIMENT=synctest on 1.24."
fi
