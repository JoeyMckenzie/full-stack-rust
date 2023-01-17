# Definining our container

So we're set on using dev containers... how do we set on up? Luckily, VS Code [has us covered](https://code.visualstudio.com/docs/devcontainers/create-dev-container/) with a fantastic [extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers/) to help us bootstrap our containerized developer environment.

Okay, I _promise_ we're actually going to start writing some code now. Regardless of your operating system, the only prequisite we require as of now is a valid [Docker](https://www.docker.com/) installation on your machine. Once you've verified Docker has been installed, let's go ahead and spin up new directory for our project.

In your favorite terminal, punch in the following:

```bash
mkdir fullstack-rust && cd fullstack-rusts
```

I'll be using VS Code for our journey here, but you're more than welcome to use the editor of your choice. VS Code has great integration with dev containers, allowing us to focus more on the code than our environment. Go ahead and install the aforemention VS Code dev container extension, and once you've opened your newly created directory in VS Code, we'll go ahead and add some dev container files to create a container definition for the context we'll be working in.

Thankfully for us, Microsoft maintains a [repository of container templates](https://github.com/microsoft/vscode-dev-containers) for us to tap into. Since we'll be writing lots of Rust code, we need a base image that has the Rust SDK and `cargo` ready to roll. Hitting a `ctrl` + `shift` + `p` on the keyboard (or the Mac equivalent) and typing in `dev containers` to the search input reveals a plethora of options offered by the dev container extension.

Selecting `Dev Containers: Add Dev Container Configuration Files...` brings us to yet another dropdown menu, where this time we'll punch in `rust` to the search input. If you don't see a definition, go ahead and select the option to see all definitions, where another search of `rust` reveals the officially supported Rust dev container option. Go ahead and select the option (just `Rust`, not the `Rust & Postgres` option) followed by selecting the `bullseye` build for a slimmer container, and take a look at the generated files the extension created for us.

We should see a new folder named `.devcontainer` with a single file underneath it in `devcontainer.json`. Crack this bad boy open and take a look at the file content inside:

```json
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/rust
{
 "name": "Rust",
 // Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
 "image": "mcr.microsoft.com/devcontainers/rust:0-1-bullseye"

 // Features to add to the dev container. More info: https://containers.dev/features.
 // "features": {},

 // Use 'forwardPorts' to make a list of ports inside the container available locally.
 // "forwardPorts": [],

 // Use 'postCreateCommand' to run commands after the container is created.
 // "postCreateCommand": "rustc --version",

 // Configure tool-specific properties.
 // "customizations": {},

 // Uncomment to connect as root instead. More info: https://aka.ms/dev-containers-non-root.
 // "remoteUser": "root"
}
```
