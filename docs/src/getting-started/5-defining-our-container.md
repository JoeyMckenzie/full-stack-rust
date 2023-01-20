# Defining our container

So we're set on using dev containers... how do we set on up? Luckily, VS Code [has us covered](https://code.visualstudio.com/docs/devcontainers/create-dev-container/) with a fantastic [extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers/) to help us bootstrap our containerized developer environment.

Okay, I _promise_ we're actually going to start writing some code now. Regardless of your operating system, the only prerequisite we require as of now is a valid [Docker](https://www.docker.com/) installation on your machine. Once you've verified Docker has been installed, let's go ahead and spin up a new directory for our project.

In your favorite terminal, punch in the following:

```bash
mkdir full-stack-rust && cd full-stack-rust
```

I'll be using VS Code for our journey here, but you're more than welcome to use the editor of your choice. VS Code has great integration with dev containers, allowing us to focus more on the code than our environment. Go ahead and install the aforementioned VS Code dev container extension, and once you've opened your newly created directory in VS Code, we'll go ahead and add some dev container files to create a container definition for the context we'll be working in.

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

So far so good. Not too many options are pre-configured for us, and the only property we're concerned about _so far_ is the `image` value. We see that it's pulling a base image from Microsoft's container registry with rust pre-configured for us. Sweet!

## Running our container

Now the fun part - starting our container! To make things easy on us, the dev container extension offers options to start our container, but there's also a [CLI](https://containers.dev/supporting#devcontainer-cli) if you're more inclined to handle container management in your terminal. At the end of the day, all we're doing is simply managing local Docker containers. Back in VS Code let's take a look at the dev container options again. 

Open the options menu for the Dev Containers extension like we did before and take a look at the build options. We should see an option to build/rebuild our container - go ahead and select the option to build the container. We should have VS Code open in a new window and a message on the bottom indicating our container is being built!

Taking a look at the output log by clicking on the toast message reveals the normal Docker process of pulling base images, installing things, copying things, etc. Once it's all said and done, we should be in a new window. Crack open the terminal with a `ctrl` + ` (backtick) and take a look at the base path of the current directory.