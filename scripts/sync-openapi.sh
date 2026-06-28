#!/usr/bin/env bash
# Sync the OpenAPI spec from the Sydium monorepo (the source of truth) into this docs repo.
# Usage: ./scripts/sync-openapi.sh /path/to/Sydium
set -euo pipefail

MONO="${1:-../Sydium}"
SRC="$MONO/functions/openapi/v1.yaml"
DST="$(cd "$(dirname "$0")/.." && pwd)/api-reference/openapi.yaml"

if [ ! -f "$SRC" ]; then
  echo "OpenAPI spec not found at: $SRC" >&2
  echo "Pass the monorepo path, e.g.: ./scripts/sync-openapi.sh /Users/you/Projects/Sydium" >&2
  exit 1
fi

cp "$SRC" "$DST"
echo "Synced $SRC -> $DST"
echo "Now: git add api-reference/openapi.yaml && git commit -m 'sync openapi spec' && git push"
