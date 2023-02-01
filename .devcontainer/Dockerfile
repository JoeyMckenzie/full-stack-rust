FROM mcr.microsoft.com/devcontainers/rust:0-1-bullseye

# We'll need to add node so we can use git hooks with husky
ARG NODE_VERSION=19

# Add the personal package archive from NodeSource so we can use the latest versions of node
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo -E bash -

# Include lld linker to improve build times either by using environment variable
# RUSTFLAGS="-C link-arg=-fuse-ld=lld" or with Cargo's configuration file (i.e see .cargo/config.toml).
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install clang lld default-mysql-client nodejs \
    && apt-get autoremove -y \
    && apt-get clean -y

# Optional: if you'd like to use pnpm instead, enabled it via corepack
RUN sudo corepack enable

# Add trunk, sqlx, and other dependencies
RUN cargo install --locked trunk \
    && cargo install --locked cargo-make \
    && cargo install --locked sqlx-cli --no-default-features --features native-tls,mysql \
    && cargo install --locked mdbook \
    && cargo install --locked cargo-generate

# Setup PlanetScale versions to install into the container
ARG PSCALE_VERSION=0.125.0
ARG PSCALE_DEB=pscale_${PSCALE_VERSION}_linux_amd64.deb
ARG PSCALE_DEB_URL=https://github.com/planetscale/cli/releases/download/v${PSCALE_VERSION}/pscale_${PSCALE_VERSION}_linux_amd64.deb

# Install the pscale CLI to manage our database
RUN sudo wget ${PSCALE_DEB_URL} \
    && sudo dpkg -i ${PSCALE_DEB} \
    && rm -f ${PSCALE_DEB}
