#! /usr/bin/env bash
CWD=$(dirname $0)
rsync \
    --recursive \
    --prune-empty-dirs \
    --include "*/" \
    --include "*/no.lproj/*" \
    --exclude "*" \
    "/System/Applications" \
    "/System/Library" \
    "$CWD/System"
find "$CWD" \
    -name "*.strings" \
    -path "*/no.lproj/*" \
    -exec plutil -convert xml1 "{}" \;
