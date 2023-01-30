FROM mcr.microsoft.com/devcontainers/rust:0-1-bullseye

# Include lld linker to improve build times either by using environment variable
# RUSTFLAGS="-C link-arg=-fuse-ld=lld" or with Cargo's configuration file (i.e see .cargo/config.toml).
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install clang lld default-mysql-client python3-pip \
    && apt-get autoremove -y \
    && apt-get clean -y

# Add trunk, sqlx, and other dependencies
RUN cargo install trunk \
    && cargo install cargo-make \
    && cargo install sqlx-cli --no-default-features --features native-tls,mysql \
    && cargo install mdbook

# Add pre-commit through the use of pip
RUN pip3 install pre-commit

# Setup PlanetScale versions to install into the container
ARG PSCALE_VERSION=0.125.0
ARG PSCALE_DEB=pscale_${PSCALE_VERSION}_linux_amd64.deb
ARG PSCALE_DEB_URL=https://github.com/planetscale/cli/releases/download/v${PSCALE_VERSION}/pscale_${PSCALE_VERSION}_linux_amd64.deb

# Install the pscale CLI to manage our database
RUN sudo wget ${PSCALE_DEB_URL} \
    && sudo dpkg -i ${PSCALE_DEB} \
    && rm -f ${PSCALE_DEB}
