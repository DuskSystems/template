#!/usr/bin/env -S nix develop .#ci --command bash
set -euxo pipefail
shopt -s globstar

nix flake check
nixfmt --check --width=120 **/*.nix

MAIN=$(git rev-parse --verify origin/main || git rev-parse --verify main)
if BASE=$(git merge-base "${MAIN}" HEAD) && [[ "${BASE}" != "$(git rev-parse HEAD)" ]]; then
  committed "${BASE}..HEAD"
fi
typos
tombi lint --error-on-warnings
zizmor --pedantic .github
cargo fmt --all --check
cargo shear --locked
cargo deny check
cargo hack clippy --locked --workspace --all-targets --feature-powerset
cargo hack build --locked --workspace --all-targets --feature-powerset
cargo hack nextest run --locked --workspace --feature-powerset --no-tests pass
cargo test --locked --workspace --all-features --doc
cargo doc --locked --workspace --all-features --no-deps
