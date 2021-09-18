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
find "$CWD/System" \
    -name "*.strings" \
    -exec plutil -convert xml1 "{}" \;
