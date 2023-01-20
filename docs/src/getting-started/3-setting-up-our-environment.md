# Setting up our environment

Now to put our fingers on keyboard, so to speak. As our project begins to expand, we'll want to ensure a seamless developer setup experience, making the onboard process for newer devs easy and hassle free. For our local development, we'll obviously need a Rust installation and few tools to ensure we can work within the context of any project at any given time.

## Dev tools

Since we'll be using yew and sqlx, we'll need two tools to help us serve compiled static content from yew and perform various database tasks with sqlx. Luckily, we can lean on a CLI for each tool in [trunk](https://trunkrs.dev/) and the [sqlx CLI](https://lib.rs/crates/sqlx-cli/).

Trunk will be our tool of chose to work on the UI locally, build the output files required to run on a web server _somewhere_ (more on this later), and perform various web dev things we'll need while developing the UI.

With the help of the sqlx CLI, we'll be able to run migrations and do a bit of schema caching to make sure our compile-time query checks still work even if we can't talk to our database, such as while running through CI.

To make iteration on our changes a bit faster, we'll also leverage [`cargo-watch`](https://lib.rs/crates/cargo-watch/) so we can make incremental changes to our source code without having to restart our dev server everytime.

## Workspace tools

As we begin to leverage more than a single tool/CLI during our development workflow, it would be helpful to bring a task coordinator to help us wrangle up all the various commands we'll be running to work locally, create build output bundles, lint and format our workspace, etc. This is where we'll bring in [`cargo-make`](https://sagiegurari.github.io/cargo-make/), a cargo-based task runner based on [Makefiles](https://makefiletutorial.com/).

`cargo-make` will allow us to encapsulate all the various CLI snippets we'll run often into a single file (which we can extend, if needed), and pass off responsibility of running those commands to `cargo-make` itself. Not only will `cargo-make` help ease the obfuscation of the several different CLIs we'll be interacting with, we can also provide dependencies to individual tasks to ensure certain tasks are run before running another task that may depend on a previous command.

An example of this would be running our web app and ensuring the database server is up and running. If we were using a Docker approach (spoiler alert: we will be!), for our web app to properly spin up and be able to serve requests, we'd need the local database container to be up and running as well. With `cargo-make` tasks, we can define a two commands with one to run the web app dev server and one to start the database container, while adding the latter command as a dependency to run everytime we run the former command. Pretty neat!
