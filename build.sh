#!/bin/sh
# Builds cargo-vet from crates.io inside the builder container (cwd = /workspace).
# Each build/cargo-vet-<version> branch carries its own copy with VERSION set.
set -eu
VERSION=0.10.0
OUT="dist/cargo-vet-${VERSION}-x86_64-unknown-linux-musl"

cargo install --locked --version "$VERSION" --root /workspace/dist/install cargo-vet
mkdir -p dist
mv dist/install/bin/cargo-vet "$OUT"
rm -rf dist/install
"$OUT" --version
sha256sum "$OUT"
