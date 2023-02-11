# Verifying our environment

So we've spun up an entire environment ready for development, but before we do so, let's run through a quick sanity check.

Let's verify each of our tools is installed and ready to go. 

First, let's verify our Rust installation. In the VS Code console (make sure you're connected to your container): 

```bash
/workspaces/full stack-rust $ rustc --version && cargo --version
rustc 1.66.1 (90743e729 2023-01-10)
cargo 1.66.1 (ad779e08b 2023-01-10)
```

Sweet! Next, let's verify trunk and cargo-make are good to go:

```bash
/workspaces/full stack-rust $ trunk --version && cargo make --version
trunk 0.16.0
cargo-make 0.36.3
```

Looking good so far. Let's finally verify our sqlx version:

```bash
/workspaces/full stack-rust $ sqlx --version
sqlx-cli 0.6.2
```

All set, the tools we'll need (for now) are ready to go and we can start writing some code!
