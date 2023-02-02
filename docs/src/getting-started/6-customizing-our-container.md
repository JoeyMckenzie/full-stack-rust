# Customizing our container

Great, so we've got our dev container spun up and ready to roll. Though our container is ready for us to write Rust code, we're missing the individual tools and CLIs we'll need for local development. Luckily, we can customize our container definition with a custom `Dockerfile` so that when our container is initially built (and rebuilt), we won't need to jump into the command line to install those tools every time we choose to rebuild our container.

Let's add a `Dockerfile` under our `.devcontainer` folder:

```dockerfile
FROM mcr.microsoft.com/devcontainers/rust:0-1-bullseye

# Include lld linker to improve build times either by using environment variable
# RUSTFLAGS="-C link-arg=-fuse-ld=lld" or with Cargo's configuration file (i.e see .cargo/config.toml).
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install clang lld default-mysql-client \
    && apt-get autoremove -y \
    && apt-get clean -y

# Add trunk, sqlx, and other dependencies
RUN cargo install --locked trunk \
    && cargo install --locked cargo-make \
    && cargo install --locked sqlx-cli --no-default-features --features native-tls,mysql \
    && cargo install --locked mdbook

# Optional: if you're getting errors regarding missing wasm target, add it
RUN rustup target add wasm32-unknown-unknown
```

Part of this file is ripped directly from [Microsoft's](https://github.com/microsoft/vscode-dev-containers/) officially curated `Dockerfile`s. The tools we'll need (at least for now) will be installed on our container on every build. If another developer comes along to the team, no need to mess with the complex environment setup on their work machine!

Let's tell the dev container runner to use our `Dockerfile` instead of the predefined base image in our `.devconatiner/devcontainer.json` file:

```json
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/rust
{
 "name": "Full stack Rust",
 // Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
 "dockerFile": "Dockerfile",
    
    // Other configurations...
}
```

With everything in place, go ahead and rebuild your container through VS Code. After a short wait, VS Code should reload and we should be right back where we left off!
