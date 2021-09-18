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
pkgbuild \
    --identifier "com.github.nn-NO.macos" \
    --install-location "/System" \
    --root "$CWD/Package" \
    --version "10.15.7.0" \
    "macOS nn-NO.pkg"
rm -rf "$CWD/Package"
