use std::io::{self, Write};

use clap::{Parser, Subcommand};

#[derive(Debug, Parser)]
#[clap(name = "pswitch")]
#[clap(about = "A port switcher using pactl", long_about = None)]
struct Cli {
    #[clap(subcommand)]
    command: Commands,
}

#[derive(Debug, Subcommand)]
enum Commands {
    // Status checks current port in use
    Status,

    // Switches port used
    #[clap(arg_required_else_help = true)]
    Switch {
        port: String,
    },
}

fn main() {
    let args = Cli::parse();

    match args.command {
        Commands::Status => {
            let buffer = std::process::Command::new("pactl")
                .arg("list")
                .arg("sinks")
                .output()
                .expect("Failed to execute process");
            io::stderr().write_all(&buffer.stderr).unwrap();

            let status = match std::str::from_utf8(&buffer.stdout) {
                Ok(v) => v,
                Err(e) => panic!("Invalid UTF-8 sequence: {}", e),
            };

            for line in status.lines() {
                if line.contains("Active Port:") {
                    println!(
                        "{}",
                        line.split('-').last().expect("Did not find current Port")
                    );
                }
            }
        }
        Commands::Switch { port } => {
            let buffer = std::process::Command::new("pactl")
                .arg("get-default-sink")
                .output()
                .expect("Failed to get default sink from 'pactl");

            let sink = match std::str::from_utf8(&buffer.stdout) {
                Ok(v) => v,
                Err(e) => panic!("Invalid UTF-8 sequence: {}", e),
            };

            let output = std::process::Command::new("pactl")
                .arg("set-sink-port")
                .arg(&sink.trim())
                .arg(&port.trim())
                .output()
                .expect("Failed to execute process");

            // If error
            io::stderr().write_all(&output.stderr).unwrap();
        }
    }
}
