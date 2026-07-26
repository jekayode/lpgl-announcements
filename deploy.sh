#!/bin/bash
# Auto-deploy for LifePointe announcements.
# Pulls latest from GitHub, then copies the site into public_html/gl/updates.
# Run by a cPanel cron job — no manual clicks needed.

set -euo pipefail

REPO="/home/lifepoin/repositories/lpgl-announcements"
DEPLOY="/home/lifepoin/public_html/gl/updates"
LOG="/home/lifepoin/logs/lpgl-deploy.log"

mkdir -p "$(dirname "$LOG")" "$DEPLOY"

{
  echo "---- $(date '+%Y-%m-%d %H:%M:%S') ----"
  cd "$REPO"
  git fetch origin main
  BEFORE="$(git rev-parse HEAD)"
  git reset --hard origin/main
  AFTER="$(git rev-parse HEAD)"

  if [ "$BEFORE" = "$AFTER" ]; then
    echo "Already up to date ($AFTER)."
  else
    echo "Updated $BEFORE → $AFTER"
  fi

  cp -f index.html "$DEPLOY/"
  cp -Rf images assets "$DEPLOY/"
  if [ -d archive ]; then
    mkdir -p "$DEPLOY/archive"
    cp -Rf archive/. "$DEPLOY/archive/"
  fi
  echo "Deployed to $DEPLOY"
} >> "$LOG" 2>&1
