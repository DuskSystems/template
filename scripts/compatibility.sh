#!/usr/bin/env -S nix develop .#ci-compatibility --command bash
set -euxo pipefail

unset CARGO_PROFILE_DEV_CODEGEN_BACKEND

cargo hack build --locked --lib --package {{ project-name }} --feature-powerset
cargo hack build --locked --lib --package {{ project-name }} --feature-powerset --target thumbv6m-none-eabi
cargo hack build --locked --lib --package {{ project-name }} --feature-powerset --target wasm32-unknown-unknown
