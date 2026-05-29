#!/usr/bin/env bash
# Usage: bash new-demo.sh <slug>
#
# Called automatically by the ai-replace-demo-builder skill after it writes
# prospects/<slug>/index.html. Commits to GitHub (version control) and
# deploys directly to Vercel via CLI.
#
# Example: bash new-demo.sh printmoz

set -euo pipefail

SLUG="${1:?Usage: bash new-demo.sh <slug>}"
REPO="$(cd "$(dirname "$0")" && pwd)"
TARGET="$REPO/prospects/$SLUG/index.html"

if [[ ! -f "$TARGET" ]]; then
  echo "Error: $TARGET not found. Write the demo there before calling this script."
  exit 1
fi

echo "→ Staging prospects/$SLUG/index.html"
cd "$REPO"
git add "prospects/$SLUG/index.html"

echo "→ Committing..."
git commit -m "demo: $SLUG"

echo "→ Pushing to GitHub (version control)..."
git push origin main

echo "→ Deploying to Vercel..."
vercel --prod --yes 2>&1 | tail -5

echo ""
echo "✅  Live at: https://aireplace-demos.vercel.app/$SLUG"
