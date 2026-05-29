#!/usr/bin/env bash
# Usage: bash new-demo.sh <slug>
#
# Called automatically by the ai-replace-demo-builder skill after it writes
# prospects/<slug>/index.html. Commits the file and pushes to GitHub, which
# triggers a Vercel auto-deploy.
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

echo "→ Pushing to GitHub — Vercel auto-deploy triggered"
git push origin main

echo ""
echo "✅  Live at: https://demos.getaireplace.com/$SLUG"
