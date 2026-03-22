//! Development tasks.

use core::error::Error;

use clap::Command;

const EXAMPLE: &str = "example";

fn cli() -> Command {
    let example = Command::new(EXAMPLE).about("An example task");

    Command::new("xtask")
        .about("Development tasks for {{ project-name }}")
        .subcommand_required(true)
        .arg_required_else_help(true)
        .subcommand(example)
}

fn main() -> Result<(), Box<dyn Error>> {
    let matches = cli().get_matches();
    match matches.subcommand() {
        Some((EXAMPLE, _matches)) => Ok(()),
        _ => Err("Unknown command".into()),
    }
}
