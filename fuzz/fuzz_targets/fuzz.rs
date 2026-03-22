//! Fuzz.

#![no_main]

use libfuzzer_sys::fuzz_target;
use {{ crate_name }}::add;

fuzz_target!(|values: (u64, u64)| {
    let _unused = add(values.0, values.1);
});
