#!/usr/bin/env bash
# Preview the site locally: builds content/ with the Quartz version pinned
# in quartz.version and serves it at http://localhost:8080.
# The Quartz checkout lives in .quartz-preview/ (gitignored).

set -euo pipefail

cd "$(dirname "$0")"
ROOT="$(pwd -P)"

QUARTZ_REPO_URL="${QUARTZ_REPOSITORY:-https://github.com/jackyzha0/quartz}"
QUARTZ_VERSION="$(tr -d '[:space:]' < quartz.version)"
CACHE_DIR=".quartz-preview"

if [ ! -d "$CACHE_DIR/.git" ]; then
    git clone --filter=blob:none "$QUARTZ_REPO_URL" "$CACHE_DIR"
fi
if ! git -C "$CACHE_DIR" cat-file -e "${QUARTZ_VERSION}^{commit}" 2> /dev/null; then
    git -C "$CACHE_DIR" fetch origin "$QUARTZ_VERSION"
fi
git -C "$CACHE_DIR" checkout --quiet -f "$QUARTZ_VERSION"

NODE_REQUIRED="$(tr -d '[:space:]v' < "$CACHE_DIR/.node-version")"
NODE_CURRENT="$(node --version 2> /dev/null || echo "none")"
if [ "$NODE_CURRENT" != "v${NODE_REQUIRED}" ]; then
    echo "warning: Quartz expects Node v${NODE_REQUIRED}, you have ${NODE_CURRENT}." >&2
    echo "warning: use mise or nvm to switch if the build fails." >&2
fi

cp quartz.config.yaml "$CACHE_DIR/quartz.config.yaml"

if [ ! -d "$CACHE_DIR/node_modules" ]; then
    (cd "$CACHE_DIR" && npm ci --no-audit --no-fund)
fi

(cd "$CACHE_DIR" && exec npx quartz build --directory "$ROOT/content" --serve)
