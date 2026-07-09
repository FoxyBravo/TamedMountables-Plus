#!/bin/bash
# Release TamedMountables-Plus — builds the mod zip and creates a GitHub release.
# Usage: ./release.sh

set -e

# Build
./build.sh

# Find the built zip
releasefile=$(find bin -name "*.zip" | head -1)
if [ -z "$releasefile" ]; then
    echo "Error: No zip file found in bin/"
    exit 1
fi

echo "Release file: $releasefile"

# Extract version from modinfo.json
version=$(grep -o '"version": *"[^"]*"' resources/modinfo.json | grep -o '[0-9].*[0-9]')
echo "Version: $version"

# Create GitHub release
gh release create --generate-notes "v$version" "$releasefile"
echo "Release v$version created!"
