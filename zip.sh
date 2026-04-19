#!/usr/bin/env bash
set -euo pipefail

zipName="custom-data.zip"
filesToZip=(
  "package.json"
  "custom-data.lua"
  "config.lua"
  "README.md"
  "types"
)

scriptDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$scriptDir"

if [[ -f "$zipName" ]]; then
  rm -f "$zipName"
  echo "Deleted existing $zipName"
fi

if ! command -v zip >/dev/null 2>&1; then
  echo "Error: 'zip' command not found. On macOS: it's usually preinstalled." >&2
  echo "If needed: brew install zip" >&2
  exit 1
fi

zip -r "$zipName" "${filesToZip[@]}" >/dev/null
echo "Created $zipName with: ${filesToZip[*]}"
