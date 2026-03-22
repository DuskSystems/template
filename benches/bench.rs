//! Benchmark.

use core::hint::black_box;

use divan::AllocProfiler;
use {{ crate_name }}::add;

#[global_allocator]
static ALLOC: AllocProfiler = AllocProfiler::system();

fn main() {
    divan::main();
}

#[divan::bench]
fn example() -> u64 {
    add(black_box(1), black_box(1))
}
