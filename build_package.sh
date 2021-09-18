#! /usr/bin/env bash
CWD=$(dirname $0)
rsync \
    --recursive \
    --prune-empty-dirs \
    --include "*/" \
    --include "*/nn-NO.lproj/*" \
    --exclude "*" \
    "$CWD/System" \
    "$CWD/Package"
find "$CWD/Package" \
    -name "*.strings" \
    -exec plutil -convert binary1 "{}" \;
pkgbuild \
    --identifier "com.github.nn-NO.pkg.macos" \
    --install-location "/" \
    --root "$CWD/Package" \
    --version "10.15.7.0" \
    "macOS nn-NO.pkg"
rm -rf "$CWD/Package"
