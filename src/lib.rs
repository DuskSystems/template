//! {{ description }}

/// Adds two numbers.
#[must_use]
pub const fn add(left: u64, right: u64) -> u64 {
    left.saturating_add(right)
}
